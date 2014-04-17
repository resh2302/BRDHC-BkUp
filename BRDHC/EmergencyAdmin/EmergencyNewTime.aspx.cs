using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewTime : System.Web.UI.Page
{
    clsEmergency objEmergency = new clsEmergency();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "EMERGENCY ADMIN DASHBOARD : NEW WAIT TIME";
            _subRebind();
        }

        
    }

    // bind rpeater and reset text boxes
    private void _subRebind()
    {
        txtHrs.Text = "00";
        txtMin.Text = "00";
        rptCurrent.DataSource= objEmergency.getCurrentWaitTime();        
        rptCurrent.DataBind();
          
    }

    // method called for insert and cancel
    protected void subAdmin(object sender, CommandEventArgs e) {
        switch (e.CommandName)
        {
            case "Insert":                
                int hrs = int.Parse(txtHrs.Text);
                int min = int.Parse(txtMin.Text);
                TimeSpan time = new TimeSpan(hrs,min,00);
                string updatedBy = User.Identity.Name.ToString();
                _strMessage( objEmergency.insertWaitTime(new Guid(),time,DateTime.Now,updatedBy),"insert");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    // method used to display success message
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
}