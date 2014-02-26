	// JavaScript Document

	$(".imgGrandes").click(function(){
	TweenMax.to($("#imageBolsas"), 2, {bottom:"-5%", ease:Expo.easeOut});
	TweenMax.to($("#imageGlobo"), 2, {bottom:"-5%", ease:Expo.easeOut, delay:.5});
	});
	$(".on-left").click(function(){
	TweenMax.to($("#imageBolsas"), 0, {bottom:"-100%", ease:Expo.easeOut});
	TweenMax.to($("#imageGlobo"), 0, {bottom:"-100%", ease:Expo.easeOut});
	});