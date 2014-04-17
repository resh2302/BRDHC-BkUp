// AUTHOR : JAGSIR SINGH
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
            // display the page header with role nae and page name
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "ADMIN DASHBOARD : ERROR LOGS"; 
            loadRecords();
        }
    }

    private void loadRecords()
    {
        // call to fuction in common class. 
        // this function get all the records from database and bind them to gridview.
        clsCommon objCom = new clsCommon();
        grdRecords.DataSource = objCom.getErrorLogs();
        grdRecords.DataBind();
    }
    protected void grdRecords_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // change the page index on number click
        grdRecords.PageIndex = e.NewPageIndex; 
        loadRecords();
    }
}