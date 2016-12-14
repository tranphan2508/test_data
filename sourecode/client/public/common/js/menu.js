myApp.controller('MenuCtrl', function ($scope, $location, UserInfoService, RestAPI) {
    $scope.hashPart = '#' + $location.path();
    if ($location.path() == '/')$scope.hashPart = '#/stock/company-AZ';
    $scope.accountName = UserInfoService.getName();

    $scope.logout = function () {
        RestAPI.do('get', 'customer/authority/logout', null,
            function (data, status) {
                if (data.success) {
                    UserInfoService.clearUserInfo();
                    $location.path('/login');
                } else {
                    alert(data);
                }
            });
    }
});