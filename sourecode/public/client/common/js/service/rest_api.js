myApp.service('RestAPI', function ($http) {
    this.do = function (method, url, jsonData, successCallback, errorCallback) {
        url = 'api/index.php/' + url;

        switch (method.toUpperCase()) {
            case 'GET':
                $http.get(url, {params: jsonData})
                    .success(function (data, status) {
                        successCallback(data, status);
                    })
                    .error(function (data, status) {
                        errorCallback(data, status);
                    });
                break;
            case 'POST':
                $http.post(url,  $.param(jsonData),{headers:{'Content-type': 'application/x-www-form-urlencoded'}})
                    .success(function (data, status) {
                        successCallback(data, status);
                    })
                    .error(function (data, status) {
                        errorCallback(data, status);
                    });
                break;
            case 'PUT':
                $http.put(url, $.param(jsonData))
                    .success(function (data, status) {
                        successCallback(data, status);
                    })
                    .error(function (data, status) {
                        errorCallback(data, status);
                    });
                break;
            case 'DELETE':
                $http.delete(url, {params: jsonData})
                    .success(function (data, status) {
                        successCallback(data, status);
                    })
                    .error(function (data, status) {
                        errorCallback(data, status);
                    });
                break;
            default :
                break;
        }
    }

});