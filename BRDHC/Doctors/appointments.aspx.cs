using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_appointments : System.Web.UI.Page
{
    #region "OBJECTS AND STATIC VARIABLES"
    clsCommon objCom = new clsCommon();
    clsUserDetails objUser = new clsUserDetails();
    clsAppointments objApp = new clsAppointments();
    static string strPatientUserId;
    static string strTime;
    static string strAppointmentId;
    # endregion
    MembershipUser user = Membership.GetUser();
    static string strDocName = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            calDate.StartDate = DateTime.Now;
            Label lblDashboard = Master.dashboardHeading;
            if (Roles.IsUserInRole(user.UserName, "Doctors"))
            {
                lblDashboard.Text = "DOCTOR ADMIN DASHBOARD : APPOINTMENTS"; 
                pnlDocsDDL.Visible = false;
            }
            else
            {
                pnlDocsDDL.Visible = true;
                lblDashboard.Text = "ADMIN DASHBOARD : APPOINTMENTS";
                subLoadDoctors();
            }
            subLoadAppointments();

            pnlDetails.Visible = false;
        }

    }

    # region "LOADING DROPDOWNS"
    protected void subLoadDoctors()
    {
        ddlDoctor.DataSource = objCom.getUsersByRole("doctors");
        ddlDoctor.DataTextField = "FullName";
        ddlDoctor.DataValueField = "UserId";
        ddlDoctor.DataBind();
    }
    protected void subLoadTimes()
    {
        ddlTimes.DataSource = objCom.GetTimeIntervals();
        ddlTimes.DataBind();
    }
    # endregion

    # region "BOTH SEARCH BUTTON CLICKS"
    protected void subGetPatient(Object sender, EventArgs e)
    {
        List<brdhc_UserBasicInfo> lstUser = objUser.getPatient(txtSearch.Text).ToList();
        if (lstUser.Count == 1)
        {
            lblErr.Visible = false;
            txtPName.Text = lstUser[0].FirstName + " " + lstUser[0].LastName;
            strPatientUserId = lstUser[0].UserId.ToString();
        }
        else
        {
            lblErr.Visible = true;
            lblErr.Text = "Patient does not exists. Please check Health Card Number and try again!";
        }
    }
    protected void subSearchAppointments(Object sender, EventArgs e)
    {
        lblErr.Visible = false;
        subLoadAppointments();
    }
    # endregion
    
    protected void subToggleForm(object sender, EventArgs e)
    {
        lblErr.Visible = false;
        if (pnlDetails.Visible)
        {
            pnlDetails.Visible = false;
            pnlTable.Visible = true;
            subLoadAppointments();
        }
        else
        {
            pnlDetails.Visible = true;
            pnlTable.Visible = false;
            btnSU.Text = "Save";
            pnlSearch.Visible = true;
            clearControls();
        }
    }
    protected void clearControls()
    {
        txtSearch.Text = string.Empty;
        txtPName.Text = string.Empty;
        txtDate.Text = string.Empty;
        txtReason.Text = string.Empty;
        if (!Roles.IsUserInRole(user.UserName, "Doctors"))
        {
            ddlDoctor.SelectedIndex = 0;
        }
        ddlTimes.Items.Clear();
        strPatientUserId = string.Empty;
        strAppointmentId = string.Empty;
        lblErr.Visible = false;
        strTime = string.Empty;
    }

    # region "REPEATER LOADING AND EVENTS"
    protected void subLoadAppointments()
    {
        string appName = WebConfigurationManager.AppSettings["appName"].ToString();
       
        if (Roles.IsUserInRole(user.UserName, "Doctors"))
        {
            List<sp_SearchAppsByDoctorIdResult> objRecords = objApp.getAppointmentsByDoctorId(appName, txtSearchName.Text, Guid.Parse(user.ProviderUserKey.ToString()));

            if (objRecords.Count > 0)
            {
                lblErr.Visible = false;
                rptApp.Visible = true;
                rptApp.DataSource = objRecords;
                rptApp.DataBind();
            }
            else
            {
                lblErr.Visible = true;
                lblErr.Text = "No records found.";
                rptApp.Visible = false;
            }
        }
        else
        {
            List<sp_SearchAppsByPatientNameResult> objRecords = objApp.getAppointmentsByPatientName(appName, txtSearchName.Text);
            if (objRecords.Count > 0)
            {
                lblErr.Visible = false;
                rptApp.Visible = true;
                rptApp.DataSource = objRecords;
                rptApp.DataBind();
            }
            else
            {
                lblErr.Visible = true;
                lblErr.Text = "No records found.";
                rptApp.Visible = false;
            }
        }
    }
    protected void subCommands(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "deleteApp":
                subDelete(e);
                break;
            case "editApp":
                subEdit(e);
                break;
        }
    }
    protected void subItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string appDate = ((Label)e.Item.FindControl("lblDate")).Text;
            if (Convert.ToDateTime(appDate) < DateTime.Now)
            {
                ((Button)e.Item.FindControl("btnEdit")).Visible = false;
            }
        }
    }
    # endregion

    #region "SAVE UPDATE AND DELETE"
    protected void subBookApp(Object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblErr.Visible = true;
            try
            {
                string docId = string.Empty;
                if (Roles.IsUserInRole(user.UserName, "Doctors"))
                {
                    docId = user.ProviderUserKey.ToString();
                }
                else
                {
                    docId = ddlDoctor.SelectedValue.ToString();
                }

                string strHead = "";
                if (string.IsNullOrEmpty(strAppointmentId))
                {
                    objApp.bookAppointment(strPatientUserId, docId, txtDate.Text, ddlTimes.SelectedItem.Text, txtReason.Text, "Accepted");
                    strHead = "Your appointment has been booked with doctor ";
                }
                else
                {
                    objApp.updateAppointment(strAppointmentId, strPatientUserId, docId, txtDate.Text, ddlTimes.SelectedItem.Text, txtReason.Text, "Accepted");
                    strHead = "Your appointment has been rescheduled with doctor ";
                }
                string strFullName = txtPName.Text;
                StringBuilder strBody = new StringBuilder();
                //strBody.Append("<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a>");
                strBody.Append("<br />");
                strBody.Append("<br />");
                strBody.Append("<h3>Hi! " + strFullName + "</h3>");
                strBody.Append("<br />");
                strBody.Append("<br />");
                strBody.Append(strHead);
                strBody.Append("<strong>" + strDocName + "</strong>");
                strBody.Append("<br />");
                strBody.Append("Please bring list of medicines you are taking at the time.");
                strBody.Append("<br />");
                strBody.Append("<strong>Appointment Date:   " + txtDate.Text + " </strong>");
                strBody.Append("<br />");
                strBody.Append("<strong>Appointment Time:   " + ddlTimes.SelectedItem.Text + " </strong>");
                strBody.Append("<br />");
                strBody.Append("If you have any question Please do not hasitate to call us.");
                strBody.Append("<br />");
                strBody.Append("If you feel that you can not reach at the appointment please call us or send request to reschedule 24 hours prior to your current appointment.");
                strBody.Append("<br />");
                strBody.Append("Team Humber");
               // strBody.Append("<br /></div>");
                string email = Membership.GetUser(new Guid(strPatientUserId)).Email;
                string emailResult = objCom.sendEMail(email, strBody.ToString(), "Your Appointment at BRDHC HUMBER Hospital", true);
                if (!string.IsNullOrEmpty(emailResult))
                {
                    lblErr.Text = emailResult;
                }
                else
                {
                    lblErr.Text = "record saved.";
                }

            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message.ToString();
            }
        }
    }
    protected void subDelete(RepeaterCommandEventArgs e)
    {
        lblErr.Visible = true;
        try
        {
            strAppointmentId = ((HiddenField)e.Item.FindControl("appointId")).Value;
            objApp.deleteAppointment(strAppointmentId);
            lblErr.Text = "Appointment deleted!";
            subLoadAppointments();
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message.ToString();
        }
    }
    protected void subEdit(RepeaterCommandEventArgs e)
    {
        lblErr.Visible = false;
        pnlDetails.Visible = true;
        btnSU.Text = "Reschedule";
        strDocName = ((Label)e.Item.FindControl("lblDName")).Text;
        txtPName.Text = ((Label)e.Item.FindControl("lblPName")).Text;
        ddlDoctor.SelectedValue = ((HiddenField)e.Item.FindControl("hdfDId")).Value;
        txtDate.Text = ((Label)e.Item.FindControl("lblDate")).Text;
        strTime = ((Label)e.Item.FindControl("lblTime")).Text;
        removeBookedTimes(strTime);
        int index = ddlTimes.Items.IndexOf(new ListItem(strTime));
        ddlTimes.SelectedIndex = index;

        txtReason.Text = ((Label)e.Item.FindControl("lblReason")).Text;

        strPatientUserId = ((HiddenField)e.Item.FindControl("hdfPId")).Value;
        strAppointmentId = ((HiddenField)e.Item.FindControl("appointId")).Value;
        pnlSearch.Visible = false;
        pnlTable.Visible = false;
    }
    # endregion
       
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
        removeBookedTimes(strTime);
    }

    private void removeBookedTimes(string previousTime)
    {
        subLoadTimes();

        lblErr.Visible = false;
        string docId = string.Empty;
        if (Roles.IsUserInRole(user.UserName, "Doctors"))
        {
            docId = user.ProviderUserKey.ToString();
        }
        else
        {
            docId = ddlDoctor.SelectedValue.ToString();
        }
        List<sp_GetBookedTimeResult> objAvailTimes = objApp.getBookedTimes(docId, DateTime.Parse(txtDate.Text));
        if (objAvailTimes.Count > 0)
        {
            foreach (sp_GetBookedTimeResult ob in objAvailTimes)
            {
                ListItem itm = ddlTimes.Items.FindByText(ob.AppointmentTime);
                if (itm.Text != previousTime)
                {
                    ddlTimes.Items.Remove(itm);
                }
            }
        }
        if (ddlTimes.Items.Count == 0)
        {
            lblErr.Visible = true;
            lblErr.Text = "No time is available for this date. Please select another date.";
            txtDate.Text = "";
        }
    }

    protected void subChangeDoc(object sender, EventArgs e)
    {
        lblErr.Visible = false;
        txtDate.Text = "";
        ddlTimes.Items.Clear();
    }
}