var app = angular.module('geoDeals', ['ui.router', 'ngResource']);

app.config(['$stateProvider','$urlRouterProvider', function($stateProvider, $urlRouterProvider){
	
	$urlRouterProvider.otherwise('/')

	$stateProvider
		.state('dealsmap', {
			url: '/',
			templateUrl: '/dealmap.html'
		});
}]);

app.factory('User', function($resource){
	return $resource('/api/users/:id.json')
});

app.factory('Deals', function($resource){
	return $resource('api/deals/:id')
});

app.controller('geoCtrl', ['$scope', 'User', 'Deals', function($scope, User, Deals){
	console.log('controller loaded')
	User.get({id: 1}, function (data) {
		$scope.firstName = data.first_name;
		$scope.lastName = data.last_name;
	});

	var deal = Deals.get({id: 0}, function (){
		$scope.dealName = deal.name
		$scope.dealDescription = deal.description
		$scope.dealCode = deal.code
		$scope.dealFine = deal.fine
	});
}]);