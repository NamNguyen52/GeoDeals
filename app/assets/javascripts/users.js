// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var mapStyle = [{"featureType":"landscape","stylers":[{"hue":"#FFA800"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.highway","stylers":[{"hue":"#53FF00"},{"saturation":-73},{"lightness":40},{"gamma":1}]},{"featureType":"road.arterial","stylers":[{"hue":"#FBFF00"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"road.local","stylers":[{"hue":"#00FFFD"},{"saturation":0},{"lightness":30},{"gamma":1}]},{"featureType":"water","stylers":[{"hue":"#00BFFF"},{"saturation":6},{"lightness":8},{"gamma":1}]},{"featureType":"poi","stylers":[{"hue":"#679714"},{"saturation":33.4},{"lightness":-25.4},{"gamma":1}]}];

function initialize() {
	var mapOptions = {
	   center : {
				lat: 34.0214935,
				lng: -118.4806145
				},
		zoom: 8,
		styles: mapStyle
	};


///////////////////////////  DISTANCE BETWEEN 2 LOCATIONS  /////////////////////////////
  var loc1 = {lat: 34.0218628, lng: -118.4804206};
  var loc2 = {lat: 33.8336391, lng: -118.3511089};

  var distance = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(loc1.lat, loc1.lng), new google.maps.LatLng(loc2.lat, loc2.lng));

  document.getElementById('calculation').innerHTML = distance*0.00062 + ' miles';


////////////////////////////  ALL DEALS DISPLAYED ON MAP  //////////////////////////////
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);

  mapPoints = [<% @deal.each do |mp| %>
  	{latitude: <%= mp.latitude %>, longitude: <%= mp.longitude %>, name: '<%= mp.name %>', description: '<%= mp.description %>', fine: '<%= mp.fine %>', code: '<%= mp.code %>'},<% end %>];


  for(var i = 0; i < mapPoints.length; ++i)
  {
	  var someCoolPlace = new google.maps.LatLng(mapPoints[i].latitude, mapPoints[i].longitude);
	  var marker = new google.maps.Marker({
	    position: someCoolPlace,
	    title: 'Deal $$!',
	    map: map,
	    animation: google.maps.Animation.BOUNCE,
	    icon: "http://www.balzacbrasserie.com/images/featured_boxes/cocktail.png",
	    draggable: true
	  });
	}
}

 //  navigator.geolocation.getCurrentPosition(latitude);
 //  navigator.geolocation.getCurrentPosition(longitude);
 //  function latitude(pos) {
 //    var curr = pos.coords;
 //      document.getElementById('currentLat').innerHTML = curr.latitude
	// };
 //  function longitude(pos) {
 //  	var curr = pos.coords;
 //      document.getElementById('currentLng').innerHTML = curr.longitude
	// };	
  
 //  latitude(pos);
 //  longitude(pos);

////// var x = document.getElementById("demo");



///////////////////////////  FUNCTION INITIALIZER ON LOAD  ///////////////////////////
google.maps.event.addDomListener(window, 'load', initialize);


//////////////////////  USER'S CURRENT POSITION & DISTANCE FROM /////////////////////
// function showPosition(position) {
//     document.getElementById("currentLat").innerHTML = position.coords.latitude;	
//     document.getElementById("currentLng").innerHTML = position.coords.longitude;

// 	var distanceNew = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(mapPoints[20].latitude, mapPoints[20].longitude), new google.maps.LatLng(position.coords.latitude, position.coords.longitude));

///////////////////  CONSOLE.LOG EACH MAP POINT IN DB  ///////////////////
//	for(var i = 0; i < mapPoints.length; ++i) 
//	{console.log(new google.maps.LatLng(mapPoints[i].latitude, mapPoints[i].longitude))};
//	document.getElementById('newCalculation').innerHTML = distanceNew*0.00062 + ' miles';



// ///////////////// FIND DISTANCE FROM EACH DEAL LOCATION //////////////////
//   for(var i = 0; i < mapPoints.length; ++i)
//   	{
// 	console.log(google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(mapPoints[i].latitude, mapPoints[i].longitude), new google.maps.LatLng(position.coords.latitude, position.coords.longitude)));
//   	}

// }   /// SHOW POSITION ENDS HERE



//////////////////////////// GET CURRENT LOCATION /////////////////////////////
// function getLocation() {
//     if (navigator.geolocation) {
//         navigator.geolocation.getCurrentPosition(showPosition);
//     } else { 
//         document.getElementById("currentLat").innerHTML = "Geolocation is not supported by this browser.";
//     }
// }

// getLocation();

///////////////////////// WATCH AND UPDATE POSITION ///////////////////////////
function showCurrentlocation(){
	navigator.geolocation.watchPosition(callback);
	navigator.geolocation.watchPosition(distance);

}
function callback(position){
	document.getElementById('latitude').innerHTML = position.coords.latitude;
	document.getElementById('longitude').innerHTML = position.coords.longitude;
	//setInterval(function() {distance(position)}, 5000);
}

firstDeal = "1"
secondDeal = "2"
thirdDeal = "3"

function distance(position){

	// DISTANCE TO HILLSTONE
	
	var distToHillstone = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(mapPoints[0].latitude, mapPoints[0].longitude), new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
	document.getElementById('hillstone').innerHTML = distToHillstone
	if (distToHillstone < 25000 && firstDeal === "1") {
		function runOnce() {
			firstDeal = "11"
			alert('Location: ' + mapPoints[0].name + '\n' + 'Deets: ' + mapPoints[0].description + '\n' + 'Begins: ' + mapPoints[0].startDate + '\n' + 'Ends: ' + mapPoints[0].endDate + '\n' + 'Fine: ' + mapPoints[0].fine);
			//alert(mapPoints[23].triggerid\nmapPoints[23].description\nmapPoints[23].start\nmapPoints[23].expire);
		}
		runOnce();
	};


	// DISTANCE TO HUNTLEY HOTEL
	var distToHuntley = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(mapPoints[1].latitude, mapPoints[1].longitude), new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
	document.getElementById('huntley').innerHTML = distToHuntley
	if (distToHillstone < 25000 && secondDeal === "2") {
		function runOnceTwo() {
			secondDeal = "22"
			alert('Location: ' + mapPoints[1].name + '\n' + 'Deets: ' + mapPoints[1].description + '\n' + 'Begins: ' + mapPoints[1].startDate + '\n' + 'Ends: ' + mapPoints[1].endDate + '\n' + 'Fine: ' + mapPoints[1].fine);
		}
		runOnceTwo();
	};



	// DISTANCE TO PANERA BREAD
	var distToPanera = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(mapPoints[2].latitude, mapPoints[2].longitude), new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
	document.getElementById('panera').innerHTML = distToPanera
	if (distToPanera < 25000 && thirdDeal === "3") {
		function runOnceThree() {
			thirdDeal = "33"
			alert('Location: ' + mapPoints[2].name + '\n' + 'Deets: ' + mapPoints[2].description + '\n' + 'Begins: ' + mapPoints[2].startDate + '\n' + 'Ends: ' + mapPoints[2].endDate  + '\n' + 'Fine: ' + mapPoints[2].fine);
		}
		runOnceThree();
	};

}
