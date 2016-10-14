myApp.directive('updateStatus', function () {
    return {
        restrict: 'A',
        scope:{
            updateStatus:'='
        },
        link: function (scope, element, attrs) {
            // set the initial value of the textbox
            element.val(scope.updateStatus);
            element.data('old-value', scope.updateStatus);

            // detect outside changes and update our input
            scope.$watch('myDirective', function (val) {
                element.val(scope.updateStatus);
            });

            // on blur, update the value in scope
            element.bind('propertychange keyup paste', function (blurEvent) {
                if (element.data('old-value') != element.val()) {
                    element.addClass('insert');
                    scope.$apply(function () {
                        scope.myDirective = element.val();
                        element.data('old-value', element.val());
                    });
                }
            });
        }
    };
});