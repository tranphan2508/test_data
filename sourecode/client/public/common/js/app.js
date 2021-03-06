'use strict';
var myApp = angular.module('myApp', ['ngRoute','ui.bootstrap','angular-md5', 'ngCookies', 'ngSanitize']);

myApp.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider.
            when('/', {templateUrl: 'company/a_z.html'}).
            when('/market-watch/watchlists', {templateUrl: 'company/a_z.html'}).
            when('/stock/company-AZ', {templateUrl: 'company/a_z.html'}).
            when('/stock/company-data/:id', {templateUrl: 'company/detail.html'}).
            when('/stock/stock-screener', {templateUrl: 'company/screener.html'}).
            when('/login', {templateUrl: 'login.html'}).
            otherwise({redirectTo: '/'});
    }]);
myApp.config(function ($httpProvider) {
    $httpProvider.interceptors.push('myHttpInterceptor');
})
myApp.factory('myHttpInterceptor', function ($q) {
    var numLoadings = 0;
    return {
        request: function (config) {
            $('body').append("<div id='loading_mark' style='z-index:100000;text-align:center;position:fixed;width:100%;height:100%;background:#fff;top:0px;left:0px;opacity:0.4;filter:alpha(opacity=40);'><img style='height:150px;margin-top:300px;width:150px;' src='common/image/loader.gif'/></div>");
            return config || $q.when(config)

        },
        response: function (response) {
            $("#loading_mark").remove();

            return response || $q.when(response);
        },
        responseError: function (response) {
            $("#loading_mark").remove();

            return $q.reject(response);
        }
    };
});
