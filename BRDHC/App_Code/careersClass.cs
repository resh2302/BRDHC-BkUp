using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for careersClass
/// </summary>
public class careersClass
{
	public IQueryable<brdhc_JobPost> getJobs()
	{
        careersDataContext objJobs = new careersDataContext();
        var allJobs = objJobs.brdhc_JobPosts.Select(x => x);
        return allJobs;
	}

    public IQueryable<brdhc_JobPost> getJobByID(Guid jobID)
    {
        careersDataContext objJobs = new careersDataContext();
        var singleJob = objJobs.brdhc_JobPosts.Where(x => x.JobPostId == jobID).Select(x => x);
        return singleJob;
    }
    //insert new Job
    public bool insertJob(Guid jobID,  //Guid catID,string _catTitle, bool _catActive, 
        string _title, string _description, DateTime _postDate, DateTime _expDate, string _email, bool _active)
    {
        careersDataContext objJobs = new careersDataContext();
        using (objJobs)
        {
            brdhc_JobPost objNewJob = new brdhc_JobPost();
            objNewJob.JobPostId = Guid.NewGuid();
                //careerCategoryDataContext objCat = new careerCategoryDataContext();
                //using (objCat)
                //{
                //   brdhc_JobCategory objNewCat = new brdhc_JobCategory();
                //   objNewCat.JobCategoryId = Guid.NewGuid();
                //   objCat.brdhc_JobCategories.InsertOnSubmit(objNewCat);
                //   objCat.SubmitChanges();
                //   objNewCat.JobCategoryName = _catTitle;
                //   objNewCat.IsActive = _catActive;
                //}
            objNewJob.JobPostTitle = _title;
            objNewJob.JobPostDescription = _description;
            objNewJob.JobPostingDate = _postDate;
            objNewJob.ExpDate = _expDate;
            objNewJob.ContactEmail = _email;
            objNewJob.IsActive = _active;
            objJobs.brdhc_JobPosts.InsertOnSubmit(objNewJob);
            objJobs.SubmitChanges();
            return true;
        }
    }

    //delete Job

    public bool deleteJob(Guid jobID)
    {
        careersDataContext objJobs = new careersDataContext();
        using (objJobs)
        {
            var objDelJob = objJobs.brdhc_JobPosts.Where(x => x.JobPostId == jobID);
            objJobs.brdhc_JobPosts.DeleteAllOnSubmit(objDelJob);
            objJobs.SubmitChanges();
            return true;
        }
    }
    // update
    public void updateJob(string jobID, string _title, string _description, DateTime _expDate, string _email //bool _active
        )
    {
        careersDataContext objJobs = new careersDataContext();
        var job = objJobs.brdhc_JobPosts.Single(x => x.JobPostId == new Guid(jobID));

        job.JobPostTitle = _title;
        job.JobPostDescription = _description;
        job.ExpDate = _expDate;
        job.ContactEmail = _email;
        //job.IsActive = _active;
        objJobs.SubmitChanges();
    }

}