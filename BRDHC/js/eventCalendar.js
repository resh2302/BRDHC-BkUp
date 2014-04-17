$(document).ready(function () {


    $(".btn_cws").click(function () {
        $(".calContainer").slideDown();
    });
    $(".btn_close").click(function () {
        $(".calContainer").slideUp();
    });

});
function postbackSlideDown() {
        $(".calContainer").slideDown();
}
function onloadUp() {
    $(".calContainer").slideUp(0);
}