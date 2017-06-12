myApp.controller('CompanyProfileCtrl', function ($scope, RestAPI, $routeParams) {
    var id = $routeParams.id;


    //get profile information
    function getProfile() {
        RestAPI.do('get', 'company/profile/', {'id': id},
            function (data, status) {
                if (data.success) {
                    $scope.data=data.result;
                } else {
                    alert(data.error);
                }
            });
    }

    function init() {
        $scope.data = null;
        $scope.status={'open':false};
        getProfile();
    }

    init();

});