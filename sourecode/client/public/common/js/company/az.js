myApp.controller('AZCtrl', function ($scope, $location,RestAPI) {
    // init background slide images
    $('.backstretch img').attr("src", "");
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