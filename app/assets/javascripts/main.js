var app = angular.module('geoDeals', ['ui.router', 'templates', 'ngResource']);

app.config(['$stateProvider','$urlRouterProvider', function($stateProvider, $urlRouterProvider){
	
	$urlRouterProvider.otherwise('/')

	$stateProvider
		.state('dealmap', {
			url: '/',
			templateUrl: '/dealmap.html'
		});
}]);

app.factory('User', function($resource){
	return $resource('/api/users/:id.json')
});

app.factory('Deals', function($resource){
	return $resource('/api/business/:id/deals/:id.json')
});

app.controller('geoCtrl', ['$scope', 'User', 'Deals', function($scope, User, Deals){
	console.log('controller loaded');

        var userId = gon.userid;
        if (gon) {
            console.log('gon is loaded')
        } else {
            console.log('gon did not load lol')
        };

        console.log(userId);

		User.get({id: userId}, function (data){
		$scope.firstName = data.first_name
		$scope.lastName = data.last_name
	});

	var deal = Deals.get({id: 59}, function (data){
		$scope.dealName = data.name
		$scope.dealDescription = data.description
		$scope.dealLatitude = data.latitude
		$scope.dealLongitude = data.longitude
	});
}]);




