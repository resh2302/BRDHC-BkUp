

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
    $.ajax({
        type: "POST",
        url: "../wsPrescriptions.asmx/getPresDetails",
        data: "{ prescriptionId: '" + $presId + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (res) {

            var myData = JSON.parse(res.d);
            console.log(myData);
        }
    });
}

$(document).ready(function () {

    $mediArray = [];
    $firstRow = true;
    $("#cphSiteMasterBody_hdfPresId").val("0")

    $('#cphSiteMasterBody_pnlDetails').hide();

    $('#cphSiteMasterBody_btnNewPres').click(function (e) {
        e.preventDefault();
        $('#cphSiteMasterBody_pnlDetails').slideToggle("slow");
        $('#cphSiteMasterBody_pnlTable').slideToggle("slow");

        clearMedicineDetails();

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

            clearMedicineDetails();

            getPatientPrescription();
        }
    });

    $('#cphSiteMasterBody_btnAddMed').click(function (e) {
        e.preventDefault();
        // alert($mediArray.length);
        if ($firstRow) {
            $newMedicine = "<tr>";
            $newMedicine += "<td style='padding:10px;'>";
            $newMedicine += "<label id='lblMedName_" + eval($mediArray.length) + "' class='infoLabel'>Medicine Name: </label><input type='text' id='txtMedName_" + eval($mediArray.length) + "'/><br/>";
            $newMedicine += "<label id='lblQuantity_" + eval($mediArray.length) + "' class='infoLabel'>Quantity to take: </label><input type='text' id='txtQuantity_" + eval($mediArray.length) + "'/><br/>";
            $newMedicine += "<label id='lblDays_" + eval($mediArray.length) + "' class='infoLabel'>For how many days: </label><input type='text' id='txtDays_" + eval($mediArray.length) + "' /><br/>";
            $newMedicine += "</td>";
            $newMedicine += "</tr>";
            $('#tblMedDetail tr:last').before($newMedicine);
            $firstRow = false;
        }
        else {
            $name = $('#txtMedName_' + $mediArray.length).val();
            $quant = $('#txtQuantity_' + $mediArray.length).val();
            $day = $('#txtDays_' + $mediArray.length).val();

            if ($name != '' && $quant != '' && $day != '') {
                var newObj = { "MedName": $name, "Quantity": $quant, "Days": $day };

                var medicineInfo = new Object();
                medicineInfo.PrescriptionId = 0;
                medicineInfo.Medicine = $name;
                medicineInfo.Timings = "Morning";
                medicineInfo.Days = $day;
                medicineInfo.Quantity = $quant;

                $mediArray[$mediArray.length] = medicineInfo;
                // alert('length = ' + $mediArray.length);

                $newMedicine = "<tr>";
                $newMedicine += "<td style='padding:10px;'>";
                $newMedicine += "<label id='lblMedName_" + eval($mediArray.length) + "' class='infoLabel'>Medicine Name: </label><input type='text' id='txtMedName_" + eval($mediArray.length) + "'/><br/>";
                $newMedicine += "<label id='lblQuantity_" + eval($mediArray.length) + "' class='infoLabel'>Quantity to take: </label><input type='text' id='txtQuantity_" + eval($mediArray.length) + "'/><br/>";
                $newMedicine += "<label id='lblDays_" + eval($mediArray.length) + "' class='infoLabel'>For how many days: </label><input type='text' id='txtDays_" + eval($mediArray.length) + "' /><br/>";
                $newMedicine += "</td>";
                $newMedicine += "</tr>";
                $('#tblMedDetail tr:last').before($newMedicine);
            }
            else {
                alert('A single medicine is allowed at a time!');
            }
        }
    });

    $('#cphSiteMasterBody_btnSU').click(function (e) {
        e.preventDefault();
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
                console.log('No error in prescription----' + $("#cphSiteMasterBody_hdfPresId").val());
            },
            error: function (er) {
                alert('error in prescription');
                console.log("This is prescription:------  " + er);
            }
        });



        $name = $('#txtMedName_' + $mediArray.length).val();
        $quant = $('#txtQuantity_' + $mediArray.length).val();
        $day = $('#txtDays_' + $mediArray.length).val();

        if ($name != '' && $quant != '' && $day != '') {

            var medicineInfo = new Object();
            medicineInfo.PrescriptionId = $("#cphSiteMasterBody_hdfPresId").val();
            medicineInfo.Medicine = $name;
            medicineInfo.Timings = "Morning";
            medicineInfo.Days = $day;
            medicineInfo.Quantity = $quant;

            $mediArray[$mediArray.length] = medicineInfo;            
        }

        $rowInd = 0;
        $('#tblMedDetail tr:not(:last-child)').each(function () {
            $mediArray[$rowInd].PrescriptionId = $("#cphSiteMasterBody_hdfPresId").val();
            $rowInd++;
        });

        $.ajax({
            type: "POST",
            url: "../wsPrescriptions.asmx/savePresDetails",
            data:JSON.stringify({ medDetails: $mediArray }),
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
    });
});

function clearMedicineDetails()
{

    $mediArray.splice(0, $mediArray.length);
    $('#tblMedDetail tr:not(:last-child)').remove();
}

