myApp.service('UserInfoService', function () {
    var userInfo = null;
    this.saveUserInfo = function (data) {
        this.userInfo = data;
    };

    this.getUserInfo = function () {
        return this.userInfo;
    };

    this.getName = function () {
        if (this.userInfo) return this.userInfo.name;
        return null;
    };

    this.getUserName = function () {
        if (this.userInfo) return this.userInfo.username;
        return null;
    };

    this.getLoginHash = function () {
        if (this.userInfo) return this.userInfo.login_hash;
        return null;
    }
    this.clearUserInfo = function () {
        this.userInfo = null;
    }
});

myApp.controller('LoginCtrl', function ($scope, RestAPI, $location, UserInfoService, md5) {
    $scope.username='';
    $scope.password='';
    $scope.login = function (valid) {
        if (valid) {
            var data_json = {
                'params': {
                    'username': $scope.username,
                    'password': md5.createHash($scope.password)
                }
            };
            RestAPI.do('post', 'user/authority/login', data_json,
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
