myApp.controller('FloorCtrl', function ($scope, $uibModal, RestAPI) {
    var btnType = ['Submit','Save', 'Add'];
    $scope.flag = 0;//0-default, 1-edit, 2-add
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

    $scope.edit=function(f){
        $scope.flag=1;
        reset();
        $scope.floor.id= f.id;
        $scope.floor.name= f.name;
        $scope.floor.code= f.code;
        $scope.floor.link= f.link;
    };

    $scope.add=function(){
        $scope.flag=2;
        reset();
    };

    $scope.del=function($e, id){
        $e.stopPropagation();
        RestAPI.do('put','floor/floor',{'id':id},
        function(data,status){
            if(data.success){
                $scope.getAllFloors();
            }else{
                alert(data.error);
            }
        });
    }

    $scope.ok = function () {
        RestAPI.do('post', 'floor/floor', {'params': {'id': $scope.floor.id, 'name': $scope.floor.name, 'code': $scope.floor.code, 'link': $scope.floor.link}},
            function (data, status) {
                if (data.success) {
                    reset();
                    $scope.flag=0;
                    $scope.getAllFloors();
                } else {
                    alert(data.error);
                }
            });
    }
    $scope.cancel = function () {
        $scope.flag=0;
        reset();
    }

    function init() {
        $scope.floor = new Object();
        $scope.floor.id = '';
        $scope.floor.name = '';
        $scope.floor.code = '';
        $scope.floor.link = '';
        $scope.btnSubmit = btnType[$scope.flag];

    }

    function reset(){
        $scope.floor.id = '';
        $scope.floor.name = '';
        $scope.floor.code = '';
        $scope.floor.link = '';
        $scope.btnSubmit = btnType[$scope.flag];
    }

    init();
});
