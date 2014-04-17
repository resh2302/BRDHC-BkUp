////////////////////////////////////////////////////////////////////
// AUTHOR:           JAGSIR
// LAST MODIFIED BY: JAGSIR
// DATE MODIFIED: -  05 APRIL 2014
// DESCRIPTION:      CLASS FOR PRESCRIPTIONS FUNCTIONALITY
///////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsPrescriptions
/// </summary>
public class clsPrescriptions
{
    public clsPrescriptions()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public IQueryable<brdhc_PatientPrescription> getPrescription(string appointmentId)
    {
        prescriptionsDataContext udObj = new prescriptionsDataContext();
        var prescription =
            from p in udObj.brdhc_PatientPrescriptions
            where p.AppointmentId == Convert.ToInt32(appointmentId)
            select p;
        return prescription;
    }

    public List<sp_SearchPatientPrescriptionResult> getPatientPrescription(string appointmentId)
    {
        List<sp_SearchPatientPrescriptionResult> myList = new List<sp_SearchPatientPrescriptionResult>();
        try
        {
            prescriptionsDataContext obj = new prescriptionsDataContext();
            myList = obj.sp_SearchPatientPrescription(Convert.ToInt32(appointmentId)).ToList();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return myList;
    }

    public List<sp_SearchPrescriptionsByPatientNameResult> getPrescriptionsByPatientName(string patientName)
    {
        List<sp_SearchPrescriptionsByPatientNameResult> myList = new List<sp_SearchPrescriptionsByPatientNameResult>();
        try
        {
            prescriptionsDataContext obj = new prescriptionsDataContext();
            myList = obj.sp_SearchPrescriptionsByPatientName(patientName).ToList();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return myList;
    }
    public List<sp_SearchPrescriptionsByDocIdResult> getPrescriptionsByDocId(string patientName, Guid docId)
    {
        List<sp_SearchPrescriptionsByDocIdResult> myList = new List<sp_SearchPrescriptionsByDocIdResult>();
        try
        {
            prescriptionsDataContext obj = new prescriptionsDataContext();
            myList = obj.sp_SearchPrescriptionsByDocId(patientName, docId).ToList();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return myList;
    }

    public string savePrescription(int appointmentId, int repeat, DateTime presDate) // save new record into databse
    {
        // create a new table with one row and this table is similar in schema with the table in database
        string result = "0";
        try
        {
            brdhc_PatientPrescription svTable = new brdhc_PatientPrescription()
            {
                AppointmentId = appointmentId,
                DateWritten = presDate,
                Repeat = repeat
            };
            prescriptionsDataContext objDataContext = new prescriptionsDataContext();
            // call the function to save the row into actual database table
            objDataContext.brdhc_PatientPrescriptions.InsertOnSubmit(svTable);
            objDataContext.SubmitChanges();
            result = svTable.PrescriptionId.ToString();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return result;
    }

    public string updatePrescription(int prescriptionId, int appointmentId, int repeat, DateTime presDate)
    {
        string result = "0";
        try
        {
            prescriptionsDataContext objDataContext = new prescriptionsDataContext();
            // select that particular row that is to be updated
            var tblRecords = objDataContext.brdhc_PatientPrescriptions.Single(p => p.PrescriptionId == Convert.ToInt32(prescriptionId));
            // make the changes     
            tblRecords.AppointmentId = appointmentId;
            tblRecords.DateWritten = presDate;
            tblRecords.Repeat = repeat;
            // update the datebase table with new values
            objDataContext.SubmitChanges();
            result = "1";
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return result;
    }

    public List<sp_SearchPrescriptionDetailsResult> getPrescriptionDetails(int prescriptionId)
    {
        List<sp_SearchPrescriptionDetailsResult> myList = new List<sp_SearchPrescriptionDetailsResult>();
        try
        {
            prescriptionsDataContext obj = new prescriptionsDataContext();
            myList = obj.sp_SearchPrescriptionDetails(prescriptionId).ToList();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return myList;
    }
    //public IQueryable<brdhc_PrescriptionDetail> getPrescriptionDetails(int prescriptionId)
    //{
    //    prescriptionsDataContext objDataContext = new prescriptionsDataContext();
    //    var presDetails =
    //        from pd in objDataContext.brdhc_PrescriptionDetails
    //        where pd.PrescriptionId == prescriptionId
    //        select pd;
    //    return presDetails;
    //}

    public void deletePresDetails(int prescriptionId)
    {
        prescriptionsDataContext objDataContext = new prescriptionsDataContext();
        // select the particular records from databse table and delete it
        var tblRecords =
            from a in objDataContext.brdhc_PrescriptionDetails
            where (a.PrescriptionId == prescriptionId)
            select a;
        // call the function to delete it and submit the changes
        objDataContext.brdhc_PrescriptionDetails.DeleteAllOnSubmit(tblRecords);
        objDataContext.SubmitChanges();
    }

    public void savePrescriptionDetails(int _prescriptionId, string _medicine, string _timings, int _days, int _quantity) // save new record into databse
    {
        // create a new table with one row and this table is similar in schema with the table in database
        brdhc_PrescriptionDetail svTable = new brdhc_PrescriptionDetail()
        {
            PrescriptionId = _prescriptionId,
            Medicine = _medicine,
            Timings = _timings,
            Days = _days,
            Quantity = _quantity
        };
        prescriptionsDataContext objDataContext = new prescriptionsDataContext();
        // call the function to save the row into actual database table
        objDataContext.brdhc_PrescriptionDetails.InsertOnSubmit(svTable);
        objDataContext.SubmitChanges();
        //return svTable.PrescriptionId.ToString();
    }

    public void deletePres(int prescriptionId)
    {
        prescriptionsDataContext objDataContext = new prescriptionsDataContext();
        // select the particular records from databse table and delete it
        var tblRecords =
            from a in objDataContext.brdhc_PatientPrescriptions
            where (a.PrescriptionId == prescriptionId)
            select a;
        // call the function to delete it and submit the changes
        objDataContext.brdhc_PatientPrescriptions.DeleteAllOnSubmit(tblRecords);
        objDataContext.SubmitChanges();
    }
}