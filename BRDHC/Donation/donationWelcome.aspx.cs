using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Donation_donationWelcome : System.Web.UI.Page
{
    
        protected void subClick(object sender, EventArgs e)
    {
        Response.Redirect("~/Donation/donateNow.aspx");   //on button click redirects to given url
    }
    
}