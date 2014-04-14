using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VolunteerAdmin_VolApplicationAdmin : System.Web.UI.Page
{

    //creating a new instance of the volAppClass
    volAppClass objApp = new volAppClass();

    //binding data on page load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //overriding the master dashobard heading
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "VOLUNTEER ADMIN : APPLICATION";
            _subRebind();
        }
    }

    //binding data to the repeater
    private void _subRebind()
    {
        rpt_App.DataSource = objApp.getApps();
        rpt_App.DataBind();
    }

    //update, delete and cancel
    protected void rpt_App_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                  Label lblFName = (Label)e.Item.FindControl("lbl_fName");
                  Label lblLName = (Label)e.Item.FindControl("lbl_lName");
                  Label lblPhone = (Label)e.Item.FindControl("lbl_phone");
                  Label lblEmail = (Label)e.Item.FindControl("lbl_email");
                  Label lblAddress = (Label)e.Item.FindControl("lbl_address");
                  Label lblOccupation = (Label)e.Item.FindControl("lbl_occupation");
                  Label lblStudent = (Label)e.Item.FindControl("lbl_student");
                  Label lblPrevExp = (Label)e.Item.FindControl("lbl_prevExp");
                  Label lblWhyVol = (Label)e.Item.FindControl("lbl_whyVol");
                  TextBox txtReviewedU = (TextBox)e.Item.FindControl("txt_reviewedU");
                  HiddenField hdfAppId = (HiddenField)e.Item.FindControl("hdf_AppId");
                  Guid AppId = Guid.Parse(hdfAppId.Value.ToString());
                  _strMes(objApp.commitUpdate(AppId, lblFName.Text, lblLName.Text, lblPhone.Text, lblEmail.Text, lblAddress.Text, lblOccupation.Text, lblStudent.Text, lblPrevExp.Text, lblWhyVol.Text, txtReviewedU.Text), "update");
                _subRebind();
                break;
            case "Delete":
                Guid _OppId = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                _strMes(objApp.commitDelete(_OppId), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    //success or failure message
    private void _strMes(bool flag, string str)
    {
        if (flag)
        {
            lbl_mes.Text = "Notes " + str + " was successful";
        }
        else
        {
            lbl_mes.Text = "Sorry, unable to " + str + " notes";
        }
    }
}