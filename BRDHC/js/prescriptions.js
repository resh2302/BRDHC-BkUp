///<reference path="/js/jQuery.js"/>

$(document).ready(function () {
    $('#cphSiteMasterBody_pnlDetails').hide();

    $('#cphSiteMasterBody_btnNewPres').click(function (e) {
        e.preventDefault();
        $('#cphSiteMasterBody_pnlDetails').slideToggle("slow");
        $('#cphSiteMasterBody_pnlTable').slideToggle("slow");
        $mediArray.splice(0, $mediArray.length);
    });


    $('#cphSiteMasterBody_btnCancel').click(function (e) {
        e.preventDefault();
        $('#cphSiteMasterBody_pnlDetails').slideToggle("slow");
        $('#cphSiteMasterBody_pnlTable').slideToggle("slow");
    });

    $('#cphSiteMasterBody_btnSearch').click(function (e) {
        e.preventDefault();
        $appId = $('#cphSiteMasterBody_txtSearch').val();
        if ($appId != '') {
            getPatientPrescription();
        }
    });

    $mediArray = [];
    $firstRow = true;

    $('#cphSiteMasterBody_btnAddMed').click(function (e) {
        e.preventDefault();
       // alert($mediArray.length);
        if ($firstRow)
        {
            $newMedicine = "<tr>";
            $newMedicine += "<td style='padding:10px;'>";
            $newMedicine += "<label id='lblMedName_" + eval($mediArray.length + 1) + "' class='infoLabel'>Medicine Name: </label><input type='text' id='txtMedName_" + eval($mediArray.length + 1) + "'/><br/>";
            $newMedicine += "<label id='lblQuantity_" + eval($mediArray.length + 1) + "' class='infoLabel'>Quantity to take: </label><input type='text' id='txtQuantity_" + eval($mediArray.length + 1) + "'/><br/>";
            $newMedicine += "<label id='lblDays_" + eval($mediArray.length + 1) + "' class='infoLabel'>For how many days: </label><input type='text' id='txtDays_" + eval($mediArray.length + 1) + "' /><br/>";
            $newMedicine += "</td>";
            $newMedicine += "</tr>";
            $('#tblMedDetail tr:last').before($newMedicine);
            $firstRow = false;
        }
        else
        {
            $mediArray[$mediArray.length] = { "MedName": '"' + $('#txtMedName_' + $mediArray.length + 1).val() + '"', "Quantity": '"' + $('#txtQuantity_' + $mediArray.length + 1).val() + '"', "Days": '"' + $('#txtDays_' + $mediArray.length + 1).val() + '"' };
            alert($('#txtMedName_' + $mediArray.length + 1).val());
            $lastName = $("#txtMedName_" + $mediArray.length).val();
            $lastQuantity = $("#txtQuantity_" + $mediArray.length).val();
            $lastDays = $("#txtDays_" + $mediArray.length).val();

            if ($lastName != '' && $lastQuantity != '' && $lastDays != '') {
                $newMedicine = "<tr>";
                $newMedicine += "<td style='padding:10px;'>";
                $newMedicine += "<label id='lblMedName_" + eval($mediArray.length + 1) + "' class='infoLabel'>Medicine Name: </label><input type='text' id='txtMedName_" + eval($mediArray.length + 1) + "'/><br/>";
                $newMedicine += "<label id='lblQuantity_" + eval($mediArray.length + 1) + "' class='infoLabel'>Quantity to take: </label><input type='text' id='txtQuantity_" + eval($mediArray.length + 1) + "'/><br/>";
                $newMedicine += "<label id='lblDays_" + eval($mediArray.length + 1) + "' class='infoLabel'>For how many days: </label><input type='text' id='txtDays_" + eval($mediArray.length + 1) + "' /><br/>";
                $newMedicine += "</td>";
                $newMedicine += "</tr>";
                $('#tblMedDetail tr:last').before($newMedicine);
                //alert($mediArray.length);
            }
            else {
                alert('A single medicine is allowed at a time!');
            }
        }
    });

    $('#cphSiteMasterBody_btnSU').click(function (e) {
        e.preventDefault();
        // var myData = JSON.parse($mediArray[0]);
        // var myData = $.parseJSON($mediArray[0]);
        alert($mediArray[0].Days);
        console.log($mediArray[0].Days);
    });
});

function getPatientPrescription()
{
    $appId = $('#cphSiteMasterBody_txtSearch').val();
    //alert($appId);
    $.ajax({
        type: "POST",
        url: "../wsPrescriptions.asmx/getPrescription",
        data: "{ appointmentId: '" + $appId + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            var myData = JSON.parse(data.d); // data.d is a JSON formatted string, to turn it into a JSON object
            // we use JSON.parse
            // now that myData is a JSON object we can access its properties like normal
            $("#cphSiteMasterBody_txtHCard").val(myData.HealthCard);
            $("#cphSiteMasterBody_txtPName").val(myData.PatientName);
            $("#cphSiteMasterBody_txtDName").val(myData.DoctorName);
            $("#cphSiteMasterBody_txtRepeat").val(myData.Repeat);
            $("#cphSiteMasterBody_txtDate").val(myData.DateWritten);
            $("#cphSiteMasterBody_hdfPresId").val(myData.PrescriptionId);

        }
    });

}