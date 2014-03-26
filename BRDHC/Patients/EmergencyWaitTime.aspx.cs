using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmergencyWaitTime : System.Web.UI.Page
{
    clsEmergency objEmergency = new clsEmergency();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        rptCurrent.DataSource = objEmergency.getCurrentWaitTime();
        rptCurrent.DataBind();

    }
}