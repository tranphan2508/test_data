myApp.controller('ParamsCtrl', function ($scope, $uibModal, RestAPI) {

    $scope.type_reports = [
        {'value': 1, 'name': 'Balance Sheet'},
        {'value': 2, 'name': 'Income Statement'},
        {'value': 3, 'name': 'Statement of Cashflow'}
    ];
    $scope.type_report = $scope.type_reports[0];
    $scope.datas = [];

    $scope.add = function ($e, parent_id, level, title) {
        showPopup($e, parent_id, level, title, 1);
    }

    $scope.edit = function ($e, parent_id, level, title) {
        showPopup($e, parent_id, level, title, 2);
    }

    $scope.del = function ($e, parent_id, level, title) {
        showPopup($e, parent_id, level, title, 3);
    };

    function showPopup($e, param_id, level, title, flag) {
        $e.stopPropagation();
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'addParamContent.html',
            controller: 'ParamsAdjustCtrl',
            size: '200x200',
            resolve: {
                info: function () {
                    var info = {'id': param_id, 'title': title, 'type': $scope.type_report.value, 'flag': flag, 'level': level};
                    return info;
                }
            }
        });
        modalInstance.result.then(function () {
            $scope.getAllParams($scope.type_report.value);
        });
    };



    $scope.getAllParams=function(type) {
        RestAPI.do('get', 'params/params', {'type': type},
            function (data, status) {
                if (data.success) {
                    $scope.datas = data.result;
                } else {
                    //alert(data.error);
                }
            }, function (data, status) {
                //alert('Error 2');
            });

    }
    $scope.getAllParams(1);
});

myApp.controller('ParamsAdjustCtrl', function ($scope, info, $uibModalInstance, RestAPI) {
    $scope.info = info;
    if ($scope.info.flag == 1) {
        $scope.btnSubmit = 'Add';
        if ($scope.info.id != '0')$scope.message = 'Add new param into "' + $scope.info.title + '"';
        else $scope.message = 'Add new param';
    } else if ($scope.info.flag == 2) {
        $scope.btnSubmit = 'Save';
        $scope.message = 'Change "' + $scope.info.title + '" to';
    } else {
        $scope.btnSubmit = 'Del';
        $scope.message = 'Are you sure to delete "' + $scope.info.title + '"';
    }
    $scope.ok = function () {
        if($scope.title==undefined && $scope.info.flag!=3 ){alert('Please fill title');}
        else{
            switch ($scope.info.flag) {
                case 1:
                    var data_json={
                        'params':{'title': $scope.title, 'parent_id': $scope.info.id, 'type': $scope.info.type, 'level': parseInt($scope.info.level) + 1}
                    };
                    RestAPI.do('post', 'params/param', data_json,
                        function (data, status) {
                            if (data.success) {
                            }
                            else alert(data.error);
                            $uibModalInstance.close();

                        }, function (data, status) {
                            $uibModalInstance.close();
                        });
                    break;
                case 2:
                    RestAPI.do('put', 'params/updateTitle', {'id':$scope.info.id,'title':$scope.title},
                        function (data, status) {
                            if (data.success) {
                            }
                            else alert(data.error);
                            $uibModalInstance.close();

                        }, function (data, status) {
                            $uibModalInstance.close();
                        });
                    break;
                case 3:
                    RestAPI.do('put', 'params/delParam', {'id':$scope.info.id},
                        function (data, status) {
                            if (data.success) {
                            }
                            else alert(data.error);
                            $uibModalInstance.close();

                        }, function (data, status) {
                            $uibModalInstance.close();
                        });
                    break
                default:
                    break;
            }

        }

    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('Cancel');
    }
});

