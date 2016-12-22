myApp.controller('DetailCompanyCtrl', function ($scope, $uibModal, RestAPI, $routeParams) {
    var id = $routeParams.id;
    $scope.companyInfo = null;
    $scope.edit = false;
    var original_values = null;
    var parent_params = null;
    //type of report options
    $scope.type_reports = [
        {'value': 1, 'name': 'Balance Sheet'},
        {'value': 2, 'name': 'Income Statement'},
        {'value': 3, 'name': 'Statement of Cashflow'},
        {'value': 4, 'name': 'Financial Indicators'}
    ];
    $scope.type_report = $scope.type_reports[0];

    //year options
    $scope.years = [];
    var today = new Date().getFullYear();
    for (var i = today - 1; i >= 2000; i--) $scope.years.push(i);
    $scope.year = today - 1;

    //get all params of report
    $scope.getAllParams = function () {
        RestAPI.do('get', 'params/params', {'type': $scope.type_report.value},
            function (data, status) {
                if (data.success) {
                    param_arr = data.result;
                    $scope.params = data.result;
                    $scope.getValues();
                } else {
                    alert(data.error);
                }
            });
        RestAPI.do('get', 'params/parentParams', {'type': $scope.type_report.value},
            function (data, status) {
                if (data.success) {
                    parent_params = data.result;
                } else {
                    alert(data.error);
                }
            });
    };

    //get all value of params
    $scope.getValues = function () {
        $scope.edit = false;
        var params = {'id': id,
            'year': $scope.year,
            'type': $scope.type_report.value};
        RestAPI.do('get', 'company/finance/values', params,
            function (data, status) {
                if (data.success) {
                    $scope.values = data.result;
                    original_values = $.extend(true, {}, data.result);
                } else {
                    alert(data.error);
                }
            })
    };

    $scope.cancel = function () {
        $scope.values = $.extend(true, {}, original_values);
        $scope.edit = !$scope.edit;
    };

    $scope.save = function () {
        var insert_values = [];
        var p_insert_value = {};
        var insert_elements = angular.element(document.getElementsByClassName("insert"));
        if (insert_elements.length > 0) {
            for (var i = 0; i < insert_elements.length; i++) {
                if (insert_elements[i].value == "" || insert_elements[i].value == null)insert_elements[i].value = 0;
                var new_value = new BigNumber(insert_elements[i].value);
                var str = insert_elements[i].name + '_' + new_value;
                insert_values.push(str);//paramID_value
                var p_id = insert_elements[i].name.replace('p', '');
                var old_value = 0;
                if (p_id in original_values) old_value = new BigNumber(original_values[p_id].value);
                if ($scope.type_report.value != '2') updateParentParamValue(p_insert_value, p_id, old_value, new_value);
            }
            if ($scope.type_report.value == '2') updateIncomeValue(p_insert_value);
            if ($scope.type_report.value == '3') updateCashflowValue(p_insert_value);

            for (var p_id in p_insert_value) {
                if (p_id == 149)p_insert_value[p_id] = p_insert_value[135].subtract(p_insert_value[p_id]);
                insert_values.push('p' + p_id + '_' + p_insert_value[p_id]);
            }

            var data_json = {
                'params': {
                    'company_id': id,
                    'type': $scope.type_report.value,
                    'year': $scope.year,
                    'insert': JSON.stringify(insert_values)
                }
            }
            RestAPI.do('post', 'company/finance/values', data_json,
                function (data, status) {
                    if (data.success) {
                        $scope.edit = false;
                        $scope.params = null;
                        RestAPI.do('get', 'params/params', {'type': $scope.type_report.value},
                            function (data, status) {
                                if (data.success) {
                                    $scope.params = data.result;
                                    $scope.getValues();
                                    if($scope.type_report.value!='3')$scope.updateIndicators();
                                } else {
                                    alert(data.error);
                                }
                            });

                    } else {
                        alert(data.error);
                    }
                }, function (data) {
                    alert(data);
                })
        } else {
            $scope.edit = !$scope.edit;
        }

    }

    //get information of company
    function getCompanyInfo() {
        RestAPI.do('get', 'company/companyByID', {'id': id},
            function (data, status) {
                if (data.success) {
                    $scope.companyInfo = data.result;
                } else {
                    alert(data.error);
                }
            })
    };


    //update balance sheet value
    function updateParentParamValue(arr, id, old_value, new_value) {
        var p_id = parent_params[id];
        if (p_id == '0')return;

        var val = new BigNumber(0);
        var p_val = new BigNumber(0);

        if (p_id in arr)val = new BigNumber(arr[p_id]);
        else if (p_id in original_values)val = new BigNumber(original_values[p_id].value);

        p_val = val.subtract(old_value).add(new_value);
        arr[p_id] = p_val;
        updateParentParamValue(arr, p_id, val, p_val);
    }

    //compute income statement value
    function updateIncomeValue(arr) {
        var val1 = new BigNumber($scope.values[113] ? $scope.values[113].value : 0);
        var val2 = new BigNumber($scope.values[114] ? $scope.values[114].value : 0);
        // Doanh thu thuan
        arr[115] = val1.subtract(val2);

        //loi nhuan gop
        val1.set(arr[115]);
        val2.set($scope.values[116] ? $scope.values[116].value : 0);
        arr[117] = val1.subtract(val2);

        //loi nhuan tu hoat dong kinh doanh
        arr[124] = arr[117];
        for (var i = 118; i <= 123; i++) {
            if (i != 120) {
                val1.set($scope.values[i] ? $scope.values[i].value : 0);
                if (i == 118 || i == 121) arr[124] = arr[124].add(val1);
                else arr[124] = arr[124].subtract(val1);
            }
        }

        //loi nhuan khac
        val1.set($scope.values[125] ? $scope.values[125].value : 0);
        val2.set($scope.values[126] ? $scope.values[126].value : 0);
        arr[127] = val1.subtract(val2);

        //tong loi nhuan ke toan truoc thue
        arr[128] = arr[127].add(arr[124]);

        //chi phi thue TNDN
        val1.set($scope.values[129] ? $scope.values[129].value : 0);
        val2.set($scope.values[130] ? $scope.values[130].value : 0);
        arr[131] = val1.add(val2);

        //loi nhuan sau thue thu nhap doanh nghiep
        arr[132] = arr[128].subtract(arr[131]);

        //loi nhuan sau thue cua co dong cty me
        val1.set($scope.values[133] ? $scope.values[133].value : 0);
        arr[134] = arr[132].subtract(val1);
    }

    //compute cashflow value
    function updateCashflowValue(arr) {
        var val1 = defaultNumber(arr, 135);
        var val2 = defaultNumber(arr, 159);
        var val3 = defaultNumber(arr, 172);

        //Luu chuyen tien thuan trong ky
        arr[184] = val1.add(val2).add(val3);

        //tien va tuong duong tien cuoi ky
        val1.set(arr[184]);
        val2.set(defaultNumber(arr, 185));
        val3.set(defaultNumber(arr, 186))
        arr[187] = val1.add(val2).add(val3);
    }

    //compute indicators
    $scope.updateIndicators=function() {
        var data_json = {
            'params': {
                'company_id': id,
                'year': $scope.year
            }
        }
        RestAPI.do('post', 'company/finance/indicator', data_json,
            function (data, status) {
                if (data.success) {
                    if($scope.type_report.value == '4')$scope.getValues();
                } else {
                    alert(data.error);
                }
            }, function (data) {
                alert(data);
            });
    }

    function defaultNumber(n, id) {
        var d = (id in n) ? n[id] : ((id in $scope.values) ? $scope.values[id].value : 0 );
        return new BigNumber(d);
    }

    function init() {
        getCompanyInfo();
        $scope.getAllParams();

    }


    init();


});

