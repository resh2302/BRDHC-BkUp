// JavaScript Document
$(document).ready(function(){
	var H=H==245?145:245;
	$(".more").on('click', function(){
		$('.mimg').attr('src',
			($(".mimg").attr('src') == 'img/more.png'?'img/less.png':'img/more.png'));
        $('#box').animate({height: H}, 500, function() {H=H==245?145:245;})
		;
    });
});
