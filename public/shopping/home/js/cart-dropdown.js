
$(document).ready(function() {
	// On clicking the shopping cart icon drop the actual cart
	$('#cart-id').on("click", function(){
		$(".cart-dropdown").toggle("linear");
	});

	// On clicking the close button close the dropdown
	$('#close-button').on("click", function(){
		$(".cart-dropdown").toggle("linear");
	});

	// on clicking the close button update the figure next to the shopping cart
	$('#close-button').on("click", function(){
		$("#cart-hidden-close").trigger("click");
	});

	// on changing the amount of an object in the number field save it to the db
	$('#quantity').change(function(){
		alert('quantity has been changed');
	});
});


$(function(){
	$(document).on('ajax:success', '#cart-id', function(evt, data) {
		$("#cart-list").html(data);
	});

	$(document).on('ajax:before', '#cart-id', function(evt, data) {
		var loader = '<img class = "loader" src = "/shopping/home/img/ajax-loader.gif">';
		$("#cart-list").html(loader);
	});

	$(document).on('ajax:success', '#delete_relation', function(evt, data) {
		$("#cart-list").html(data);
	});
});