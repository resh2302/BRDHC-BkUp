﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for careerAppClass
/// </summary>
public class careerAppClass
{
	public IQueryable<brdhc_JobApplication> getApps()
	{
        careersAppDataContext objApps = new careersAppDataContext();
        var allApps = objApps.brdhc_JobApplications.Select(x => x);
        return allApps;
	}

    public IQueryable<brdhc_JobApplication> getAppByID(Guid appID)
    {
        careersAppDataContext objApps = new careersAppDataContext();
        var singleApp = objApps.brdhc_JobApplications.Where(x => x.ApplicationId == appID).Select(x => x);
        return singleApp;
    }

    public IQueryable<brdhc_JobApplication> getAppByJobID(Guid jobID)
    {
        careersAppDataContext objApps = new careersAppDataContext();
        var singleApp = objApps.brdhc_JobApplications.Where(x => x.JobPostId == jobID).Select(x => x);
        return singleApp;
    }
    //insert
    public bool insertApp(Guid appID, Guid jobID, string _fname, string _lname, string _email, string _phone //string _resume
        )
    {
        careersAppDataContext objApps = new careersAppDataContext();
        using (objApps)
        {
            brdhc_JobApplication objNewApp = new brdhc_JobApplication();
            objNewApp.ApplicationId = Guid.NewGuid();
            objNewApp.JobPostId = Guid.Parse(jobID.ToString());
            objNewApp.FirstName = _fname;
            objNewApp.LastName = _lname;
            objNewApp.Email = _email;
            objNewApp.Phone = _phone;
            //objNewApp.ResumePath = _resume;
            objApps.brdhc_JobApplications.InsertOnSubmit(objNewApp);
            objApps.SubmitChanges();
            return true;
        }
    }

    public bool uploadResume(Guid appID, Guid jobID, string resume)
    {
        careersAppDataContext objApps = new careersAppDataContext();
        using (objApps)
        {
            brdhc_JobApplication objNewRes = new brdhc_JobApplication();
            objNewRes.ApplicationId = appID;
            objNewRes.JobPostId = jobID;
            objNewRes.ResumePath = resume;
            //objApps.brdhc_JobApplications.
            objApps.SubmitChanges();
            return true;
        }
     
    }

    public bool deleteApp(Guid appID)
    {
        careersAppDataContext objApps = new careersAppDataContext();
        using (objApps)
        {
            var objDelApp = objApps.brdhc_JobApplications.Single(x => x.ApplicationId == appID);
            objApps.brdhc_JobApplications.DeleteOnSubmit(objDelApp);
            return true;
        }
    }
}