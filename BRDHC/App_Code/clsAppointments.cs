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

    public void bookAppointment(string patientUserId, string doctorUserId, string appointmentDate, string appointmentTime, string reason, bool isApproved) // save new record into databse
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
                IsApproved = isApproved
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

    public void updateAppointment(string appointmentId, string patientUserId, string doctorUserId, string appointmentDate, string appointmentTime, string reason, bool isApproved)
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
            appointment.IsApproved = isApproved;
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

}