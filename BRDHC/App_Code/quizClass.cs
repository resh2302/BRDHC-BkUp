using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class quizClass
{
    public IQueryable<brdhc_HealthTools_Quiz> getQues()
    {
        //creating an instance of our LINQ object
        healthToolsDataContext objQuiz = new healthToolsDataContext();
        //creating an anonymous variable with its value being the instance of teh LINQ object
        var allQues = objQuiz.brdhc_HealthTools_Quizs.Select(x => x);
        //var allQues = from x in objProd.products select x;
        return allQues;
    }

    public string getAnswer(Guid _QuestionID)
    {
        healthToolsDataContext objQuiz = new healthToolsDataContext();
        var ans = objQuiz.brdhc_HealthTools_Quizs.Single(x => x.QuestionID == _QuestionID);
        return ans.Answer;
    }

    public IQueryable<brdhc_HealthTools_Quiz> getQuesById(Guid _QuestionID)
    {
        healthToolsDataContext objQuiz = new healthToolsDataContext();
        var allQues = objQuiz.brdhc_HealthTools_Quizs.Where(x => x.QuestionID == _QuestionID).Select(x => x);
        //x into x, select all columns from the table
        //x.Id to access a specific column in the table
        return allQues;
    }

    //THIS IS AN INSERT
    public bool commitInsert(string _THISname, string _THISimage, int _THIScalories, int _THISfat, string _THATname, string _THATimage, int _THATcalories, int _THATfat, string _Answer)
    {
        healthToolsDataContext objQuiz = new healthToolsDataContext();
        using (objQuiz)
        {
            brdhc_HealthTools_Quiz objNewQuiz = new brdhc_HealthTools_Quiz();
            objNewQuiz.THISname = _THISname;
            objNewQuiz.THISimage = _THISimage;
            objNewQuiz.THIScalories = _THIScalories;
            objNewQuiz.THISfat = _THISfat;
            objNewQuiz.THATname = _THATname;
            objNewQuiz.THATimage = _THATimage;
            objNewQuiz.THATcalories = _THATcalories;
            objNewQuiz.THATfat = _THATfat;
            objNewQuiz.Answer = _Answer;
            objQuiz.brdhc_HealthTools_Quizs.InsertOnSubmit(objNewQuiz);
            objQuiz.SubmitChanges(); //this will commit the changes
            return true; //boolean
        }
    }

    //THIS IS AN UPDATE
    public bool commitUpdate(Guid _QuestionID, string _THISname, string _THISimage, int _THIScalories, int _THISfat, string _THATname, string _THATimage, int _THATcalories, int _THATfat, string _Answer)
    {
        healthToolsDataContext objQuiz = new healthToolsDataContext();
        using (objQuiz)
        {
            //updating a single row at a time which row depends on the _id
            var objUpQuiz = objQuiz.brdhc_HealthTools_Quizs.Single(x => x.QuestionID == _QuestionID);
            objUpQuiz.THISname = _THISname; //Up for update
            objUpQuiz.THISimage = _THISimage;
            objUpQuiz.THIScalories = _THIScalories;
            objUpQuiz.THISfat = _THISfat;
            objUpQuiz.THATname = _THATname;
            objUpQuiz.THATimage = _THATimage;
            objUpQuiz.THATcalories = _THATcalories;
            objUpQuiz.THATfat = _THATfat;
            objUpQuiz.Answer = _Answer;
            objQuiz.SubmitChanges(); //on submit use objQuiz
            return true;
        }
    }

    //THIS IS A DELETE
    public bool commitDelete(Guid _QuestionID)
    {
        healthToolsDataContext objQuiz = new healthToolsDataContext();
        using (objQuiz)
        {
            var objDelCan = objQuiz.brdhc_HealthTools_Quizs.Single(x => x.QuestionID == _QuestionID);
            objQuiz.brdhc_HealthTools_Quizs.DeleteOnSubmit(objDelCan); //if you want to delete all best to drop the table
            objQuiz.SubmitChanges();
            return true;
        }
    }
}