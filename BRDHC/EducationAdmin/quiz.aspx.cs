using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EducationAdmin_quiz : System.Web.UI.Page
{
    quizClass objquiz = new quizClass();

    private void _subRebind()
    {
        txt_THISnameI.Text = string.Empty;
        txt_THISimageI.Text = string.Empty;
        txt_THIScaloriesI.Text = string.Empty;
        txt_THISfatI.Text = string.Empty;
        txt_THATnameI.Text = string.Empty;
        txt_THATimageI.Text = string.Empty;
        txt_THATcaloriesI.Text = string.Empty;
        txt_THATfatI.Text = string.Empty;
        txt_AnswerI.Text = string.Empty;
        rpt_all.DataSource = objquiz.getQues();
        rpt_all.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //Label lblDashboard = Master.dashboardHeading;
            //lblDashboard.Text = "EDUCATION DASHBOARD : HEALTH QUIZ";
            _subRebind();
            
        }
    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMes(objquiz.commitInsert(txt_THISnameI.Text, txt_THISimageI.Text, int.Parse(txt_THIScaloriesI.Text.ToString()), int.Parse(txt_THISfatI.Text.ToString()), txt_THATnameI.Text, txt_THATimageI.Text, int.Parse(txt_THATcaloriesI.Text.ToString()), int.Parse(txt_THATfatI.Text.ToString()), txt_AnswerI.Text), "insert");
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    private void _strMes(bool flag, string str)
    {
        if (flag)
        {
            lbl_mes.Text = "Question " + str + " was successful";
        }
        else
        {
            lbl_mes.Text = "Sorry, unable to " + str + " question";
        }
    }

    protected void subUpDel(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTHISname = (TextBox)e.Item.FindControl("txt_THISnameE");
                TextBox txtTHISimage = (TextBox)e.Item.FindControl("txt_THISimageE");
                TextBox txtTHIScalories = (TextBox)e.Item.FindControl("txt_THIScaloriesE");
                TextBox txtTHISfat = (TextBox)e.Item.FindControl("txt_THISfatE");
                TextBox txtTHATname = (TextBox)e.Item.FindControl("txt_THATnameE");
                TextBox txtTHATimage = (TextBox)e.Item.FindControl("txt_THATimageE");
                TextBox txtTHATcalories = (TextBox)e.Item.FindControl("txt_THATcaloriesE");
                TextBox txtTHATfat = (TextBox)e.Item.FindControl("txt_THATfatE");
                TextBox txtAnswer = (TextBox)e.Item.FindControl("txt_AnswerE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                Guid QuestionID = Guid.Parse(hdfID.Value.ToString());
                _strMes(objquiz.commitUpdate(QuestionID, txtTHISname.Text, txtTHISimage.Text, int.Parse(txtTHIScalories.Text.ToString()), int.Parse(txtTHISfat.Text.ToString()), txtTHATname.Text, txtTHATimage.Text, int.Parse(txtTHATcalories.Text.ToString()), int.Parse(txtTHATfat.Text.ToString()), txtAnswer.Text), "update");
                _subRebind();
                break;
            case "Delete":
                Guid _QuestionID = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMes(objquiz.commitDelete(_QuestionID), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }


    protected void DataPager_PreRender(object sender, EventArgs e)
    {
        rpt_all.DataSource = objquiz.getQues();
        rpt_all.DataBind();
    }
}
