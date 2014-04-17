using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class alerts : System.Web.UI.Page
{
    clsHealthAlerts objAlert = new clsHealthAlerts();
    clsCommon objCom = new clsCommon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["aid"].ToString()))
            {
                try
                {
                    Guid alertId = new Guid(Request.QueryString["aid"].ToString());

                    IQueryable<brdhc_HealthAlert> alerts = objAlert.getAlertById(alertId);
                    if (alerts.Count() > 0)
                    {
                        hfaid.Value = alertId.ToString();
                        foreach (brdhc_HealthAlert alt in alerts)
                        {
                            lblTitle.Text = alt.HealthAlertTitle;
                            lblDate.Text = "Date:  " + alt.AlertDate.ToShortDateString();
                            lblDesc.Text = alt.HealthAlertDescription;
                        }
                    }
                    else
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Alert that is requested is no longer available";
                        showAlert.Visible = false;

                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Alert that is requested is no longer available";
                    showAlert.Visible = false;
                    clsCommon.saveError(ex);
                }
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Alert that is requested is no longer available";
                showAlert.Visible = false;

            }
        }
    }
    protected void sendEMail(object sender, EventArgs e)
    {
        //objCom.sendEMail(
    }
}