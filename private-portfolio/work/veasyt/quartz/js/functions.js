$(window).load(function(){

	// Code Here - DOM Ready

	// Pre-select the audio stream & other things
	$(".slideBox ul li:first-child a").addClass("selected");
	$(".slideBox .toggleTwice a:nth-child(2)").addClass("selected");
	
	var screenHeight = $(window).height();
	var appHeaderHeight = $(".appHeader").height();
	var slideBoxHeight = $(".slideBox").height()
	var guideCoverMenuHeight = $(".guideCover").next("nav").height()
	
	var itemTitleHeight = $(".itemTitle").height()
	var itemAudioControlsHeight = $(".itemAudioControls").height()
	var pictureBoxHeight = $(".pictureBox").height()
	var videoBoxHeight = $(".videoBox").height()
	
	var scrollerHeight = $("#scroller").height()

	if($(".itemTitle").length){
		$("#wrapper").height( screenHeight - appHeaderHeight - itemTitleHeight - itemAudioControlsHeight - pictureBoxHeight - videoBoxHeight);
		$("#wrapper").css("top", appHeaderHeight + itemTitleHeight + itemAudioControlsHeight + pictureBoxHeight + videoBoxHeight);
	}

	// Sliderbox functioning
	if($(".slideBox").length){
		$(".touchButton").not(".back").toggle(function(){
			var slideBoxHeight = $(this).next(".slideBox").height();

			// Slide right down the box, bro'
			$(this).next(".slideBox").slideDown(500);
			
			$("#wrapper").animate({
				top: appHeaderHeight + slideBoxHeight + itemTitleHeight + itemAudioControlsHeight + pictureBoxHeight + videoBoxHeight,
				//height: screenHeight - appHeaderHeight - slideBoxHeight - itemTitleHeight - itemAudioControlsHeight - pictureBoxHeight - videoBoxHeight
				}, 500 );
			$(".itemAudioControls, .pictureBox, .videoBox").animate({
				top: appHeaderHeight + slideBoxHeight + itemTitleHeight 
				}, 500 );
			$(".itemTitle").animate({
				top: appHeaderHeight + slideBoxHeight
				}, 500 );
			$(this).parents("li.parent").siblings().find(".slideBox").slideUp(500); // a bit problematic...
			$("#wrapper").height(screenHeight - appHeaderHeight - slideBoxHeight  - itemAudioControlsHeight - pictureBoxHeight - videoBoxHeight);
			
			myScroll.refresh();
			
			return false; // Just in case
		
		},function(){
		
			// Slide back up the box
			$(this).next(".slideBox").slideUp(500);
			
			$("#wrapper").animate({
				top: appHeaderHeight + itemTitleHeight + itemAudioControlsHeight + pictureBoxHeight + videoBoxHeight,
				//height: screenHeight - appHeaderHeight /**/ - itemTitleHeight - itemAudioControlsHeight - pictureBoxHeight - videoBoxHeight
				}, 500 );
			$(".itemAudioControls, .pictureBox, .videoBox").animate({
				top: appHeaderHeight + itemTitleHeight 
				}, 500 );
			$(".itemTitle").animate({
				top: appHeaderHeight
				}, 500 );
			$(this).parents("li.parent").siblings().find(".slideBox").slideUp(500); // a bit problematic...
			$("#wrapper").height( screenHeight - appHeaderHeight - itemTitleHeight - itemAudioControlsHeight - pictureBoxHeight - videoBoxHeight);
			
			myScroll.refresh();
			
			return false; // Just in case
		});
	}

	// Back button functioning
	if(!$(".touchButton.back").hasClass("disabled")){
		$(".touchButton.back").css("opacity","1");
		$(".touchButton.back").click(function() {
			history.back();

			return false; // Just in case
		});
	}
	
	// Guide cover section
	function coverSectionResize() {
		$(".guideCover").height( screenHeight - appHeaderHeight - guideCoverMenuHeight );
		$(".imageReplacement").css({
			"margin-left": - ( $(window).width() - $(".imageReplacement").width() )/2,
			"width":"auto",
			"height": screenHeight - appHeaderHeight - guideCoverMenuHeight
		});
	}
	
	coverSectionResize();
	
});

$(window).resize(function (){
	//coverSectionResize(); not working currently
});

$(document).ready(function (){

	// Code Here
	
	// <audio> controls
	function playPause() {
       var myAudio = document.getElementsByTagName('audio')[0];
	   //var myAudio = $('audio')[0];
	   
       if (myAudio.paused)
           myAudio.play();
       else
           myAudio.pause();
       }
	
	$(".controlAudioPlayPause").toggle(function(){
		playPause()
	}, function(){
		playPause()
	});

	// Mute/Unmute of the audio source
	$(".controlAudioVolumeTrigger").toggle(function(){
		$("audio").prop('muted', false); //mute
	}, function(){
		$("audio").prop('muted', true); //unmute
	});
	
	// Set at start the audio source
	$(".controlAudioReload").click(function(){
		$("audio")[0].pause()
		$("audio").prop('currentTime', 0); //mute
		$("audio")[0].pause() // prevent the restart at the second click
		//playPause()
	});
	
	// Current time of the audio source
	
	// Total time of the audio source

	

});

$(window).unload(function() {
  //alert('Da qui ad altrove!');
});