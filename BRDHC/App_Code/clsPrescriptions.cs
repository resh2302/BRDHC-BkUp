﻿////////////////////////////////////////////////////////////////////
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
        PrescriptionsDataContext udObj = new PrescriptionsDataContext();
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
            PrescriptionsDataContext obj = new PrescriptionsDataContext();
            myList = obj.sp_SearchPatientPrescription(Convert.ToInt32(appointmentId)).ToList();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
        return myList;
    }

}