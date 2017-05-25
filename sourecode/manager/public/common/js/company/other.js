myApp.controller('DetailOtherCtrl', function ($scope, RestAPI, $routeParams, $uibModal) {
    var id = $routeParams.id;
    $scope.displayParams = [38, 41, 44, 188];
    $scope.noneEditParams = [40, 43, 46, 190];
    $scope.getAllParams = function () {
        RestAPI.do('get', 'params/params', {'type': $scope.type_report.value, 'flag': 1},
            function (data, status) {
                if (data.success) {
                    $scope.params = data.result;
                    $scope.getValues();
                } else {
                    alert(data.error);
                }
            }, function (data, status) {
                alert('Error: Get params values');
            });

    };
    $scope.getValues = function () {
        getTemplateValues();
    };

    $scope.addTemplateValue = function (data, p_template) {
        // add value to table "f_detail
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            backdrop: 'static',
            keyboard: false,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'EditDetailOtherContent.html',
            controller: 'DetailOtherAdjustCtrl',
            size: '200x200',
            resolve: {
                info: function () {
                    var info = {'company_id': id, 'p_id': data.id, 'p_template': p_template, 'year': $scope.year, 'p_title': data.title};
                    return info;
                }
            }
        });
        modalInstance.result.then(function () {
            $scope.getValues();
        });
    };

    $scope.editTemplateValue = function (data, p_template, values) {
        // add value to table "f_detail"
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            backdrop: 'static',
            keyboard: false,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'EditDetailOtherContent.html',
            controller: 'DetailOtherAdjustCtrl',
            size: '200x200',
            resolve: {
                info: function () {
                    var info = {'company_id': id, 'p_id': data.id, 'p_template': p_template, 'year': $scope.year, 'values': values, 'p_title': data.title};
                    return info;
                }
            }
        });
        modalInstance.result.then(function () {
            getTemplateValues();
        });
    };

    $scope.delTemplateValue = function (id) {
        if (confirm('Are you sure you want to delete this?')) {
            RestAPI.do('put', 'company/other/delDetail', {id: id},
                function (data, status) {
                    if (data.success)getTemplateValues();
                    else alert(data.error);
                }, function (data, status) {
                    alert('Error: Del template value');
                })
        }
    };

    function getTemplateValues() {
        RestAPI.do('get', 'company/other/', {'id': id, 'year': $scope.year},
            function (data, status) {
                if (data.success) {
                    $scope.values = data.result;
                } else {
                    alert(data.error);
                }
            }, function (data, status) {
                alert('Error: Get template values');
            });
    }

    function init() {
        $scope.type_reports = TYPE_REPORT;
        $scope.type_report = $scope.type_reports[0];
        $scope.years = [];
        var today = new Date().getFullYear();
        for (var i = today - 1; i >= 2000; i--) $scope.years.push(i);
        $scope.year = today - 1;

        $scope.params = null;
        $scope.values = null;
        $scope.b_part_values = null;

        $scope.getAllParams();
    }

    init();
});

myApp.controller('DetailOtherAdjustCtrl', function ($scope, info, $uibModalInstance, RestAPI) {
    $scope.header = info.p_title;
    $scope.p_id = info.p_id;
    $scope.titles = info.p_template;
    $scope.noneEditParams = [40, 43, 46, 190];
    $scope.values = {};
    if ('values' in info) {
        $scope.values = Object.create(info.values);
        $scope.btnSubmit = 'Save';
    } else {
        $scope.btnSubmit = 'Add';
    }
    var company_id = info.company_id;
    var year = info.year;

    $scope.ok = function (valid) {
        if (valid) {
            if ('values' in info) {
                var data_json = {
                    'id': info.values.id,
                    'title': $scope.values['title'],
                    'value': JSON.stringify($scope.values)
                };
                RestAPI.do('put', 'company/other/updateDetail', data_json,
                    function (data, status) {
                        if (data.error)alert(data.error);
                        $uibModalInstance.close();
                    }, function (data, status) {
                        $uibModalInstance.close();
                    });
            } else {
                var data_json = {
                    'params': {
                        'p_id': info.p_id,
                        'c_id': info.company_id,
                        'year': info.year,
                        'title': $scope.values['title'],
                        'value': JSON.stringify($scope.values)
                    }
                };
                RestAPI.do('post', 'company/other/addDetail', data_json,
                    function (data, status) {
                        if (data.error)alert(data.error);
                        $uibModalInstance.close();
                    }, function (data, status) {
                        $uibModalInstance.close();
                    });
            }
        }
    }
    $scope.cancel = function () {
        $uibModalInstance.dismiss('Cancel');
    }
    function closeModal() {
        $uibModalInstance.close();
    }
});
