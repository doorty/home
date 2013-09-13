$(document).on('ready page:change', function() {

	$(".doctor-autocomplete").typeahead({
	  matcher: function(item) { return true; },
		source: function(query, process) {
			// get data from carefinder using query (text input)
			// and call process callback
			//process(["Beebe", "Bobo", "Bybee"]);
      
      /*
      $.get("/care_finder/doctor_similar_names.json?name="+encodeURIComponent(query), function() {
				
			}).done(function(data) {
				var results = [];
        console.log("data: " + JSON.stringify(data[0]));
        $.each(data, function(i, person) {
          console.log("Name: " + person.Name);
          results.push(person.Name);
        });
        //process(["Beebe", "Bobo", "Bybee"]);
				process(results);
			});
      */
      
      var nArry = query.split(" "),
	        first = nArry[0],
	        last = nArry[1];
	  
	    $.get("/care_finder/doctors.json?fn="+encodeURIComponent(first)+ ( last ? "&ln="+encodeURIComponent(nArry[1]) : ""), function() {
	    
	    }).done(function(data) {
				var results = [];
        console.log("data: " + JSON.stringify(data.Providers));
        $.each(data.Providers, function(i, provider) {
          console.log("Name: " + provider.FirstName + " " + provider.MiddleName + " " + provider.LastName);
          results.push(provider.FirstName + " " + provider.MiddleName + " " + provider.LastName);
        });

				process(results);
			});
		}
		
	}).blur(function(event) {
	    console.log("blurred: " + $(this).val());
	  
	    var nArry = $(this).val().split(" "),
	        first = nArry[0],
	        last = (nArry > 2) ? nArry[2] : nArry[1]; // in case there is a middle name, get 3rd (nArry[2])
	  
	    $.get("/care_finder/doctors.json?fn="+encodeURIComponent(first)+ ( last ? "&ln="+encodeURIComponent(nArry[1]) : ""), function() {
				
			}).done(function(data) {
			  console.log("doctors: " + JSON.stringify(data));
			  
			  if (data.Providers.length > 0) {

  			  var provider = data.Providers[0];

  			  $("#doctor_address").val(provider["Address"]);
  			  $("#doctor_city").val(provider["City"]);
  			  $("#doctor_state").val(provider["State"]);
  			  
  			  $.get("/care_finder/doctor_details.json?doctorid="+encodeURIComponent(provider["ProviderID"])+"&addressid="+encodeURIComponent(provider["AddressID"]), function() {
    			  
  			  }).done(function(data) {
    			  $("#doctor_phone").val(provider["Phone"]);
  			  });
        
        }
			  
			});
	});

});