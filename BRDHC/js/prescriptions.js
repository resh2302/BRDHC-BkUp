
$mediArray = [];
$firstRow = true;
$rowId = 0;
$newPresId = 0;

function getPatientPrescription($appId)
{
    //$appId = $('#cphSiteMasterBody_txtSearch').val();
    //alert($appId);
    $.ajax({
        type: "POST",
        url: "../wsPrescriptions.asmx/getPrescription",
        data: "{ appointmentId: '" + $appId + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (res) {

            var myData = JSON.parse(res.d); // data.d is a JSON formatted string, to turn it into a JSON object
            // we use JSON.parse
            // now that myData is a JSON object we can access its properties like normal
            $("#cphSiteMasterBody_txtHCard").val(myData.HealthCard);
            $("#cphSiteMasterBody_txtPName").val(myData.PatientName);
            $("#cphSiteMasterBody_txtDName").val(myData.DoctorName);
            $("#cphSiteMasterBody_txtRepeat").val(myData.Repeat);
            $("#cphSiteMasterBody_txtDate").val(myData.DateWritten);
            $("#cphSiteMasterBody_hdfPresId").val(myData.PrescriptionId);

            getPrescriptionDetails(myData.PrescriptionId);
        }
    });
}

function getPrescriptionDetails($presId)
{
    //alert($presId);
    $.ajax({
        type: "POST",
        url: "../wsPrescriptions.asmx/getPresDetails",
        data: "{ prescriptionId: '" + $presId + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (res) {
            var myData = JSON.parse(res.d);
            console.log(myData);
            $rowId = 0;
            $.each(myData, function (index, itemData) {
                console.log(itemData.PrescriptionId);
                $newMedicine = "<tr>";
                $newMedicine += "<td style='padding:10px;'>";
                $newMedicine += "<label id='lblMedName_" + $rowId + "' class='infoLabel'>Medicine Name: </label><input type='text' id='txtMedName_" + $rowId + "' value='" + itemData.Medicine + "'/><br/>";
                $newMedicine += "<label id='lblQuantity_" + $rowId + "' class='infoLabel'>Quantity to take: </label><input type='text' id='txtQuantity_" + $rowId + "' value='" + itemData.Quantity + "'/><br/>";
                $newMedicine += "<label id='lblDays_" + $rowId + "' class='infoLabel'>For how many days: </label><input type='text' id='txtDays_" + $rowId + "' value='" + itemData.Days + "' /><br/>";
                $newMedicine += "</td>";
                $newMedicine += "</tr>";
                $('#tblMedDetail tr:last').before($newMedicine);
                $rowId = eval($rowId + 1);
            });
            
        }
    });
}

$(document).ready(function () {


    $("#cphSiteMasterBody_hdfPresId").val("0")

    $('#cphSiteMasterBody_pnlDetails').hide();

    $('#cphSiteMasterBody_btnNewPres').click(function (e) {
        e.preventDefault();
        $('#cphSiteMasterBody_pnlDetails').slideToggle("slow");
        $('#cphSiteMasterBody_pnlTable').slideToggle("slow");

        clearMedicineDetails();

    });

    $('#cphSiteMasterBody_btnCancel').click(function (e) {
        //e.preventDefault();
        //$('#cphSiteMasterBody_pnlDetails').slideToggle("slow");
        //$('#cphSiteMasterBody_pnlTable').slideToggle("slow");
    });

    $('#cphSiteMasterBody_btnSearch').click(function (e) {
        e.preventDefault();
        $appId = $('#cphSiteMasterBody_txtSearch').val();
        if ($appId != '') {

            clearMedicineDetails();

            getPatientPrescription($appId);
        }
    });

    $('#cphSiteMasterBody_btnAddMed').click(function (e) {
        e.preventDefault();
        // alert($mediArray.length);
        if ($rowId == 0) {
            $newMedicine = "<tr>";
            $newMedicine += "<td style='padding:10px;'>";
            $newMedicine += "<label id='lblMedName_" + $rowId + "' class='infoLabel'>Medicine Name: </label><input type='text' id='txtMedName_" + $rowId + "'/><br/>";
            $newMedicine += "<label id='lblQuantity_" + $rowId + "' class='infoLabel'>Quantity to take: </label><input type='text' id='txtQuantity_" + $rowId + "'/><br/>";
            $newMedicine += "<label id='lblDays_" + $rowId + "' class='infoLabel'>For how many days: </label><input type='text' id='txtDays_" + $rowId + "' /><br/>";
            $newMedicine += "</td>";
            $newMedicine += "</tr>";
            $('#tblMedDetail tr:last').before($newMedicine);
            $firstRow = false;
            $rowId = eval($rowId + 1);
        }
        else {
            $name = $('#txtMedName_' + eval($rowId-1)).val();
            $quant = $('#txtQuantity_' + eval($rowId - 1)).val();
            $day = $('#txtDays_' + eval($rowId - 1)).val();
            if ($name != '' && $quant != '' && $day != '') {

                $newMedicine = "<tr>";
                $newMedicine += "<td style='padding:10px;'>";
                $newMedicine += "<label id='lblMedName_" + $rowId + "' class='infoLabel'>Medicine Name: </label><input type='text' id='txtMedName_" + $rowId + "'/><br/>";
                $newMedicine += "<label id='lblQuantity_" + $rowId + "' class='infoLabel'>Quantity to take: </label><input type='text' id='txtQuantity_" + $rowId + "'/><br/>";
                $newMedicine += "<label id='lblDays_" + $rowId + "' class='infoLabel'>For how many days: </label><input type='text' id='txtDays_" + $rowId + "' /><br/>";
                $newMedicine += "</td>";
                $newMedicine += "</tr>";
                $('#tblMedDetail tr:last').before($newMedicine);
                $rowId = eval($rowId + 1);
            }
            else {
                alert('A single medicine is allowed at a time!');
            }
        }
    });

    $('#cphSiteMasterBody_btnSU').click(function (e) {
        e.preventDefault();
        $mediArray.splice(0, $mediArray.length);
        $appId = $('#cphSiteMasterBody_txtSearch').val();
        $presId = $("#cphSiteMasterBody_hdfPresId").val();
        $presDate = $("#cphSiteMasterBody_txtDate").val();
        $rept = $("#cphSiteMasterBody_txtRepeat").val();

        $.ajax({
            type: "POST",
            url: "../wsPrescriptions.asmx/savePrescription",
            data: "{ prescriptionId: '" + $presId + "',  appointmentId: '" + $appId + "', repeat: '" + $rept + "', presDate: '" + $presDate + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                $("#cphSiteMasterBody_hdfPresId").val(msg.d);
                $newPresId = msg.d;
                $rowInd = 0;
                $('#tblMedDetail tr:not(:last-child)').each(function (rowIndex, element) {
                    //alert($(this).find('#txtMedName_' + $rowInd).val());

                    $name = $(this).find('#txtMedName_' + $rowInd).val();
                    $quant = $(this).find('#txtQuantity_' + $rowInd).val();
                    $day = $(this).find('#txtDays_' + $rowInd).val();

                    if ($name != '' && $quant != '' && $day != '') {

                        var medicineInfo = new Object();
                        medicineInfo.PrescriptionId = $newPresId;
                        medicineInfo.Medicine = $name;
                        medicineInfo.Timings = "Morning";
                        medicineInfo.Days = $day;
                        medicineInfo.Quantity = $quant;

                        $mediArray[$mediArray.length] = medicineInfo;
                    }

                    $rowInd++;
                });

                if ($newPresId != "0") {
                    $.ajax({
                        type: "POST",
                        url: "../wsPrescriptions.asmx/savePresDetails",
                        data: JSON.stringify({ medDetails: $mediArray }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            var elem = msg.d;
                            console.log('No error in details----' + elem);
                        },
                        error: function (er) {
                            console.log("This is details:------  " + er);
                        }
                    });
                }
            },
            error: function (er) {
                alert('error in prescription');
                console.log("This is prescription:------  " + er);
            }
        });
    });

});

function clearMedicineDetails()
{
    $mediArray.splice(0, $mediArray.length);
    $('#tblMedDetail tr:not(:last-child)').remove();
    $newPresId = 0;
    $rowId = 0;
}

function editPrescription($appId)
{
    $('#cphSiteMasterBody_pnlDetails').slideToggle("slow");
    $('#cphSiteMasterBody_pnlTable').slideToggle("slow");
    clearMedicineDetails();
    $('#cphSiteMasterBody_txtSearch').val($appId);
    getPatientPrescription($appId);

}