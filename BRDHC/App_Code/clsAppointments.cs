///////////////////////////////////////////////////////////////////
// AUTHOR:           JAGSIR
// LAST MODIFIED BY: JAGSIR
// DATE MODIFIED: -  22 FEB 2014
// DESCRIPTION:      CLASS FOR APPOINTMENT FUNCTIONALITY
///////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Reflection;
using System.Data;

/// <summary>
/// Summary description for clsAppointments
/// </summary>
public class clsAppointments
{
    public List<sp_SearchAppsByPatientNameResult> getAppointmentsByPatientName(string applicationName, string patientName)
    {
        List<sp_SearchAppsByPatientNameResult> myList = new List<sp_SearchAppsByPatientNameResult>();
        try
        {
            AppointmentsDataContext obj = new AppointmentsDataContext();
            myList = obj.sp_SearchAppsByPatientName(applicationName, patientName).ToList();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return myList;
    }

    public List<sp_GetBookedTimeResult> getBookedTimes(string doctorUserId, DateTime appointmentDate)
    {
        List<sp_GetBookedTimeResult> myList = new List<sp_GetBookedTimeResult>();
        try
        {
            AppointmentsDataContext obj = new AppointmentsDataContext();
            myList = obj.sp_GetBookedTime(Guid.Parse(doctorUserId), appointmentDate).ToList();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return myList;
    }

    public void bookAppointment(string patientUserId, string doctorUserId, string appointmentDate, string appointmentTime, string reason, string approvalStatus) // save new record into databse
    {
        try
        {
            // create a new table with one row and this table is similar in schema with the table in database
            brdhc_PatientAppointment svTable = new brdhc_PatientAppointment()
            {
                PatientUserId = new Guid(patientUserId),
            DoctorUserId = new Guid(doctorUserId),
            AppointmentDate = Convert.ToDateTime(appointmentDate),
            AppointmentTime = appointmentTime,
            Reason = reason,
            approvalStatus = approvalStatus // Jagsir I have changed this - Reshma
        };
            AppointmentsDataContext objApp = new AppointmentsDataContext();
            // call the function to save the row into actual database table
            objApp.brdhc_PatientAppointments.InsertOnSubmit(svTable);
            objApp.SubmitChanges();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
    }

    public void updateAppointment(string appointmentId, string patientUserId, string doctorUserId, string appointmentDate, string appointmentTime, string reason, string approvalStatus)
    {
        try
        {
            AppointmentsDataContext objApp = new AppointmentsDataContext();
            // select that particular row that is to be updated
            var appointment = objApp.brdhc_PatientAppointments.Single(p => p.AppointmentId == Convert.ToInt32(appointmentId));
            // make the changes
            appointment.PatientUserId = new Guid(patientUserId);
            appointment.DoctorUserId = new Guid(doctorUserId);
            appointment.AppointmentDate = Convert.ToDateTime(appointmentDate);
            appointment.AppointmentTime = appointmentTime;
            appointment.Reason = reason;
            appointment.approvalStatus = approvalStatus; // Jagsir I have changed this - Reshma
            appointment.CreatedOnDate = DateTime.Now; // Jagsir I added this because the default value gave some very old date - Reshma
        // update the datebase table with new values
            objApp.SubmitChanges();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
    }

    public void deleteAppointment(string appointmentId)
    {
        try
        {
            AppointmentsDataContext objApp = new AppointmentsDataContext();
            // select the particular records from databse table and delete it
            var appointments =
                from a in objApp.brdhc_PatientAppointments
                where (a.AppointmentId == Convert.ToInt32(appointmentId))
                select a;
            // call the function to delete it and submit the changes
            objApp.brdhc_PatientAppointments.DeleteAllOnSubmit(appointments);
            objApp.SubmitChanges();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
    }

    public List<sp_getAppByPatientIDResult> getAppByPatientID(Guid pid) //added by REshma
    {
        
        AppointmentsDataContext obj = new AppointmentsDataContext();
        return obj.sp_getAppByPatientID(pid).ToList();
    }

    public List<sp_getAppByDocIDResult> getAppByDocID(Guid docID) // added by REshma
    {
        List<sp_getAppByDocIDResult> myList = new List<sp_getAppByDocIDResult>();
        AppointmentsDataContext obj = new AppointmentsDataContext();
        return obj.sp_getAppByDocID(docID).ToList();
    }

    public void updateAppointmentRequest(int appointmentId, string approvalStatus)
    {
        AppointmentsDataContext objApp = new AppointmentsDataContext();
        var appointment = objApp.brdhc_PatientAppointments.Single(p => p.AppointmentId == Convert.ToInt32(appointmentId));

        appointment.approvalStatus = approvalStatus;// Jagsir I have changed this - Reshma
        objApp.SubmitChanges();
    }
}