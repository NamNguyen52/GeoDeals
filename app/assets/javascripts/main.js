var app = angular.module('geoDeals', ['ui.router', 'ngResource']);

app.config(['$stateProvider','$urlRouterProvider', function($stateProvider, $urlRouterProvider){
	
	$urlRouterProvider.otherwise('/')

	$stateProvider
		.state('dealsmap', {
			url: '/',
			templateUrl: '/dealmap.html.erb'
		});
}]);

app.factory('User', function($resource){
	return $resource('/api/users/:id.json')
});

app.controller('geoCtrl', ['$scope', 'User', function($scope, User){
	console.log('controller loaded')

	if (gon) {
		console.log('gon loaded')
	} else {
		console.log('gon not loaded lol')
	};

	var userId = gon.userid;
	console.log(userId);

	User.get({id: userId}, function (data) {
		$scope.firstName = data.first_name;
		$scope.lastName = data.last_name;
	});
}]);