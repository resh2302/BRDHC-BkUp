// JavaScript Document
$(document).ready(function(){
	var H=H==245?145:245;
	$(".more_btn").on('click', function(){
		$('.mimg').attr('src',
			($(".mimg").attr('src') == 'img/more.png'?'img/less.png':'img/more.png'));
        $('#mbox1').animate({height: H}, 500, function() {H=H==245?145:245;})
		;
	});
	var J = J == 245 ? 145 : 245;
	$(".more_btn2").on('click', function () {
    $('.mimg2').attr('src',
        ($(".mimg2").attr('src') == 'img/more2.png'?'img/less2.png':'img/more2.png'));
        $('#mbox2').animate({height: J}, 500, function() {J=J==245?145:245;})
        ;
    });

});
