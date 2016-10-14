myApp.controller('DetailCompanyCtrl', function ($scope, $uibModal, RestAPI, $routeParams) {
    var id = $routeParams.id;
    $scope.companyInfo = null;
    $scope.edit=false;
    var original_values=null;
    //type of report options
    $scope.type_reports = [
        {'value': 1, 'name': 'Balance Sheet'},
        {'value': 2, 'name': 'Income Statement'},
        {'value': 3, 'name': 'Statement of Cashflow'}
    ];
    $scope.type_report = $scope.type_reports[0];

    //year options
    $scope.years = [];
    var today = new Date().getFullYear();
    for (var i = today-1; i >= 2000; i--) $scope.years.push(i);
    $scope.year = today-1;

    //get all params of report
    $scope.getAllParams = function () {
        RestAPI.do('get', 'params/params', {'type': $scope.type_report.value},
            function (data, status) {
                if (data.success) {
                    $scope.params = data.result;
                    $scope.getValues();
                } else {
                    alert(data.error);
                }
            });

    };

    //get all value of params
    $scope.getValues = function () {
        var params = {'id': id,
            'year': $scope.year,
            'type': $scope.type_report.value};
        RestAPI.do('get', 'company/values', params,
            function (data, status) {
                if (data.success) {
                    $scope.values=data.result;
                    original_values= $.extend(true,{},data.result);
                } else {
                    alert(data.error);
                }
            })
    };

    $scope.cancel=function(){
        $scope.values =$.extend(true,{},original_values);
        $scope.edit=!$scope.edit;
    };

    $scope.save=function(){
        var insert_values=[];
        var update_values=[];
        var insert_elements= angular.element(document.getElementsByClassName("insert"));
        var update_elements= angular.element(document.getElementsByClassName("update"));
        for(var i=0; i<insert_elements.length; i++){
            var str=insert_elements[i].name+'_'+ insert_elements[i].value.replace(/,/g,'');
            if(insert_elements[i].className.indexOf('update')!=-1){
                update_values.push(str);
            }else insert_values.push(str);//paramID_valueID_value
        }
        /*for(var i=0; i<update_elements.length; i++){
            update_values.push( update_elements[i].name+'_'+ update_elements[i].value.replace(/,/g,''));//paramID_valueID_value
        }*/
        var data_json={
            'params':{
                'company_id':id,
                'type':$scope.type_report.value,
                'year': $scope.year,
                'insert':JSON.stringify(insert_values),
                'update':JSON.stringify(update_values)
            }
        }
        RestAPI.do('post','company/values',data_json,
        function(data,status){
            if(data.success){
                $scope.edit=false;
                $scope.getValues();
            }else{
                alert(data.error);
            }
        },function(data){
                alert(data);
            })
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

    function init(){
        getCompanyInfo();
        $scope.getAllParams();

    }

    init();


});

