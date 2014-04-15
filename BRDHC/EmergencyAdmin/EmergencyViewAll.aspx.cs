using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAll : System.Web.UI.Page
{
    clsEmergency objEmergency = new clsEmergency();
    
    protected string hrsU  { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "EMERGENCY ADMIN DASHBOARD : VIEW ALL WAIT TIMES";
            _subRebind();
        }
    }
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lblStatus.Visible = true;
            lblStatus.Text = str + " was successful";
        }
        else
        {
            lblStatus.Visible = true;
            lblStatus.Text = "Sorry, unable to " + str + " time";
        }
    }

    protected void subAction(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Update":
                pnlEdit.Visible = true;
                Guid id = Guid.Parse( e.CommandArgument.ToString());
                rptUpdate.DataSource = objEmergency.getRecordByID(id);
                rptUpdate.DataBind();
                break;
            case "Delete":
                Guid _id = Guid.Parse(e.CommandArgument.ToString());
                _strMessage(objEmergency.deleteWaitTime(_id), "delete");
                _subRebind();
                break;
        }
    }

    protected void subEdit(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Update":
                 HiddenField hdfID = (HiddenField)e.Item.FindControl("hdfIDU");
                 HiddenField hdfWaitTime = (HiddenField)e.Item.FindControl("hdfWaitTimeU");
                 Guid EmergencyID = Guid.Parse(hdfID.Value.ToString());
                 TextBox txtHrs = (TextBox)e.Item.FindControl("txtHrsU");
                 TextBox txtMin = (TextBox)e.Item.FindControl("txtMinU");
                string updatedBy = User.Identity.Name.ToString();

                 int hrs = int.Parse(txtHrs.Text);
                 int min = int.Parse(txtMin.Text);
                 TimeSpan time = new TimeSpan(hrs, min, 00);
                 _strMessage(objEmergency.updateWaitTime(EmergencyID, time, updatedBy), "update");
                _subRebind();
                break;            
            case "Cancel":
                _subRebind();
                break;
        }
    }

    protected void subItemData(object sender, RepeaterItemEventArgs e)
    {
        HiddenField hdfID = (HiddenField)e.Item.FindControl("hdfIDU");
        HiddenField hdfWaitTime = (HiddenField)e.Item.FindControl("hdfWaitTimeU");
        Guid EmergencyID = Guid.Parse(hdfID.Value.ToString());

        TimeSpan time = TimeSpan.Parse(hdfWaitTime.Value.ToString());

        TextBox txtHrsU = (TextBox)e.Item.FindControl("txtHrsU");
        txtHrsU.Text = time.Hours.ToString();       

        TextBox txtMinU = (TextBox)e.Item.FindControl("txtMinU");
        txtMinU.Text = time.Minutes.ToString();
    }

    private void _subRebind() 
    {
        pnlEdit.Visible = false;
        rptAllRecords.DataSource = objEmergency.getEmergencyRecords();
        rptAllRecords.DataBind();
    }
}