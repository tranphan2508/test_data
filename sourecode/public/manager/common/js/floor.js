myApp.controller('FloorCtrl', function ($scope, $uibModal, RestAPI) {
    var btnType = ['Add', 'Save'];
    var flag = 0;//0-default, 1-edit, 2-add
    $scope.text = 'floor';
    $scope.floors = [];

    $scope.getAllFloors = function () {
        RestAPI.do('get', 'floor/floors', '',
            function (data, status) {
                if (data.success) {
                    $scope.floors = data.result;
                }
            }, function (data, status) {
            })
    }
    $scope.getAllFloors();

    $scope.ok = function () {
        RestAPI.do('post', 'floor/floor', {'params': {'id': $scope.floor.id, 'name': $scope.floor.name, 'code': $scope.floor.code, 'link': $scope.floor.link}},
            function (data, status) {
                if (data.success) {
                    $scope.getAllFloors();
                } else {
                    alert(data.error);
                }
            });
    }
    $scope.cancel = function () {

    }
    init();
    function init() {
        $scope.floor = new Object();
        $scope.floor.id = '';
        $scope.floor.name = '';
        $scope.floor.code = '';
        $scope.floor.link = '';
        $scope.btnSubmit = btnType[flag];

    }
});
