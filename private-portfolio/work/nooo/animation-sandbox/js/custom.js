$(document).ready(function (){

	// Tab system (need to add hide-title and rethink the dl+ul question)
	$(".tabs dt a").click(function () {
		var index = $(".tabs dt a").index(this);
		var contentHref = $(this).attr("href") + "content"
		
		if(contentHref.substring(0,1) == "#" && $(".tabsContent").length) {
		
			// Update tha tab's label
			$(this)
				.parent().addClass("active")
				.siblings().removeClass("active");
				
			// Update tha tab's content
			$(".tabsContent > li:eq("+ index +")")
				.addClass("active").show()
				.siblings().hide().removeClass("active");
		}
		return false;
	});
	
	// Accordion sys
	$(".accordion").each(function(){
		$(this).children("dd").hide();
		$(this).children("dt:eq(0)").addClass("active").next().show();
		$(this).children("dt").click(function (){
			if($(this).next().is(':hidden')) {
				$(this).siblings("dt").removeClass("active").siblings("dd").hide();
				$(this).addClass("active").next().show()
			}
		});
	});	
	
});

$(window).resize(function (){
	// Code Here
});

$(window).load(function(){
	// Code Here
});
