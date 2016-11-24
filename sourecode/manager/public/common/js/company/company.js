myApp.controller('CompanyCtrl', function ($scope, $uibModal, RestAPI) {
    $scope.companies = [];
    $scope.status = ['private', 'public'];

    $scope.add = function () {
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            backdrop: 'static',
            keyboard: false,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'addCompanyModal.html',
            controller: 'AddCompanyCtrl',
            //size: '200x200',
            resolve: {
            }
        });
        modalInstance.result.then(function () {
            getAllCompanies();
        });
    };

    $scope.edit = function ($e, comp) {
        $e.stopPropagation();
        var modalInstance = $uibModal.open({
            animation: this.animationsEnabled,
            backdrop: 'static',
            keyboard: false,
            ariaLabelledBy: 'modal-title',
            ariaDescribedBy: 'modal-body',
            templateUrl: 'editCompanyModal.html',
            controller: 'EditCompanyCtrl',
            //size: '200x200',
            resolve: {
                'company': function () {
                    var company = {
                        'id': comp.id,
                        'name': comp.name,
                        'code': comp.code,
                        'sector_id': comp.sector_id,
                        'floor_id': comp.floor_id,
                        'description': comp.description,
                        'link': comp.link,
                        'public': comp.public
                    }
                    return company;
                }
            }
        });
        modalInstance.result.then(function () {
            getAllCompanies();
        });
    };

    $scope.del = function ($e, company) {
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
                    var message = 'Are you sure to delete "' + company.name + '"';
                    return message;
                }
            }
        });
        modalInstance.result.then(function () {
            RestAPI.do('put', 'company/delCompany', {'id': company.id},
                function (data, status) {
                    if (data.success) {
                        getAllCompanies();
                    } else {
                        alert(data.error);
                    }
                })
        });

    };

    function getAllCompanies() {
        RestAPI.do('get', 'company/companies', '',
            function (data, status) {
                if (data.success) {
                    $scope.companies = data.result;
                } else {
                    alert(data.error);
                }
            })
    };

    getAllCompanies();
});

//add new company
myApp.controller('AddCompanyCtrl', function ($scope, $uibModalInstance, RestAPI) {
    $scope.ok = function (valid) {
        if (valid) {
            var data_json = {
                'params': {
                    'name': $scope.name,
                    'code': $scope.code,
                    'sector_id': $scope.sector_id,
                    'floor_id': $scope.floor_id,
                    'description': $scope.description,
                    'link': $scope.link,
                    'public': $scope.public
                }
            };
            RestAPI.do('post', 'company/company', data_json,
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
    }

    function init() {
        $scope.sectors = null;
        $scope.floors = null;
        $scope.sector_id = '0';
        $scope.floor_id = '0';
        $scope.status = 0;
        getAllSectors();
        getAllFloors();
    }

    function getAllSectors() {
        RestAPI.do('get', 'sector/sectors', '',
            function (data, status) {
                if (data.success) {
                    $scope.sectors = data.result;
                }
            }, function (data, status) {
            });
    }

    function getAllFloors() {
        RestAPI.do('get', 'floor/floors', '',
            function (data, status) {
                if (data.success) {
                    $scope.floors = data.result;
                }
            }, function (data, status) {
            })
    }

    init();
});

//update company
myApp.controller('EditCompanyCtrl', function ($scope, $uibModalInstance, RestAPI, company) {
    $scope.company = company;
    $scope.ok = function (valid) {
        if (valid) {
            var data = {
                'id': $scope.company.id,
                'name': $scope.company.name,
                'sector_id': $scope.company.sector_id,
                'floor_id': $scope.company.floor_id,
                'description': $scope.company.description,
                'link': $scope.company.link,
                'public': $scope.company.public
            };
            RestAPI.do('put', 'company/company', data,
                function (data, status) {
                    if (data.success) {
                        $uibModalInstance.close();
                    } else {
                        alert(data.error);
                    }
                }, function (data, status) {
                });
        }

    }

    $scope.cancel = function () {
        $uibModalInstance.dismiss('Cancel');
    }

    init();
    function init() {
        getAllSectors();
        getAllFloors();
    }

    function getAllSectors() {
        RestAPI.do('get', 'sector/sectors', '',
            function (data, status) {
                if (data.success) {
                    $scope.sectors = data.result;
                }
            }, function (data, status) {
            });
    }

    function getAllFloors() {
        RestAPI.do('get', 'floor/floors', '',
            function (data, status) {
                if (data.success) {
                    $scope.floors = data.result;
                }
            }, function (data, status) {
            })
    }
});