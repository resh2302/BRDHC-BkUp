$(document).ready(function () {
    var H = H == 245 ? 145 : 245;
    $(".more_btn").on('click', function () {
        $('.mimg').attr('src',
			($(".mimg").attr('src') == 'App_Themes/Theme/images/more.png' ? 'App_Themes/Theme/images/less.png' : 'App_Themes/Theme/images/more.png'));
        $('#mbox1').animate({ height: H }, 500, function () { H = H == 245 ? 145 : 245; })
        ;
    });
    var J = J == 245 ? 145 : 245;
    $(".more_btn2").on('click', function () {
        $('.mimg2').attr('src',
            ($(".mimg2").attr('src') == 'App_Themes/Theme/images/more2.png' ? 'App_Themes/Theme/images/less2.png' : 'App_Themes/Theme/images/more2.png'));
        $('#mbox2').animate({ height: J }, 500, function () { J = J == 245 ? 145 : 245; })
        ;
    });
    
});

function statusFade() // created by Reshma to fade status message after insert update delete
{
    $('.statusMsg').fadeOut(1000);
}

