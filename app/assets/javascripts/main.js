var app = angular.module('geoDeals', ['ui.router', 'ngResource']);

app.config(['$stateProvider','$urlRouterProvider', function($stateProvider, $urlRouterProvider){
	
	$urlRouterProvider.otherwise('/')

	$stateProvider
		.state('home', {
			url: '/',
			template: 'dealmap.html.erb'
		});

}]);


app.controller('geoCtrl', ['$scope'])