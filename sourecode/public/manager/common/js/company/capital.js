myApp.controller('DetailCapitalCtrl', function ($scope, RestAPI, $routeParams, $uibModal) {
    var id = $routeParams.id;

    $scope.add = function () {
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            ariaLabelledBy: 'modal-title',
            backdrop: 'static',
            keyboard: false,
            ariaDescribedBy: 'modal-body',
            templateUrl: 'addCompanyCapitalModal.html',
            controller: 'AddCompanyCapitalCtrl',
            //size: '200x200',
            resolve: {
                'company_id': function () {
                    return id;
                }
            }
        });
        modalInstance.result.then(function () {
            getCapitalHistory();
        });
    };

    $scope.edit = function (capital) {
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            backdrop: 'static',
            keyboard: false,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'editCompanyCapitalModal.html',
            controller: 'EditCompanyCapitalCtrl',
            //size: '200x200',
            resolve: {
                'capital': function () {
                    return capital;
                }
            }
        });
        modalInstance.result.then(function () {
            getCapitalHistory();
        });
    };

    $scope.del = function (capital) {
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
                    var message='Are you sure to delete this record?';
                    return message;
                }
            }
        });
        modalInstance.result.then(function () {
            var param = {'id': capital.id};
            RestAPI.do('put', 'company/capital/delCapHistory', param,
                function (data, status) {
                    if (data.success) {
                        getCapitalHistory();
                    } else {
                        alert(data.error);
                    }
                });
        });
    }

    function getCapitalHistory() {
        var today = new Date().getFullYear();
        var param = {'id': id}
        RestAPI.do('get', 'company/capital/capHistory', param,
            function (data, status) {
                if (data.success) {
                    $scope.capitals = data.result;
                } else {
                    alert(data.error);
                }
            });
    }

    function init() {
        $scope.capitals = null;
        getCapitalHistory();
    }

    init();
});

myApp.controller('AddCompanyCapitalCtrl', function ($scope, $uibModalInstance, RestAPI, company_id, $filter) {
    $scope.ok = function (valid) {
        if (valid) {
            var data_json = {
                'params': {
                    'company_id': company_id,
                    'reason': $scope.reason,
                    'quantity': $scope.quantity,
                    'price': $scope.price,
                    'list_date': $filter('date')($scope.list_date, 'yyyy-MM-dd') + ' 00:00:00'
                }
            };
            RestAPI.do('post', 'company/capital/capHistory', data_json,
                function (data, status) {
                    if (data.success) {
                        $uibModalInstance.close();
                    } else {
                        alert(data.error);
                    }
                }, function (data, status) {
                });
        }

    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('Cancel');
    };

    // Disable weekend selection
    function disabled(data) {
        var date = data.date,
            mode = data.mode;
        return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
    }

    function init() {
        $scope.dateOptions = {
            dateDisabled: disabled,
            formatYear: 'yy',
            startingDay: 1
        };
        $scope.format = 'yyyy-MM-dd';
        $scope.date = {'opened': false};
    }

    init();

});

myApp.controller('EditCompanyCapitalCtrl', function ($scope, $uibModalInstance, RestAPI, capital, $filter) {
    capital.quantity = parseInt(capital.quantity);
    capital.price = parseInt(capital.price);
    capital.list_date = new Date(capital.list_date);
    $scope.capital = $.extend(true, {}, capital);
    $scope.ok = function (valid) {
        if (valid) {
            var param = {
                'id': capital.id,
                'reason': $scope.capital.reason,
                'quantity': $scope.capital.quantity,
                'price': $scope.capital.price,
                'list_date': $filter('date')($scope.capital.list_date, 'yyyy-MM-dd') + ' 00:00:00'
            };
            RestAPI.do('put', 'company/capital/capHistory', param,
                function (data, status) {
                    if (data.success) {
                        $uibModalInstance.close();
                    } else {
                        alert(data.error);
                    }
                }, function (data, status) {
                });
        }

    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('Cancel');
    };

    // Disable weekend selection
    function disabled(data) {
        var date = data.date,
            mode = data.mode;
        return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
    }

    function init() {
        $scope.dateOptions = {
            dateDisabled: disabled,
            formatYear: 'yy',
            startingDay: 1
        };
        $scope.format = 'yyyy-MM-dd';
        $scope.date = {'opened': false};
    }

    init();

});