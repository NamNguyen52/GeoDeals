var app = angular.module('geoDeals', ['ui.router', 'ngResource']);

app.config(['$stateProvider','$urlRouterProvider', function($stateProvider, $urlRouterProvider){
	
	$urlRouterProvider.otherwise('/')

	$stateProvider
		.state('dealsmap', {
			url: '/',
			templateUrl: '/dealmap.html'
		});

}]);

app.factory('Users', function($resource){
	return $resource('/api/users/:id')
});

app.factory('Deals', function($resource){
	return $resource('api/deals/:id')
});

app.controller('geoCtrl', ['$scope', 'Users', 'Deals', function($scope, Users, Deals){
	var user = Users.get({id: 1}, function () {
		$scope.firstName = user.first_name
		$scope.lastName = user.last_name
	});

	var deal = Deals.get({id: 0}, function (){
		$scope.dealName = deal.name
		$scope.dealDescription = deal.description
		$scope.dealCode = deal.code
		$scope.dealFine = deal.fine
	});
}]);