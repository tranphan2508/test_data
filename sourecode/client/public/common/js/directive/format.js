myApp.directive('numberInput', function ($filter, $browser) {
    return {
        require: 'ngModel',
        link: function ($scope, $element, $attrs, ngModelCtrl) {
            var listener = function () {
                var value = $element.val().replace(/,/g, '');
                var type = $element.val[0];
                if (type == undefined || (type != '-' && type != '+'))type = '';
                $element.val($filter('number')(type + value, false));
            }

            // This runs when we update the text field
            ngModelCtrl.$parsers.push(function (viewValue) {
                return viewValue.replace(/,/g, '');
            })

            // This runs when the model gets updated on the scope directly and keeps our view in sync
            ngModelCtrl.$render = function () {
                $element.val($filter('number')(ngModelCtrl.$viewValue, false));
            }

            //$element.bind('change', listener)
            $element.bind('keydown', function (event) {
                /*var key = event.keyCode
                 // If the keys include the CTRL, SHIFT, ALT, or META keys, or the arrow keys, do nothing.
                 // This lets us support copy and paste too
                 if (key == 91 || (15 < key && key < 19) || (37 <= key && key <= 40))
                 return*/


                $browser.defer(listener) // Have to do this or changes don't get picked up properly
            })

            $element.bind('paste cut', function () {
                $browser.defer(listener)
            })
        }
    };
});

// display string to number format
myApp.filter('toNumber', function () {
    return function (input) {
        var i = new BigNumber(input);
        return i.intPart;
    }
});

myApp.filter('nozero', function () {
    return function (input,prev_input, type, unit, format, year, total1, total2) {
        //unit: 1, 1000, 1000000
        //format: number, percentage
        //type: 1- balance sheet, 2- income statement, 3- cashflow
        //total1: tổng tài sản, tổng doanh thu hoạt động kinh doanh
        //total2: tiền và tương đương tiền cuối kỳ
        if (input != null) {
            if(type!='4'){
                if (format == '1') {
                    if (input == 0) input = null;
                    else {
                        switch (unit) {
                            case '1000':
                                input = input.length > 3 ? input.substring(0, input.length - 3) : '0';
                                break;
                            case '1000000':
                                input = input.length > 6 ? input.substring(0, input.length - 6) : '0';
                                break;
                            case '1000000000':
                                input = input.length > 9 ? input.substring(0, input.length - 9) : '0';
                                break;
                        }
                    }
                } else if(format=='0'){
                    if (type == '3' && total2 || type != '3' && total1) {
                        var b_total;
                        if (type == '3') {
                            b_total = new BigNumber(total2);
                        } else {
                            b_total = new BigNumber(total1);
                        }
                        var b_input = new BigNumber(input);
                        var percent = (b_input.comparedTo(0) == 0) ? '0' : b_input.dividedBy(b_total);
                        input = (percent != '0') ? percent.toFormat(4) : '0';
                    } else input = '0';
                }else{
                    if(prev_input){
                        var b_input=new BigNumber(input);
                        var b_prev_input=new BigNumber(prev_input);
                        var percent=(b_input.minus(b_prev_input)).dividedBy(b_prev_input);
                        input = (percent != '0') ? percent.toFormat(4) : '0';
                    }else input='0';

                }
            }
        }
        return input;
    }
});