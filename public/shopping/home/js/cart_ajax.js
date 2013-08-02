

$(function(){
	$(document).on('ajax:success', '.subcategories', function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
	});

	$(document).on('ajax:before', '.subcategories', function(evt, data) {
		var target = $(this).data('update-target');
		var loader = '<img class = "loader" src = "/shopping/home/img/ajax-loader.gif">';
		$('#' + target).html(loader);
	});

	$(document).on('ajax:success', '.categories', function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
	});

	$(document).on('ajax:before', '.categories', function(evt, data) {
		var target = $(this).data('update-target');
		var loader = '<img class = "loader" src = "/shopping/home/img/ajax-loader.gif">';
		$('#' + target).html(loader);
	});

	$(document).on('ajax:success', '.cbp-vm-add', function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
	});

	$(document).on('ajax:success', '.pagination a', function(evt, data) {
		$('#result').html(data);
	});
});