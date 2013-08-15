$(document).ready(function(){
	$('.cbp-vm-title').quickfit();
	// on changing the amount of an object in the number field submit the form
	$('input[name="quantity"]').change(function(){
		$(this).parent('form').children('input[name="commit"]').eq(0).trigger("click");
	});

	// Submit the form such that it doesn't have to refresh the entire page
	$('form').submit(function() { 
		var valuesToSubmit = $(this).serialize();
		$.ajax({
        	url: $(this).attr('action'), //sumbits it to the given url of the form
        	data: valuesToSubmit,
        	type: 'POST',
    	}).success(function(data){
        	$("#cart-list").html(data);	// Linking to cart-list refreshes it
    	});
    	return false; // prevents normal behaviour
	});
});
