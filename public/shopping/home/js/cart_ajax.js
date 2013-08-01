

$(function(){
	$(document).on('ajax:success', 'a[data-update-target]', function(evt, data) {
		var target = $(this).data('update-target');
		$('#' + target).html(data);
	});

	$(document).on('ajax:before', 'a[data-update-target]', function(evt, data) {
		var target = $(this).data('update-target');
		var loader = '<img class = "loader" src = "/shopping/home/img/ajax-loader.gif">';
		$('#' + target).html(loader);
	});

	$(document).on('ajax:success', '.pagination a', function(evt, data) {
		$('#result').html(data);
	});
});