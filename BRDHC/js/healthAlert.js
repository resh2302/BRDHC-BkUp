///<reference path="/js/jQuery.js"/>

function switchViews(rowInd, val) {
    if (val == 'show') {
        $("#cphSiteMasterBody_lstRecords_lblDescription_" + rowInd).css({ 'display': "none" });
        $("#RM_" + rowInd).css({ 'display': "none" });
        $("#GB_" + rowInd).css({ 'display': "block" });
        $("#div_" + rowInd).css({ 'display': "block" });
    }
    else {
        $("#cphSiteMasterBody_lstRecords_lblDescription_" + rowInd).css({ 'display': "block" });
        $("#RM_" + rowInd).css({ 'display': "block" });
        $("#GB_" + rowInd).css({ 'display': "none" });
        $("#div_" + rowInd).css({ 'display': "none" });
    }
}

$(document).ready(function () {
    $("#tmpAlert").hide();
    $("#mailMsg").hide();
    $("#pImage").hide();

    $("#tmpAlertOpen").click(function (e) {
        e.preventDefault();
        $("#tmpAlertOpen").hide();
        $("#tmpAlert").show();
    });


    $("#ContentPlaceHolder1_lbtnSend").click(function (e) {
        e.preventDefault();
        var em = $("#ContentPlaceHolder1_txtEmails").val();
        if (em != "") {
            $("#pImage").show();
            $("#tmpAlert").hide();
            var id = $("#ContentPlaceHolder1_hfaid").val();
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: "application/json",
                url: "wsHealthAlerts.asmx/sendToFriend",
                data: JSON.stringify({ "_emails": em, "_aid": id }),
                success: function (data) {
                    $("#pImage").hide();
                    $("#mailMsg").show();
                    $("#tmpAlert").show();
                    if (data.d == "pass") {
                        $("#mailMsg").html("Email sent!")
                    }
                    else {
                        $("#mailMsg").html(data.d)
                    }
                },
                error: function ()
                {
                    $("#pImage").hide();
                    $("#mailMsg").show();
                    $("#tmpAlert").show();
                }
            })
        }
    });
});