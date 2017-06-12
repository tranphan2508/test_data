myApp.controller('DetailCompanyCtrl', function ($scope, RestAPI, $routeParams) {
    var id = $routeParams.id;

    $scope.getFinance = function () {
        var scope = angular.element('[ng-controller="financialReportCtrl"]').scope();
        scope.init();
    }
    //get information of company
    function getCompanyInfo() {
        RestAPI.do('get', 'company/companyByID', {'id': id},
            function (data, status) {
                if (data.success) {
                    $scope.companyInfo = data.result;
                } else {
                    alert(data.error);
                }
            })
    };

    function init() {
        $scope.companyInfo = null;
        $scope.tab = {'profile': true, 'finance': false};
        getCompanyInfo();
    }

    init();
});

