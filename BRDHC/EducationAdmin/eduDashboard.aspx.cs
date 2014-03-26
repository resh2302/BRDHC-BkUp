using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EducationAdmin_eduDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label lblDashboard = Master.dashboardHeading;
        lblDashboard.Text = "EDUCATION DASHBOARD : PROFILE";
    }
}