using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PayBills : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "PATIENT DASHBOARD : PAY BILLS";
            _subRebind();
        }

        
    }

    private void _subRebind()
    {
          
    }

    protected void subAdmin(object sender, CommandEventArgs e) {
       
    }

    
}