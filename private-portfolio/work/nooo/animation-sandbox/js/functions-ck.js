$(document).ready(function(){function i(){t.find("li").css("z-index",function(e){return r-e})}var e=$("#slideShow"),t=e.find("ul"),n=t.find("li"),r=n.length;i();if($.support.transform){n.find("img").css("rotate",function(e){return-90*e+"deg"});e.bind("rotateContainer",function(n,r,s){e.animate({width:510,height:510,marginTop:0,marginLeft:0},"fast",function(){if(r=="next")$("#slideShow li:first").fadeOut("slow",function(){$(this).remove().appendTo(t).show();i()});else{var n=$(t.find("li:last")).hide().remove().prependTo(t);i();n.fadeIn("slow")}e.animate({rotate:Math.round($.rotate.radToDeg(e.css("rotate"))+s)+"deg"},"slow").animate({width:490,height:490,marginTop:10,marginLeft:10},"fast")})});e.bind("showNext",function(){e.trigger("rotateContainer",["next",90])});e.bind("showPrevious",function(){e.trigger("rotateContainer",["previous",-90])})}else{e.bind("showNext",function(){$("#slideShow li:first").fadeOut("slow",function(){$(this).remove().appendTo(t).show();i()})});e.bind("showPrevious",function(){var e=$("#slideShow li:last").hide().remove().prependTo(t);i();e.fadeIn("slow")})}$("#previousLink").click(function(){if(e.is(":animated"))return!1;e.trigger("showPrevious");return!1});$("#nextLink").click(function(){if(e.is(":animated"))return!1;e.trigger("showNext");return!1})});