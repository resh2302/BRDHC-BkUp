using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsDoctors
/// </summary>
public class clsDoctors
{
	public clsDoctors()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<brdhc_Doctor> getDoctors()
    {
        DoctorinfoDataContext objDoc = new DoctorinfoDataContext();
        var allDocs = objDoc.brdhc_Doctors.Select(x => x);
        return allDocs;
    }

    public IQueryable<brdhc_Doctor> getRecordByID(Guid id)
    {
        DoctorinfoDataContext objDoc = new DoctorinfoDataContext();
        var singleRecord = objDoc.brdhc_Doctors.Where(x => x.DoctorId == id).Select(x => x);
        return singleRecord;
    }
}