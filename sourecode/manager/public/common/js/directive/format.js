myApp.directive('numberInput', function ($filter, $browser) {
    return {
        require: 'ngModel',
        link: function ($scope, $element, $attrs, ngModelCtrl) {
            var listener = function () {
                var value = $element.val().replace(/,/g, '');
                var type=$element.val[0];
                if(type== undefined || (type!='-' && type!='+'))type='';
                $element.val($filter('number')(type+value, false));
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
myApp.filter('isNumber', function() {
    return function(input) {
        if(isNaN(input))return false;
        return true;
    }
});

myApp.filter('nozero', function() {
    return function(input) {
        if(input==0) input=null;
        return input;
    }
});

myApp.filter('toDate', function($filter) {
    return function(input) {
        return $filter('date')(new Date(input),'dd-MM-yyyy');
    }
});

myApp.filter('toShareOutstanding', function() {
    return function(input, type1, type2 ) {
        if(type1==type2)
        return input;
        return null;
    }
});

myApp.filter('hString', function(){
    return function(input){
        if(input.indexOf('.')) return input.substr(input.indexOf('.')+1, input.length);
        return input;
    }
});

myApp.filter('range', function(){
    return function(input){
        var res = [];
        for (var i = 0; i < input; i++) {
            res.push(i + 1);
        }
        return res;
    }
});


