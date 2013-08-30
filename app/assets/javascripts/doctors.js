$(document).on('ready page:change', function() {

	$(".doctor-autocomplete").typeahead({
		source: function(query, process) {
			// get data from carefinder using query (text input)
			// and call process callback
			process(["A Doctor", "Another Doc", "B Doctor"]);
			/*
$.get("http://carefinder-dev.cloudapp.net/carefinder.svc/providersnearlocation?p=1&lat=41.6005448&lng=-93.60910639999997&r=10&if=1&ln="+encodeURIComponent(query), function() {
				
			}).done(function(data) {
				var results = [];
				data.Providers.each(function(provider) {
					results.push(provider.LastName + ", " + provider.FirstName);
				});
				process(results);
			});
*/
		}
		
	});

});