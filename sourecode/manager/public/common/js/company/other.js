myApp.controller('DetailOtherCtrl', function ($scope, RestAPI, $routeParams, $uibModal) {
    var id = $routeParams.id;

    $scope.getAllParams = function () {
        RestAPI.do('get', 'params/params', {'type': $scope.type_report.value},
            function (data, status) {
                if (data.success) {
                    $scope.params = data.result;
                } else {
                    alert(data.error);
                }
            }, function (data, status) {
                alert('Error 2');
            });

    };

    $scope.getValues = function () {
        RestAPI.do('get', 'other/', {'id': id, 'type': $scope.type_report.value},
            function (data, status) {
                if (data.success) {
                    $scope.values = data.result;
                } else {
                    alert(data.error);
                }
            }, function (data, status) {
                alert('Error 2');
            });
    };

    $scope.addTemplateValue = function (data) {
    // add value to table "f_master_detail
    };

    function init() {
        $scope.type_reports = [
            {'value': 1, 'name': 'Balance Sheet'},
            {'value': 2, 'name': 'Income Statement'},
            {'value': 3, 'name': 'Statement of Cashflow (indirect)'},
            {'value': 5, 'name': 'Statement of Cashflow (direct)'}
        ];
        $scope.type_report = $scope.type_reports[0];
        $scope.years = [];
        var today = new Date().getFullYear();
        for (var i = today - 1; i >= 2000; i--) $scope.years.push(i);
        $scope.year = today - 1;

        $scope.params = null;
        $scope.values = null;

        $scope.getAllParams();
    }

    init();
});
