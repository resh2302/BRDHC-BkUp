///<reference path="/js/jQuery.js"/>

$(document).ready(function () {
    $('#cphSiteMasterBody_pnlDetails').hide();

    $('#cphSiteMasterBody_btnNewPres').click(function (e) {
        e.preventDefault();
        $('#cphSiteMasterBody_pnlDetails').slideToggle("slow");
        $('#cphSiteMasterBody_pnlTable').slideToggle("slow");
    });


    $('#cphSiteMasterBody_btnCancel').click(function (e) {
        e.preventDefault();
        $('#cphSiteMasterBody_pnlDetails').slideToggle("slow");
        $('#cphSiteMasterBody_pnlTable').slideToggle("slow");
    });
});