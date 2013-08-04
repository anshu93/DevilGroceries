

$(function(){
	// Ajax to filter by subcategories
	$(document).on('ajax:success', '.subcategories', function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
	});

	$(document).on('ajax:before', '.subcategories', function(evt, data) {
		var target = $(this).data('update-target');
		var loader = '<img class = "loader" src = "/shopping/home/img/ajax-loader.gif">';
		$('#' + target).html(loader);
	});
	// Ajax to filter by categories
	$(document).on('ajax:success', '.categories', function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
	});

	$(document).on('ajax:before', '.categories', function(evt, data) {
		var target = $(this).data('update-target');
		var loader = '<img class = "loader" src = "/shopping/home/img/ajax-loader.gif">';
		$('#' + target).html(loader);
	});
	//Ajax to have the add to cart button press the hidden button that refreshes the cart
	$(document).on('ajax:success', '.cbp-vm-add', function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
		$('#cart-hidden').trigger("click");
	});

	$(document).on('ajax:success', '.pagination a', function(evt, data) {
		$('#result').html(data);
	});

	$(document).on('ajax:success', '#cart-hidden', function(evt, data) {
		$("#cart-list").html(data);
	});

	$(document).on('ajax:before', '#cart-hidden', function(evt, data) {
		var loader = '<img class = "loader" src = "/shopping/home/img/ajax-loader.gif">';
		$("#cart-list").html(loader);
	});

	//Have the close button refresh the number next to the cart
	$(document).on('ajax:success', '#cart-hidden', function(evt, data){
		$('').html(data)
	});
});

