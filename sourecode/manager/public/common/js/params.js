myApp.controller('ParamsCtrl', function ($scope, $uibModal, RestAPI) {

    $scope.type_reports = TYPE_REPORT;
    $scope.type_report = $scope.type_reports[0];
    $scope.datas = [];

    $scope.add = function ($e, data=null) {
        if (data == null) {
            data = {'id': 0, 'level': 0, 'title': '', 'template': 0, 'p_template': null};
        }
        showPopup($e, data, 1);
    }

    $scope.edit = function ($e, data) {
        showPopup($e, data, 2);
    }

    $scope.del = function ($e, data) {
        showPopup($e, data, 3);
    };

    function showPopup($e, data, flag) {
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
                    var info = {'id': data.id, 'title': data.title, 'type': $scope.type_report.value,
                        'flag': flag, 'level': data.level, 'description': data.description,
                        'template': data.template, 'p_template': Object.create(data.p_template)};
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
                        'params': {'title': $scope.info.title, 'parent_id': $scope.info.id, 'type': $scope.info.type, 'level': parseInt($scope.info.level) + 1,
                            'description': $scope.info.description, 'template': $scope.info.template,
                            'p_template': JSON.stringify($scope.info.p_template)}
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
                    var data={'id': $scope.info.id, 'title': $scope.info.title, 'description': $scope.info.description, 'template': $scope.info.template,
                                'p_template': JSON.stringify($scope.info.p_template)};
                    RestAPI.do('put', 'params/updateTitle',data ,
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

