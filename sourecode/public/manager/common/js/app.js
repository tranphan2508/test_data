'use strict';
var myApp = angular.module('myApp', ['ngRoute','ui.bootstrap']);

myApp.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider.
            when('/', {templateUrl: 'params/index.html'}).
            when('/company/', {templateUrl: 'company/index.html'}).
            when('/sector/', {templateUrl: 'sector/index.html'}).
            when('/floor/', {templateUrl: 'floor/index.html'}).
            when('/params/', {templateUrl: 'params/index.html'}).
            otherwise({redirectTo: '/'});
    }]);