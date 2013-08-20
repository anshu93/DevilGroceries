$(document).ready(function(){
	$('.question').click(function(){
		$(this).parent('.faq').children('.answer').eq(0).toggle("linear");
		$(this).children("i").toggleClass('icon-minus-sign');
	});
});