myApp.controller('DetailCompanyCtrl', function ($scope, $uibModal, RestAPI, $routeParams) {
    var id = $routeParams.id;
    $scope.companyInfo = null;
    $scope.edit = false;
    var original_values = null;
    var parent_params = null;
    //type of report options
    $scope.type_reports = TYPE_REPORT;
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
                var p_name = insert_elements[i].name.split('_');
                var str = p_name[0] + '_' + new_value;
                insert_values.push(str);//paramID_value
                var p_id = p_name[1];
                var col_id = 'col_id'+p_name[0];
                var old_value = 0;
                if (col_id in original_values) old_value = new BigNumber(original_values[col_id]);
                if ($scope.type_report.value != '2' && $scope.type_report.value != '4') updateParentParamValue(p_insert_value, p_id, old_value, new_value);
            }
            if ($scope.type_report.value == '2') updateIncomeValue(p_insert_value);
            if ($scope.type_report.value == '3') {
                updateCashflowValue(p_insert_value,false);
                if(p_insert_value[getColID(149)])p_insert_value[getColID(149)] = p_insert_value[getColID(135)].subtract(p_insert_value[getColID(149)]);
            }
            if ($scope.type_report.value == '5') {
                updateCashflowValue(p_insert_value,true);
            }

            for (var p_id in p_insert_value) {
                insert_values.push( p_id + '_' + p_insert_value[p_id]);
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
                                    $scope.updateIndicators();
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
        var p_id = parent_params[id]['p_id'];
        if (p_id == '0')return;
        var col_id = parent_params[p_id]['col_id'];
        var val = new BigNumber(0);
        var p_val = new BigNumber(0);

        if (col_id in arr)val = new BigNumber(arr[col_id]);
        else if (('col_id'+col_id) in original_values)val = new BigNumber(original_values['col_id'+col_id]);

        p_val = val.subtract(old_value).add(new_value);
        arr[col_id] = p_val;
        updateParentParamValue(arr, p_id, val, p_val);
    }

    function getColID(id){
        return  parent_params[id]? parent_params[id]['col_id'] : 0;
    }
    function getNameCol(id){
        return  'col_id'+parent_params[id]['col_id'];
    }
    //compute income statement value
    function updateIncomeValue(arr) {
        var val1 = new BigNumber($scope.values[getNameCol(113)] ? $scope.values[getNameCol(113)] : 0);
        var val2 = new BigNumber($scope.values[getNameCol(114)] ? $scope.values[getNameCol(114)] : 0);
        // Doanh thu thuan
        arr[getColID(115)] = val1.subtract(val2);
        //loi nhuan gop
        val1.set(arr[getColID(115)]);
        val2.set($scope.values[getNameCol(116)] ? $scope.values[getNameCol(116)]: 0);
        arr[getColID(117)] = val1.subtract(val2);

        //loi nhuan tu hoat dong kinh doanh
        arr[getColID(124)] = arr[getColID(117)];
        for (var i = 118; i <= 123; i++) {
            if (i != 120) {
                val1.set($scope.values[getNameCol(i)] ? $scope.values[getNameCol(i)] : 0);
                if (i == 118 || i == 121) arr[getColID(124)] = arr[getColID(124)].add(val1);
                else arr[getColID(124)] = arr[getColID(124)].subtract(val1);
            }
        }

        //loi nhuan khac
        val1.set($scope.values[getNameCol(125)] ? $scope.values[getNameCol(125)] : 0);
        val2.set($scope.values[getNameCol(126)] ? $scope.values[getNameCol(126)] : 0);
        arr[getColID(127)] = val1.subtract(val2);

        //tong loi nhuan ke toan truoc thue
        arr[getColID(128)] = arr[getColID(127)].add(arr[getColID(124)]);

        //chi phi thue TNDN
        val1.set($scope.values[getNameCol(129)] ? $scope.values[getNameCol(129)] : 0);
        val2.set($scope.values[getNameCol(130)] ? $scope.values[getNameCol(130)] : 0);
        arr[getColID(131)] = val1.add(val2);

        //loi nhuan sau thue thu nhap doanh nghiep
        arr[getColID(132)] = arr[getColID(128)].subtract(arr[getColID(131)]);

        //loi nhuan sau thue cua co dong cty me
        val1.set($scope.values[getNameCol(133)] ? $scope.values[getNameCol(133)] : 0);
        arr[getColID(134)] = arr[getColID(132)].subtract(val1);
    }

    //compute cashflow value
    function updateCashflowValue(arr,flag) {
        if(!flag){
            var val1 = defaultNumber(arr, getColID(135));
            var val2 = defaultNumber(arr, getColID(159));
            var val3 = defaultNumber(arr, getColID(172));

            //Luu chuyen tien thuan trong ky
            arr[getColID(184)] = val1.add(val2).add(val3);

            //tien va tuong duong tien cuoi ky
            val1.set(arr[getColID(184)]);
            val2.set(defaultNumber(arr, getColID(185)));
            val3.set(defaultNumber(arr, getColID(186)))
            arr[getColID(187)] = val1.add(val2).add(val3);
        }else{
            var val1 = defaultNumber(arr, getColID(230));
            var val2 = defaultNumber(arr, getColID(234));
            var val3 = defaultNumber(arr, getColID(260));

            //Luu chuyen tien thuan trong ky
            arr[getColID(274)] = val1.add(val2).add(val3);

            //tien va tuong duong tien cuoi ky
            val1.set(defaultNumber(arr, getColID(275)));
            val2.set(defaultNumber(arr, getColID(276)));
            val3.set(defaultNumber(arr, getColID(277)))
            arr[getColID(278)] = arr[getColID(274)].add(val1).add(val2).add(val3);
        }

    }

    //compute indicators
    $scope.updateIndicators = function () {
        var data_json = {
            'params': {
                'company_id': id,
                'year': $scope.year
            }
        }
        RestAPI.do('post', 'company/finance/indicator', data_json,
            function (data, status) {
                if (data.success) {
                    if ($scope.type_report.value == '4')$scope.getValues();
                } else {
                    alert(data.error);
                }
            }, function (data) {
                alert(data);
            });
    }

    function defaultNumber(n, id) {
        var d = (id in n) ? n[id] : ((('col_id'+id) in $scope.values) ? $scope.values['col_id'+id] : 0 );
        return new BigNumber(d);
    }

    function init() {
        getCompanyInfo();
        $scope.getAllParams();

    }


    init();


});

