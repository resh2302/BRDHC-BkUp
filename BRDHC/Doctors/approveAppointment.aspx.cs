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
            //if (!User.Identity.IsAuthenticated)
            //{
            //    Response.Redirect("../login.aspx");
            //}
            //else
            //{
                Label lblDashboard = Master.dashboardHeading;
                lblDashboard.Text = "DOCTOR ADMIN DASHBOARD : APPOINTMENT REQUESTS";
                _subRebind();
            //}
            
        }
    }

    protected void _subRebind() 
    {

        //strDocID = Membership.GetUser().ProviderUserKey.ToString();
        strDocID = "145d9c0f-2201-4b14-b751-2bc2e6cf03a3";
        List<sp_getAppByDocIDResult> objRecords = objApp.getAppByDocID(Guid.Parse(strDocID)); //get all appointments for this doctor suing stored procedure

        if (objRecords.Count > 0)
        {
            dlApp.DataSource = objRecords; // data list is bound to the appointments for this doctor
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

    // method to select status radio button according to approvalSatatus in the table
    protected void dlApp_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        foreach (DataListItem item in dlApp.Items) 
        {
            if (item.ItemType == ListItemType.Item)
            {
                HiddenField hdfStatus = (HiddenField)e.Item.FindControl("hdfStatus");
                if (hdfStatus.Value == "Pending")
                {
                    RadioButtonList rbApprove = (RadioButtonList)e.Item.FindControl("rbApprove");
                    rbApprove.SelectedValue = "Pending";                    
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
    }
    
    // method to send appointment request response
    protected void dlApp_ItemCommand(object source, DataListCommandEventArgs e)
    {
        // get the row of the selected record
        dlApp.SelectedIndex = e.Item.ItemIndex;

        //get controls within the datalist
        int appID = Int32.Parse(e.CommandArgument.ToString());

        RadioButtonList rbApprove = (RadioButtonList)dlApp.SelectedItem.FindControl("rbApprove");
        HiddenField hdfPID = (HiddenField)dlApp.SelectedItem.FindControl("hdfPID");

        // if request accepted
        if (rbApprove.SelectedValue == "Accept")
        {
            //update appointment status in table
            objApp.updateAppointmentRequest(appID, "Accepted");
            // get email id of patient
            string email = Membership.GetUser(new Guid(hdfPID.Value.ToString())).Email;
            
            //send email to patient with request response
            string emailResult = objCom.sendEMail(email, "<br/>Your appointment request for appID :" + appID + "has been accepted", "Your Appointment at BRDHC HUMBER Hospital", true);

            //rebind datalist
            _subRebind();
        }
        // if request rejected
        else if(rbApprove.SelectedValue == "Reject")
        {
            //update appointment status in table
            objApp.updateAppointmentRequest(appID, "Rejected");
            // get email id of patient
            string email = Membership.GetUser(new Guid(hdfPID.Value.ToString())).Email;
            //send email to patient with request response
            string emailResult = objCom.sendEMail(email, "<br/>Sorry your appointment request for appID :" + appID + "has been rejected. Please contact us for further details.", "Your Appointment at BRDHC HUMBER Hospital", true);

            //rebind datalist
            _subRebind();
        }
    }
}