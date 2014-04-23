using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class unsubscribe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Guid uid = new Guid(Request.QueryString["uid"].ToString());
            try
            {
                clsHealthAlerts.unsubscribe(uid);
                lblMsg.Text = "Your email has been removed from the list.";
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
            }
        }
    }
}