﻿// AUTHOR :  JAGSIR SINGH
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_healthAlerts : System.Web.UI.Page
{
    #region "OBJECTS AND STATIC VARIABLES"
    clsHealthAlerts objHAlerts = new clsHealthAlerts();
    static Guid _healthAlertId;
    # endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "ADMIN DASHBOARD : ALERTS";
            pnlDetails.Visible = false;
            // bind the alerts to the list show on the page
            load_Records();
        }

    }

    private void load_Records()
    {
        string appName = WebConfigurationManager.AppSettings["appName"].ToString();
        List<sp_SearchHealthAlertsByNameResult> alerts = objHAlerts.getHealthAlerts(appName, txtSearchName.Text);
        // check if there are records then bind otherwise show message
        if (alerts.Count > 0)
        {
            lblErr.Visible = false;
            lstRecords.DataSource = alerts;
            lstRecords.DataBind();
        }
        else
        {
            lblErr.Visible = true;
            lblErr.Text = "No record found.";
        }
    }

    protected void subToggleForm(object sender, EventArgs e)
    {
        // toggle the form and list views
        lblErr.Visible = false;
        if (pnlDetails.Visible)
        {
            pnlDetails.Visible = false;
            pnlTable.Visible = true;
            btnSU.Text = "Update";
            load_Records();
        }
        else
        {
            pnlDetails.Visible = true;
            pnlTable.Visible = false;
            btnSU.Text = "Save";
            // clear all the control on the form 
            _healthAlertId = Guid.Empty;
            txtATitle.Text = string.Empty;
            txtDesc.Text = string.Empty;
            lblErr.Visible = false;
        }
    }

    protected void clearControls()
    {
        // reset ids and clear all textboxes
        // rebind the list 
        _healthAlertId = Guid.Empty;
        txtATitle.Text = string.Empty;
        txtDesc.Text = string.Empty;
        lblErr.Visible = false;
        load_Records();

    }

    protected void subSaveUpdate(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser();
        lblErr.Visible = true;
        try
        {
            string title = txtATitle.Text;
            string description = txtDesc.Text;
            // check if _healthAlertId exists then its update otherwise it is new record
            // save into database and show records
            if (_healthAlertId == null || _healthAlertId == Guid.Empty)
            {
                _healthAlertId = Guid.NewGuid();
                objHAlerts.saveHealthAlert(_healthAlertId, title, description, DateTime.Now, user.ProviderUserKey.ToString(), false);
                lblErr.Text = "Health Alert added successfully.";
                btnSU.Text = "Update";
            }
            else
            {
                objHAlerts.updateHealthAlert(_healthAlertId, title, description, DateTime.Now, user.ProviderUserKey.ToString(), false);
                lblErr.Text = "Health Alert update successfully.";
            }
        }
        catch (Exception ex)
        {
            // save the exception message in the database and show the message
            clsCommon.saveError(ex);
            lblErr.Text = ex.Message.ToString();
        }
    }

    protected void subPublish(object sender, EventArgs e)
    {
        // this will do the save or update but will also publish the alert. Then the alert will be published on the hoem page
        if (Page.IsValid)
        {
            MembershipUser user = Membership.GetUser();
            lblErr.Visible = true;
            try
            {
                string title = txtATitle.Text;
                string description = txtDesc.Text;
                objHAlerts.resetForPublish();
                // check for save and update
                if (_healthAlertId == null || _healthAlertId == Guid.Empty)
                {
                    _healthAlertId = Guid.NewGuid();
                    objHAlerts.saveHealthAlert(_healthAlertId, title, description, DateTime.Now, user.ProviderUserKey.ToString(), true);
                }
                else
                {
                    objHAlerts.updateHealthAlert(_healthAlertId, title, description, DateTime.Now, user.ProviderUserKey.ToString(), true);
                }
                lblErr.Text = "Health Alert published successfully.";
                clsCommon objCom = new clsCommon();
                string appName = WebConfigurationManager.AppSettings["appName"].ToString();

                // now if publish is successfull
                // then get all the emails of users from brdhc_AlertSubscribers
                // send each an email containing the alert as body part./
                List<sp_getAlertSubscribersResult> objEmails = objCom.sp_getAlertSubscribers(appName);

                foreach (sp_getAlertSubscribersResult record in objEmails)
                {
                    string fullName = "";
                    string toEmail = "";
                    string subscriberId = "";
                    StringBuilder strBody = new StringBuilder();
                    if (record.Name != null)
                    {
                        fullName = record.Name.ToString();
                    }
                    toEmail = record.Email.ToString();
                    subscriberId = record.UserId.ToString();

                    strBody.Append("<br />");
                    strBody.Append("<br />");
                    strBody.Append("<h3>Hi! " + fullName + "</h3>");
                    strBody.Append("<br />");
                    strBody.Append("<br />");
                    strBody.Append("We thought to notify you that there is an alert <a href='www.brdhchumber.com'>" + title + "</a>");
                    strBody.Append("<br />");
                    strBody.Append("Below is the description. Please look at it and forward this to others.");
                    strBody.Append("<br />");
                    strBody.Append("<br />");
                    strBody.Append(description);
                    strBody.Append("<br />");
                    strBody.Append("<b>Note: </b> If you do not want to get future emails <a href='http://www.brdhchumber.com/unsubscribe.aspx?uid=" + subscriberId + "'>unsubscribe<a/> here.");
                    strBody.Append("<br />");
                    strBody.Append("Wishing you very healthy life.");
                    strBody.Append("<br />");
                    strBody.Append("Team Humber");
                    string emailResult = objCom.sendEMail(toEmail, strBody.ToString(), "BRDHC Humber Alerts", true);
                }
            }
            catch (Exception ex)
            {
                lblErr.Text = ex.Message.ToString();
                clsCommon.saveError(ex);
            }
        }
    }

    protected void subSearch(object sender, EventArgs e)
    {
        load_Records();
    }
    protected void lstRecords_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        // alerts may have large data for description
        // but show only 200 characters in the list 
        // but on read only click, show the full description
        // also change the color according to publish status
        Label lblPublish = (Label)(e.Item.FindControl("lblPublish"));
        if (lblPublish.Text == "Published")
        {
            lblPublish.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblPublish.ForeColor = System.Drawing.Color.Red;
        }
        Label lblDescription = (Label)(e.Item.FindControl("lblDescription"));
        if (lblDescription.Text.Count() > 200)
        {
            lblDescription.Text = lblDescription.Text.Substring(0, 200) + " ....";
        }
    }
    protected void lstRecords_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        // perform different functions for edit and delte commands from list
        lblErr.Visible = false;
        _healthAlertId = Guid.Parse(((HiddenField)e.Item.FindControl("hdfHealthAlertId")).Value);
        if (e.CommandName == "editAlert")
        {
            txtATitle.Text = ((Label)e.Item.FindControl("lblTitle")).Text;
            txtDesc.Text = ((Label)e.Item.FindControl("lblADesc")).Text;
            pnlDetails.Visible = true;
            pnlTable.Visible = false;
            btnSU.Text = "Update";
        }
        else if (e.CommandName == "delAlert")
        {
            try
            {
                objHAlerts.deleteHealthAlert(_healthAlertId);
                load_Records();
                lblErr.Visible = true;
                lblErr.Text = "Alert deleted successfully.";
            }
            catch (Exception ex)
            {
                lblErr.Visible = true;
                lblErr.Text = ex.Message.ToString();
            }
        }
    }
    protected void dpRecords_PreRender(object sender, EventArgs e)
    {
        load_Records();
    }
}