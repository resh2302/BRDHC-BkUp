using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class brdhc : System.Web.UI.MasterPage
{
    public Label dashboardHeading
    {
        get { return lblDashboard; }
        set { lblDashboard = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Context.Session == null)
        {
            Response.Redirect("../Login.aspx");
        }
    }
}
