using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for feedback
/// </summary>
public class feedback
{
    public IQueryable<brdhc_Feedback> getFeedbacks()
    {
        CommonDataContext objfeedback = new CommonDataContext();
        var allfeedbacks = objfeedback.brdhc_Feedbacks.Select(x => x);
        return allfeedbacks;
    }

    public IQueryable<brdhc_Feedback> getFeedbackByID(int id)
    {
        CommonDataContext objfeedback = new CommonDataContext();
        var feedback = objfeedback.brdhc_Feedbacks.Where(x => x.feedbackId == id).Select(x => x);
        return feedback;
    }

    public bool commitInsert(string _firstname, string _lastname, string _ispatient, string _gender, string _city, string _state, string _mobile, string _email, string _feedback)
    {
        // insert new record into database
        CommonDataContext objfeedback = new CommonDataContext();
        using (objfeedback)
        {
            brdhc_Feedback obj = new brdhc_Feedback();


            obj.firstName = _firstname;
            obj.lastName = _lastname;
            obj.isPatient = _ispatient;
            obj.gender = _gender;
            obj.city = _city;
            obj.state = _state;
            obj.mobile = _mobile;
            obj.email = _email;
            obj.feedback = _feedback;
            objfeedback.brdhc_Feedbacks.InsertOnSubmit(obj);
            objfeedback.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        //deleting the record by id
        CommonDataContext obj = new CommonDataContext();
        using (obj)
        {
            var delFeedback = obj.brdhc_Feedbacks.Single(x => x.feedbackId == _id);
            obj.brdhc_Feedbacks.DeleteOnSubmit(delFeedback);
            obj.SubmitChanges();
            return true;
        }
    }

}
