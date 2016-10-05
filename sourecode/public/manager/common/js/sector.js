myApp.controller('SectorCtrl', function($scope, $uibModal, RestAPI) {
    var btnType = ['Submit','Save', 'Add'];
    $scope.flag = 0;//0-default, 1-edit, 2-add
    $scope.sectors = [];

    $scope.getAllFloors = function () {
        RestAPI.do('get', 'sector/sectors', '',
            function (data, status) {
                if (data.success) {
                    $scope.sectors = data.result;
                }
            }, function (data, status) {
            })
    }
    $scope.getAllFloors();

    $scope.edit=function(s){
        $scope.flag=1;
        reset();
        $scope.sector.id= s.id;
        $scope.sector.name= s.name;
    };

    $scope.add=function(){
        $scope.flag=2;
        reset();
    };

    $scope.del=function($e, id){
        $e.stopPropagation();
        RestAPI.do('put','sector/sector',{'id':id},
            function(data,status){
                if(data.success){
                    $scope.getAllFloors();
                }else{
                    alert(data.error);
                }
            });
    }

    $scope.ok = function () {
        RestAPI.do('post', 'sector/sector', {'params': {'id': $scope.sector.id, 'name': $scope.sector.name}},
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
    init();
    function init() {
        $scope.sector = new Object();
        $scope.sector.id = '';
        $scope.sector.name = '';
        $scope.btnSubmit = btnType[$scope.flag];

    }

    function reset(){
        $scope.sector.id = '';
        $scope.sector.name = '';
        $scope.btnSubmit = btnType[$scope.flag];
    }
});
