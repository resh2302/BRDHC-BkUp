using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    clsEmergency objEmergency = new clsEmergency();

    protected void Page_Load(object sender, EventArgs e)
    {
		if (!Page.IsPostBack)
        {
            _subRebind();
        }        

		clsHealthAlerts objAlerts = new clsHealthAlerts();
        IQueryable<brdhc_HealthAlert> alert = objAlerts.getLatestAlert();
        if (alert.Count() > 0)
        {
            divDesc.Style.Add("display", "block");
            divDesc.InnerHtml = "<article>";
            string desc = alert.First().HealthAlertDescription;
            if (alert.First().HealthAlertDescription.Count() > 300)
            {
                desc = desc.Substring(0, 300);
            }
            divDesc.InnerHtml += desc;
            divDesc.InnerHtml += "</article><a class='rm_green' href='alerts.aspx?aid=" + alert.First().HealthAlertId.ToString() + "'>READ MORE</a>";
            //lbtnMore.PostBackUrl = "~/alerts.aspx?aid=" + alert.HealthAlertId.ToString();
        }
    }

    private void _subRebind()
    {
        rptCurrent.DataSource = objEmergency.getCurrentWaitTime();
        rptCurrent.DataBind();

    }

    protected void subTick(object sender, EventArgs e)
    {
        _subRebind();        
    }
}