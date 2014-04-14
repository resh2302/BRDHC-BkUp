using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_errorLogs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "ADMIN DASHBOARD : ERROR LOGS"; 
            loadRecords();
        }
    }

    private void loadRecords()
    {
        clsCommon objCom = new clsCommon();
        grdRecords.DataSource = objCom.getErrorLogs();
        grdRecords.DataBind();
    }
    protected void grdRecords_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdRecords.PageIndex = e.NewPageIndex; 
        loadRecords();
    }
}