/* Menu Jquery */
$(document).ready(function(){
	$(".sidebar ul li ul").hide();
	$(".sidebar ul li a").on("click", function(){
		var obj = $(this).parent("li").children("ul");
		obj.toggle(200, "swing");
		var arrow = $(this).children("i");
		arrow.toggleClass('icon-minus-sign');
	});
});