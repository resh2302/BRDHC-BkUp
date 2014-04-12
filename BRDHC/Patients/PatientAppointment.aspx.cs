using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.Security;



public partial class PatientAppointment : System.Web.UI.Page
{
    clsAppointments objApp = new clsAppointments();
    clsCommon objCom = new clsCommon();
    static string strTime;
    static string strAppointmentId;
    static string strPatientUserId;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("../login.aspx");
            }
            else {
                Label lblDashboard = Master.dashboardHeading;
                lblDashboard.Text = "PATIENT DASHBOARD : APPOINTMENTS ";

                subRebind();
            }

            
        }

    }

    private void subRebind()
    {
        lblStatus.Visible = false;
        txtReason.Text = string.Empty;
        txtDate.Text = string.Empty;
        ddlDoctor.SelectedIndex = 0;
        ddlTimes.Items.Clear();
        strPatientUserId = string.Empty;
        strAppointmentId = string.Empty;
        strTime = string.Empty;

        string patientName = User.Identity.Name.ToString();
        strPatientUserId = Membership.GetUser().ProviderUserKey.ToString();
        List<sp_getAppByPatientIDResult> objRecords = objApp.getAppByPatientID(Guid.Parse(strPatientUserId));

        if (objRecords.Count > 0)
        {
            dlApp.DataSource = objRecords;
            dlApp.DataBind();
            pnlEmpty.Visible = false;
            pnlApp.Visible = true;
        }
        else {
            pnlApp.Visible = false;
            pnlEmpty.Visible = true;
        }

        subLoadDoctors();

        
    }

    //loading dropdown with doc names
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

    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
        removeBookedTimes(strTime);
    }

    private void removeBookedTimes(string previousTime)
    {
        subLoadTimes();

        lblStatus.Visible = false;
        // lblDate.Text = "Hello";
        List<sp_GetBookedTimeResult> objAvailTimes = objApp.getBookedTimes(ddlDoctor.SelectedValue.ToString(), DateTime.Parse(txtDate.Text));
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
            lblStatus.Visible = true;
            lblStatus.Text = "No time is available for this date. Please select another date.";
            lblStatus.Text = "";
        }
    }

    protected void subBookApp(Object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblStatus.Visible = true;
            try
            {
                string strHead = "";
                if (string.IsNullOrEmpty(strAppointmentId))
                {
                    objApp.bookAppointment(strPatientUserId, ddlDoctor.SelectedValue.ToString(), txtDate.Text, ddlTimes.SelectedItem.Text, txtReason.Text, "Pending");
                    strHead = "Your appointment has been booked with doctor ";
                    
                }
                else
                { // patient can reschedule?
                    objApp.updateAppointment(strAppointmentId, strPatientUserId, ddlDoctor.SelectedValue.ToString(), txtDate.Text, ddlTimes.SelectedItem.Text, txtReason.Text, "Accepted");
                    strHead = "Your appointment has been rescheduled with doctor ";
                }
                string strFullName = User.Identity.Name.ToString();
                StringBuilder strBody = new StringBuilder();
                //strBody.Append("<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a>");
                strBody.Append("<br />");
                strBody.Append("<br />");
                strBody.Append("<h3>Hi! " + strFullName + "</h3>");
                strBody.Append("<br />");
                strBody.Append("<br />");
                strBody.Append(strHead);
                strBody.Append("<strong>" + ddlDoctor.SelectedItem.Text + "</strong>");
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
                string emailResult = objCom.sendEMail(email, "resh2302@gmail.com", strBody.ToString(), "Your Appointment at BRDHC HUMBER Hospital", true);
                if (!string.IsNullOrEmpty(emailResult))
                {
                    lblStatus.Text = emailResult;
                }
                else
                {
                    lblStatus.Text = "record saved.";
                }
                subRebind();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.Message.ToString();
            }
        }
    }

    
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        subRebind();
    }
}