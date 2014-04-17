////////////////////////////////////////////////////////////////////
// AUTHOR:           MARKI SVEEN
// DESCRIPTION:      CLASS FOR VOLUNTEER OPPORTUNITIES
///////////////////////////////////////////////////////////////////

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class volunteerClass
{
    public IQueryable<brdhc_volunteerOpp> getOpps()
    {
        //creating an instance of our LINQ object
        //creating an anonymous variable with its value being the instance of the LINQ object
        //var allOpps = from x in objProd.products select x;

        volunteerClassDataContext objVol = new volunteerClassDataContext();
        var allOpps = objVol.brdhc_volunteerOpps.Select(x => x);
        return allOpps;
    }

    //public string getReviewed(Guid _OppId)
    //{
    //    volunteerClassDataContext objVol = new volunteerClassDataContext();
    //    var ans = objVol.brdhc_volunteerOpps.Single(x => x.OppId == _OppId);
    //    return ans.FIELD;
    //}

    public IQueryable<brdhc_volunteerOpp> getOppById(Guid _OppId)
    {
        volunteerClassDataContext objVol = new volunteerClassDataContext();
        var allOpps = objVol.brdhc_volunteerOpps.Where(x => x.OppId == _OppId).Select(x => x);
        return allOpps;
        //x into x, select all columns from the table
        //x.Id to access a specific column in the table
    }

    //THIS IS AN INSERT
    public bool commitInsert(string _OppTitle, string _Skills, string _Benefits, string _Other, string _CommitmentHow, string _CommitmentWhen, string _ContactPerson, string _Department, string _Reviewed)
    {
        volunteerClassDataContext objVol = new volunteerClassDataContext();
        try
        {
            brdhc_volunteerOpp objNewOpp = new brdhc_volunteerOpp();
            objNewOpp.OppTitle = _OppTitle;
            objNewOpp.Skills = _Skills;
            objNewOpp.Benefits = _Benefits;
            objNewOpp.Other = _Other;
            objNewOpp.CommitmentHow = _CommitmentHow;
            objNewOpp.CommitmentWhen = _Skills;
            objNewOpp.ContactPerson = _ContactPerson;
            objNewOpp.Department = _Department;
            objNewOpp.Reviewed = _Reviewed;
            objVol.brdhc_volunteerOpps.InsertOnSubmit(objNewOpp);
            objVol.SubmitChanges(); //this will commit the changes
            return true; //boolean
        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
            return false;
        }
    }

    //THIS IS AN UPDATE
    public bool commitUpdate(Guid _OppId, string _OppTitle, string _Skills, string _Benefits, string _Other, string _CommitmentHow, string _CommitmentWhen, string _ContactPerson, string _Department, string _Reviewed)
    {
        volunteerClassDataContext objVol = new volunteerClassDataContext();
        try
        {
            //updating a single row at a time which row depends on the _id
            var objUpQuiz = objVol.brdhc_volunteerOpps.Single(x => x.OppId == _OppId);
            objUpQuiz.OppTitle = _OppTitle; //Up for update
            objUpQuiz.Skills = _Skills;
            objUpQuiz.Benefits = _Benefits;
            objUpQuiz.Other = _Other;
            objUpQuiz.CommitmentHow = _CommitmentHow;
            objUpQuiz.CommitmentWhen = _CommitmentWhen;
            objUpQuiz.ContactPerson = _ContactPerson;
            objUpQuiz.Department = _Department;
            objUpQuiz.Reviewed = _Reviewed;
            objVol.SubmitChanges(); //on submit use objVol
            return true;
        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
            return false;
        }
    }

    //THIS IS A DELETE
    public bool commitDelete(Guid _OppId)
    {
        volunteerClassDataContext objVol = new volunteerClassDataContext();
        try
        {
            var objDelCan = objVol.brdhc_volunteerOpps.Single(x => x.OppId == _OppId);
            objVol.brdhc_volunteerOpps.DeleteOnSubmit(objDelCan); //if you want to delete all best to drop the table
            objVol.SubmitChanges();
            return true;
        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
            return false;
        }
    }
}