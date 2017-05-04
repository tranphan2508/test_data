myApp.controller('DetailCompanyCtrl', function ($scope, RestAPI, $routeParams) {
    var id = $routeParams.id;

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

    function init() {
        $scope.companyInfo = null;
        $scope.tab = {'profile': true, 'finance': false};
        getCompanyInfo();

    }

    init();
});

myApp.controller('financialReportCtrl', function ($scope, RestAPI, $routeParams) {
    var id = $routeParams.id;
    var today = new Date().getFullYear();
    var year_to = today - 1;
    var year_from = 0;

    //get financial report
    $scope.changeType = function (type) {
        $scope.type = type;
        $scope.params = null;
        $scope.values = null;
        if (type == '1' || type == '2' || type == '3' || type == '4' || type == '5') {
            $scope.display_filter = true;
            getAllParams(type);
        }
        else $scope.display_filter = false;
    }

    //get all params of report
    function getAllParams(type) {

        RestAPI.do('get', 'params/arrayParams', {'type': type},
            function (data, status) {
                if (data.success) {
                    $scope.params = data.result;
                    $scope.getValues(type);
                } else {
                    alert(data.error);
                }
            });
    }

    //get all values
    $scope.getValues = function (type) {
        var params = {'id': id,
            'n_year': $scope.display.n_year,
            'type': type};
        RestAPI.do('get', 'company/finance/valuesInYears', params,
            function (data, status) {
                if (data.success) {
                    $scope.values = data.result;
                } else {
                    alert(data.error);
                }
            })
    };

    $scope.expandRows = function (data) {
        data.open = !data.open;
        var rows = document.getElementsByClassName(data.id + 'p_class');
        for (var i = 0; i < rows.length; i++) {
            var classname = rows[i].className.replace('ng-hide', '');
            if (data.open) {
                var index=rows[i].getAttribute("name");
                var p_id=$scope.params[index].parent_id;
                var p_ele=document.getElementById(p_id);
                var p_index=p_ele.getAttribute('name');
              if($scope.params[p_index].open) rows[i].className = classname ;
            } else rows[i].className = classname + ' ng-hide';
        }
    };

    $scope.changeNumberOfYear=function(){
        $scope.year_arrange=[];
        year_from = year_to - parseInt($scope.display.n_year) +1;
        for (var i = year_from; i <= year_to; i++)$scope.year_arrange.push(i);
        $scope.getValues($scope.type);
    }

    function init() {
        $scope.display_filter = true;
        $scope.type = 1;
        $scope.display = {'unit': '1', 'n_year': '10', 'format':1};
        $scope.year_arrange = [];

        year_from = year_to - 9;
        for (var i = year_from; i <= year_to; i++)$scope.year_arrange.push(i);

        $scope.params = null;
        $scope.values = null;

        $scope.changeType('1');
    }

    init();
});