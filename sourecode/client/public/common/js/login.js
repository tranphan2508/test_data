myApp.service('UserInfoService', function ($cookies) {
    this.saveUserInfo = function (data) {
        $cookies.put('c_id', data.id);
        $cookies.put('c_username', data.username);
        $cookies.put('c_name', data.name);
        $cookies.put('c_login_hash', data.login_hash);
    };

    this.getName = function () {
        return $cookies.get('c_name');
    };

    this.getUserName = function () {
        return $cookies.get('c_username');
    };

    this.getLoginHash = function () {
        return $cookies.get('c_login_hash');
    };

    this.clearUserInfo = function () {
        $cookies.remove('c_id');
        $cookies.remove('c_username');
        $cookies.remove('c_name');
        $cookies.remove('c_login_hash');
    }
});

myApp.controller('LoginCtrl', function ($scope, RestAPI, $location, UserInfoService, md5) {
    jQuery(document).ready(function () {
        // init background slide images
        $.backstretch([
                "asset/login_bg.jpg"
            ], {
                fade: 1000,
                duration: 8000
            }
        );
    });
    $scope.username = '';
    $scope.password = '';
    $scope.login = function (valid) {
        if (valid) {
            var data_json = {
                'params': {
                    'username': $scope.username,
                    'password': md5.createHash($scope.password)
                }
            };
            RestAPI.do('post', 'customer/authority/login', data_json,
                function (data, status) {
                    if (data.success) {
                        $scope.error = '';
                        UserInfoService.saveUserInfo(data.result);
                        $location.path("/");
                    } else {
                        $scope.error = data.error;
                    }
                }, function (data, status) {
                    alert(data);
                });
        }
    }
});
