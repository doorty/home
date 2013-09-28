function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  //script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' + 'callback=emergencyInitMapCallback';
  // to have shadows requres v=3
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3&sensor=false&' + 'callback=emergencyInitMapCallback';
  document.body.appendChild(script);
}

window.onload = loadScript;

$(document).on('ready page:change', function() {

	var map;
	var googleMapsLoaded = false;
	
	// for demo purposes, check if internet connection active otherwise display image
	setTimeout(function() {
	
	  if (!googleMapsLoaded) {
  	  $("#emergency-map-canvas-image").removeClass("hidden");
	  }
	
	}, 3000);
	
	window.emergencyInitMapCallback = function() {
	  
	  googleMapsLoaded = true;
	  
	  $("#emergency-map-canvas").removeClass("hidden");
	  
	  var mapOptions = {
	    zoom: 11,
	    center: new google.maps.LatLng(41.585667, -93.634177),
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	  };
	
	  map = new google.maps.Map(document.getElementById('emergency-map-canvas'), mapOptions);

    setMarkers(map, hospitals);

	}

  
  /**
 * Data for the markers consisting of a name, a LatLng and a zIndex for
 * the order in which these markers should display on top of each
 * other.
 */
  var hospitals = [
    ['Mercy Quick Care Clinic Skywalk', 41.586525, -93.634092, 1],
    ['Mercy Quick Care East', 41.5867999, -93.622792, 2],
    ['Mercy South Medical Clinic', 41.6262267, -93.5515375, 3],
    ['Urbandale Family Physicians Urgent Care', 41.5246124, -93.6256731, 4],
    ['Concentra Urgent Care', 41.620937, -93.735369, 5],
    ['Mercy Quick Care Clinic Hickman', 41.6383376, -93.7693278, 6],
  ];
  
  function setMarkers(map, locations) {
    // Add markers to the map
  
    // Marker sizes are expressed as a Size of X,Y
    // where the origin of the image (0,0) is located
    // in the top left of the image.
  
    // Origins, anchor positions and coordinates of the marker
    // increase in the X direction to the right and in
    // the Y direction down.
    // http://maps.google.com/mapfiles/kml/pal3/icon38.png shadow: *s.png
    // http://maps.google.com/mapfiles/kml/pal3/icon46.png shadow: *s.png
    // http://www.google.com/mapfiles/ms/micons/hospitals.png shadow: *.shadow.png
    // 
    var image = {
      //url: '/images/beachflag.png',
      url: 'http://maps.google.com/mapfiles/kml/pal3/icon46.png',
      // This marker is 32 pixels wide by 32 pixels tall.
      size: new google.maps.Size(32, 32),
      // The origin for this image is 0,0.
      origin: new google.maps.Point(0,0),
      // The anchor for this image is the base of the flagpole at 0,32.
      anchor: new google.maps.Point(0, 32)
    };
    var shadow = {
      //url: 'images/beachflag_shadow.png',
      url: 'http://maps.google.com/mapfiles/kml/pal3/icon46s.png',
      // The shadow image is larger in the horizontal dimension
      // while the position and offset are the same as for the main image.
      size: new google.maps.Size(59, 32),
      origin: new google.maps.Point(0,0),
      anchor: new google.maps.Point(0, 32)
    };
    // Shapes define the clickable region of the icon.
    // The type defines an HTML <area> element 'poly' which
    // traces out a polygon as a series of X,Y points. The final
    // coordinate closes the poly by connecting to the first
    // coordinate.
    var shape = {
        coord: [1, 1, 1, 20, 18, 20, 18 , 1],
        type: 'poly'
    };
    for (var i = 0; i < locations.length; i++) {
      var hospital = locations[i];
      var myLatLng = new google.maps.LatLng(hospital[1], hospital[2]);
      var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          shadow: shadow,
          icon: image,
          shape: shape,
          title: hospital[0],
          zIndex: hospital[3]
      });
    }
  }
  
});
