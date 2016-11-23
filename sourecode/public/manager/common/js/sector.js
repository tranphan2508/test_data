myApp.controller('SectorCtrl', function($scope, $uibModal, RestAPI) {
    var btnType = ['Submit','Save', 'Add'];
    $scope.flag = 0;//0-default, 1-edit, 2-add
    $scope.sectors = [];

    $scope.getAllSectors = function () {
        RestAPI.do('get', 'sector/sectors', '',
            function (data, status) {
                if (data.success) {
                    $scope.sectors = data.result;
                }
            }, function (data, status) {
            })
    }
    $scope.getAllSectors();

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

    $scope.del=function($e, sector){
        $e.stopPropagation();
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            backdrop: 'static',
            keyboard: false,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'messageModal.html',
            controller: 'messageModalCtrl',
            //size: '200x200',
            resolve: {
                'message': function () {
                    var message='Are you sure to delete "'+sector.name+'" ?';
                    return message;
                }
            }
        });
        modalInstance.result.then(function () {
            RestAPI.do('put','sector/sector',{'id':sector.id},
                function(data,status){
                    if(data.success){
                        $scope.getAllSectors();
                    }else{
                        alert(data.error);
                    }
                });
        });

    }

    $scope.ok = function (valid){
        if(valid){
            RestAPI.do('post', 'sector/sector', {'params': {'id': $scope.sector.id, 'name': $scope.sector.name}},
                function (data, status) {
                    if (data.success) {
                        reset();
                        $scope.flag=0;
                        $scope.getAllSectors();
                    } else {
                        alert(data.error);
                    }
                });
        }
    };

    $scope.cancel = function () {
        $scope.flag=0;
        reset();
    }

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

    init();
});
