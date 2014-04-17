using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Feedback_feedback : System.Web.UI.Page
{
    //object of clscommon class to access the method to send email
    clsCommon objSendMail = new clsCommon();
    //object of feedback class
    feedback obj = new feedback();

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }


    protected void insertFeedback(object sender, RepeaterCommandEventArgs e)
    {
        //finding all the textbox and radiobuttonlist control inside the repeater
        TextBox fname = (TextBox)e.Item.FindControl("txt_fname");
        TextBox lname = (TextBox)e.Item.FindControl("txt_lname");
        TextBox email = (TextBox)e.Item.FindControl("txt_email");
        TextBox phone = (TextBox)e.Item.FindControl("txt_phone");
        TextBox city = (TextBox)e.Item.FindControl("txt_city");
        TextBox state = (TextBox)e.Item.FindControl("txt_state");
        TextBox feedback = (TextBox)e.Item.FindControl("txt_feedback");
        RadioButtonList rblpatient = (RadioButtonList)e.Item.FindControl("r_isPatient");
        RadioButtonList rblgender = (RadioButtonList)e.Item.FindControl("r_gender");
        Label message = (Label)e.Item.FindControl("lbl_message");



        switch (e.CommandName)
        {
                //if commandname is insert,insert data intp feedback table and send email to person who submitted feedback
            case "Insert":
                _strMessage(obj.commitInsert(fname.Text, lname.Text, rblpatient.SelectedItem.Text, rblgender.SelectedItem.Text, city.Text, state.Text, phone.Text, email.Text, feedback.Text), "Thank you for the feedback");
                objSendMail.sendEMail(email.Text, "<div><br />" + "<br />Thank you for yor Feedback! <br/>"
                   + "' <br />We will reply as soon as possible", "(Blind River District Health Centre)", true);
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    private void _subRebind()
    {
        //binding the repeater
        rpt_feedback.DataSource = obj.getFeedbacks();
        rpt_feedback.DataBind();
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            //redirecting the user if the feedback is successful
            Response.Redirect("~/Feedback/feedbackThanku.aspx");
            lbl_message.Text = str;
        }
        else
            lbl_message.Text = "sorry, unable to submit your feedback";

    }
}