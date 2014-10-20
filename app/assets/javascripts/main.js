var app = angular.module('geoDeals', ['ngRoute', 'ngResource']);

app.config(['$routeProvider', function($routeProvider){
	$routeProvider
	.when('/',{
		templateUrl: '/templates/',
		controller: 'Ctrl'
	})

	.when('/', {
		templateUrl: '/templates/',
		controller: 'Ctrl'
	})

	.otherwise({
		templateUrl: '/templates/home.html',
		controller: 'homeCtrl'
	});	
}]);