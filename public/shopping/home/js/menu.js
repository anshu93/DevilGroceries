/* Menu Jquery */
$(document).ready(function(){
	$(".sidebar ul li ul").hide();
	$(".categories").on("click", function(){
		var obj_others = $(".sidebar ul li ul");
		obj_others.hide(200, "swing");
		var arrow_others = $(".sidebar ul li i");

		arrow_others.removeClass('icon-minus-sign').addClass('icon-plus-sign');

		var obj = $(this).parent("li").children("ul");
		obj.toggle(200, "swing");
		var arrow = $(this).children("i");
		arrow.toggleClass('icon-minus-sign');
	});
});
