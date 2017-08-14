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
                $browser.defer(listener) // Have to do this or changes don't get picked up properly
            })

            $element.bind('paste cut', function () {
                $browser.defer(listener)
            })
        }
    };
});

myApp.filter('fUnit', function () {
    return function (input, unit) {
        if (input != null) {
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
        return input;
    }
});

myApp.filter('fRatio', function () {
    return function (input, total) {
        if (input != null && input!= '' && total != null && total!= '') {
            var b_input = new BigNumber(input);
            var b_total = new BigNumber(total);
            var percent = (b_total.comparedTo(0) == 0) ? b_total : b_input.mul(100).dividedBy(b_total);
            return percent.toFormat(2);
        }
        return input;
    }
});

myApp.filter('fGrowth', function () {
    return function (input1, input2) {
        if (input1 != null && input2 != null) {
            var b_input = new BigNumber(input1);
            var b_prev_input = new BigNumber(input2);
            var percent = (b_prev_input.comparedTo(0) == 0) ? b_prev_input : (b_input.minus(b_prev_input)).mul(100).dividedBy(b_prev_input.abs());
            return percent.toFormat(2);
        }
        return '0';
    }
});

myApp.filter('fNumber', function (fUnitFilter, fRatioFilter, fGrowthFilter) {
    return function (input, prev_input, type, unit, format, year, total1, total2) {
        //unit: 1, 1000, 1000000
        //format: number, percentage
        //type: 1- balance sheet, 2- income statement, 3- cashflow
        //total1: tổng tài sản, tổng doanh thu hoạt động kinh doanh
        //total2: tiền và tương đương tiền cuối kỳ
        var result = input;
        if (input != null) {
            switch (format) {
                case 0:
                    if (type == '3' || type == '5') result = fRatioFilter(input, total2);
                    else result = fRatioFilter(input, total1);
                    break;
                case 1:
                    result = fUnitFilter(input, unit);
                    break;
                case 2:
                    result = fGrowthFilter(input, prev_input);
                    break;
            }
        }
        return result;
    }
});

myApp.filter('fNumber2', function (fUnitFilter, fRatioFilter, fGrowthFilter) {
    return function (input, prev_input, type, unit, format, year, key, totalObj) {
        //unit: 1, 1000, 1000000
        //format: number, percentage
        //type: 1- balance sheet, 2- income statement, 3- other
        //total:
        var result = input;
        if (input != null) {
            switch (format) {
                case 0:
                    var total;
                    var keyObj = Object.keys(totalObj);
                    total = totalObj[keyObj[keyObj.length - 1]][key][year];
                    result = fRatioFilter(input, total);
                    break;
                case 1:
                    result = fUnitFilter(input, unit);
                    break;
                case 2:
                    result = fGrowthFilter(input, prev_input);
                    break;
            }
        }
        return result;
    }
});

myApp.filter('hString', function () {
    return function (input) {
        if (input && input.indexOf('.')) return input.substr(input.indexOf('.') + 1, input.length);
        return input;
    }
});

