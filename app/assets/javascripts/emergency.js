function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' + 'callback=emergencyInitMapCallback';
  document.body.appendChild(script);
}

window.onload = loadScript;

$(document).on('ready page:change', function() {

	var map;
	
	window.emergencyInitMapCallback = function() {
	  var mapOptions = {
	    zoom: 12,
	    center: new google.maps.LatLng(41.585667, -93.634177),
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  };
	
	  map = new google.maps.Map(document.getElementById('emergency-map-canvas'), mapOptions);
	}


});
