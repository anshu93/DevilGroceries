$(document).ready(function(){
	// on changing the amount of an object in the number field submit the form
	$('input[name="quantity"]').change(function(){
		$('#submit').trigger("click");
	});

	// Submit the form such that it doesn't have to refresh the entire page
	$('form').submit(function() { 
		var valuesToSubmit = $(this).serialize();
		$.ajax({
			//alert("in ajax function...");
        	url: $(this).attr('action'), //sumbits it to the given url of the form
        	data: valuesToSubmit,
        	type: 'POST',
        	//dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    	}).success(function(data){
    		// Linking to cart-list refreshes it
        	$("#cart-list").html(data);
    	});
    	return false; // prevents normal behaviour
	});
});
