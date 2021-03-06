myApp.controller('financialReportCtrl', function ($scope, RestAPI, $routeParams, $sce) {
    var id = $routeParams.id;
    var today = new Date().getFullYear();
    var year_to = today - 1;
    var year_from = 0;
    $scope.displayParams = [38, 41, 44, 188];

    //get financial report
    $scope.changeType = function (type, flag) {
        $scope.type = type;
        $scope.flag = flag;
        $scope.params = null;
        $scope.values = null;
        if (type >= 1 && type <= 5) {
            $scope.display_filter = true;
            getAllParams(type, flag);
        }
        else $scope.display_filter = false;
    }

    //get all params of report
    function getAllParams(type, flag) {

        RestAPI.do('get', 'params/arrayParams', {'type': type, 'flag': flag},
            function (data, status) {
                if (data.success) {
                    $scope.params = data.result;
                    $scope.getValues(type, flag);
                } else {
                    alert(data.error);
                }
            });
    }

    //get all values
    $scope.getValues = function (type, flag) {
        var params = {'id': id,
            'n_year': $scope.display.n_year,
            'type': type};
        if (flag == undefined) {
            RestAPI.do('get', 'company/finance/valuesInYears', params,
                function (data, status) {
                    if (data.success) {
                        var result = data.result;
                        for (var i in result) {
                            result[i]['chart'] = $sce.trustAsHtml(makeTableChart($scope.year_arrange, result[i]));
                        }
                        $scope.values = result;
                    } else {
                        alert(data.error);
                    }
                });
        } else {
            RestAPI.do('get', 'company/other/', params,
                function (data, status) {
                    if (data.success) {
                        var result = data.result;
                        for (var i1 in result) {
                            for (var i2 in result[i1]) {
                                for (var i3 in result[i1][i2]) {
                                    result[i1][i2][i3]['chart'] = $sce.trustAsHtml(makeTableChart($scope.year_arrange, result[i1][i2][i3]));
                                }
                            }
                        }
                        $scope.values = result;
                    } else {
                        alert(data.error);
                    }
                });
        }

    };

    $scope.expandRows = function (data) {
        data.open = !data.open;
        var rows = document.getElementsByClassName(data.id + 'p_class');
        for (var i = 0; i < rows.length; i++) {
            var classname = rows[i].className.replace('ng-hide', '');
            if (data.open) {
                var index = rows[i].getAttribute("name");
                var p_id = $scope.params[index].parent_id;
                var p_ele = document.getElementById(p_id);
                var p_index = p_ele.getAttribute('name');
                if ($scope.params[p_index].open) rows[i].className = classname;
            } else rows[i].className = classname + ' ng-hide';
        }
    };

    $scope.changeNumberOfYear = function () {
        $scope.year_arrange = [];
        year_from = year_to - parseInt($scope.display.n_year) + 1;
        for (var i = year_from; i <= year_to; i++)$scope.year_arrange.push(i);
        $scope.getValues($scope.type, $scope.flag);
    }

    $scope.init = function () {
        $scope.display_filter = true;
        $scope.type = 1;
        $scope.flag = null;
        $scope.display = {'unit': '1', 'n_year': '3', 'format': 1};
        $scope.year_arrange = [];

        year_from = year_to - parseInt($scope.display.n_year) + 1;
        for (var i = year_from; i <= year_to; i++)$scope.year_arrange.push(i);

        $scope.params = null;
        $scope.values = null;

        $scope.changeType('1');
    }

    //init();
});