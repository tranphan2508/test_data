myApp.service('RestAPI', function ($http, $location) {
    this.do = function (method, url, jsonData, successCallback, errorCallback) {
        url = 'api/index.php/' + url;

        switch (method.toUpperCase()) {
            case 'GET':
                $http.get(url, {params: jsonData})
                    .success(function (data, status) {
                        if (check_authority(data))successCallback(data, status);
                    })
                    .error(function (data, status) {
                        errorCallback(data, status);
                    });
                break;
            case 'POST':
                $http.post(url, $.param(jsonData), {headers: {'Content-type': 'application/x-www-form-urlencoded'}})
                    .success(function (data, status) {
                        if (check_authority(data))successCallback(data, status);
                    })
                    .error(function (data, status) {
                        errorCallback(data, status);
                    });
                break;
            case 'PUT':
                $http.put(url, $.param(jsonData))
                    .success(function (data, status) {
                        if (check_authority(data))successCallback(data, status);
                    })
                    .error(function (data, status) {
                        errorCallback(data, status);
                    });
                break;
            case 'DELETE':
                $http.delete(url, {params: jsonData})
                    .success(function (data, status) {
                        if (check_authority(data))successCallback(data, status);
                    })
                    .error(function (data, status) {
                        errorCallback(data, status);
                    });
                break;
            default :
                break;
        }
    }

    function check_authority(data) {
        if (data.error == 'Authorization is failed') {
            $location.path("/login");
            return false;
        }
        return true;
    }

});