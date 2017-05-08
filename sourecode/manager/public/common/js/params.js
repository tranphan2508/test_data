myApp.controller('ParamsCtrl', function ($scope, $uibModal, RestAPI) {

    $scope.type_reports = [
        {'value': 1, 'name': 'Balance Sheet'},
        {'value': 2, 'name': 'Income Statement'},
        {'value': 3, 'name': 'Statement of Cashflow (indirect)'},
        {'value': 5, 'name': 'Statement of Cashflow (direct)'},
        {'value': 4, 'name': 'Financial Indicators'}
    ];
    $scope.type_report = $scope.type_reports[0];
    $scope.datas = [];

    $scope.add = function ($e, parent_id, level, title, template) {
        showPopup($e, parent_id, level, '', 1, '', template);
    }

    $scope.edit = function ($e, parent_id, level, title, des,template) {
        showPopup($e, parent_id, level, title, 2, des,template);
    }

    $scope.del = function ($e, parent_id, level, title) {
        showPopup($e, parent_id, level, title, 3, '','');
    };

    function showPopup($e, param_id, level, title, flag, description, template) {
        $e.stopPropagation();
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            backdrop: 'static',
            keyboard: false,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'addParamContent.html',
            controller: 'ParamsAdjustCtrl',
            size: '200x200',
            resolve: {
                info: function () {
                    var info = {'id': param_id, 'title': title, 'type': $scope.type_report.value, 'flag': flag, 'level': level, 'description': description, 'template':template};
                    return info;
                }
            }
        });
        modalInstance.result.then(function () {
            $scope.getAllParams($scope.type_report.value);
        });
    };


    $scope.getAllParams = function (type) {
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
        $scope.message = 'Add new param';
    } else if ($scope.info.flag == 2) {
        $scope.btnSubmit = 'Save';
        $scope.message = 'Change "' + $scope.info.title + '" to';
    } else {
        $scope.btnSubmit = 'Del';
        $scope.message = 'Are you sure to delete "' + $scope.info.title + '"';
    }
    $scope.ok = function (valid) {
        switch ($scope.info.flag) {
            case 1:
                if (valid) {
                    var data_json = {
                        'params': {'title': $scope.info.title, 'parent_id': $scope.info.id, 'type': $scope.info.type, 'level': parseInt($scope.info.level) + 1, 'description': $scope.info.description,'template':$scope.info.template}
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
                }
                break;
            case 2:
                if (valid) {
                    RestAPI.do('put', 'params/updateTitle', {'id': $scope.info.id, 'title': $scope.info.title, 'description': $scope.info.description,'template':$scope.info.template},
                        function (data, status) {
                            if (data.success) {
                            }
                            else alert(data.error);
                            $uibModalInstance.close();

                        }, function (data, status) {
                            $uibModalInstance.close();
                        });
                }
                break;
            case 3:
                RestAPI.do('put', 'params/delParam', {'id': $scope.info.id},
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
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('Cancel');
    }
});

