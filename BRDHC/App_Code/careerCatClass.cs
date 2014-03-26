using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for careerCatClass
/// </summary>
public class careerCatClass
{
	public careerCatClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public IQueryable<brdhc_JobCategory> getCategories()
    {
        careerCategoryDataContext objCat = new careerCategoryDataContext();
        var allCats = objCat.brdhc_JobCategories.Select(x => x);
        return allCats;
    }

    public IQueryable<brdhc_JobCategory> getCategoryByID(Guid catID)
    {
        careerCategoryDataContext objCat = new careerCategoryDataContext();
        var singleCat = objCat.brdhc_JobCategories.Where(x => x.JobCategoryId == catID).Select(x => x);
        return singleCat;
    }
}