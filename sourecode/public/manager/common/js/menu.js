myApp.controller('MenuCtrl', function ($scope, $location) {
    $scope.hashPart = '#' + $location.path();
    $scope.accountName = 'test';
    $scope.alert=function(e){
        alert(e);
    }
});