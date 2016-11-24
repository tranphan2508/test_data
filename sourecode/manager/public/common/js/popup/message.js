myApp.controller('messageModalCtrl', function ($scope, $uibModalInstance, message) {
    $scope.message=message;

    $scope.ok=function(){
        $uibModalInstance.close();
    };

    $scope.cancel=function(){
        $uibModalInstance.dismiss('Cancel');
    };

});