using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;


public partial class approveAppointment : System.Web.UI.Page
{
    clsAppointments objApp = new clsAppointments();
    clsCommon objCom = new clsCommon();
    static string strTime;
    static string strAppointmentId;
    static string strDocID;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("../login.aspx");
            }
            else
            {
                Label lblDashboard = Master.dashboardHeading;
                lblDashboard.Text = "DOCTOR ADMIN DASHBOARD : APPOINTMENT REQUESTS";
                _subRebind();
            }
            
        }
    }

    protected void _subRebind() {

        string patientName = User.Identity.Name.ToString();
        strDocID = Membership.GetUser().ProviderUserKey.ToString();
        List<sp_getAppByDocIDResult> objRecords = objApp.getAppByDocID(Guid.Parse(strDocID));

        if (objRecords.Count > 0)
        {
            dlApp.DataSource = objRecords;
            dlApp.DataBind();
            pnlEmpty.Visible = false;
            pnlApp.Visible = true;
        }
        else
        {
            pnlApp.Visible = false;
            pnlEmpty.Visible = true;
        }

        
    }

    protected void dlApp_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item)
        {
            HiddenField hdfStatus = (HiddenField)e.Item.FindControl("hdfStatus");
            if (hdfStatus.Value == "Pending")
            {
                RadioButtonList rbApprove = (RadioButtonList)e.Item.FindControl("rbApprove");
                rbApprove.ClearSelection();
            }
            else if (hdfStatus.Value == "Accepted")
            {
                RadioButtonList rbApprove = (RadioButtonList)e.Item.FindControl("rbApprove");
                rbApprove.SelectedValue = "Accept";
            }
            else if (hdfStatus.Value == "Rejected")
            {
                RadioButtonList rbApprove = (RadioButtonList)e.Item.FindControl("rbApprove");
                rbApprove.SelectedValue = "Reject";
            }
        }
    }

    protected void dlApp_ItemCommand(object source, DataListCommandEventArgs e)
    {
        dlApp.SelectedIndex = e.Item.ItemIndex;

        int appID = Int32.Parse(e.CommandArgument.ToString());

        RadioButtonList rbApprove = (RadioButtonList)dlApp.SelectedItem.FindControl("rbApprove");
        HiddenField hdfPID = (HiddenField)dlApp.SelectedItem.FindControl("hdfPID");

        if (rbApprove.SelectedValue == "Accept")
        {
            objApp.updateAppointmentRequest(appID, "Accepted");
            string email = Membership.GetUser(new Guid(hdfPID.Value.ToString())).Email;
            string emailResult = objCom.sendEMail(email, "<br/>Your appointment request for appID :" + appID + "has been accepted", "Your Appointment at BRDHC HUMBER Hospital", true);
            _subRebind();
        }
        else if(rbApprove.SelectedValue == "Reject")
        {
            objApp.updateAppointmentRequest(appID, "Rejected");
            string email = Membership.GetUser(new Guid(hdfPID.Value.ToString())).Email;
            string emailResult = objCom.sendEMail(email, "<br/>Sorry your appointment request for appID :" + appID + "has been rejected. Please contact us for further details.", "Your Appointment at BRDHC HUMBER Hospital", true);
            _subRebind();
        }
    }
}