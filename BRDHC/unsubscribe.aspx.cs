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
            if (Request.QueryString["uid"] != null && Request.QueryString["uid"] != string.Empty)
            {
                Guid uid = new Guid(Request.QueryString["uid"].ToString());
                try
                {
                    clsHealthAlerts.unsubscribe(uid);
                }
                catch (Exception ex)
                {
                    lblMsg.Text = ex.Message.ToString();
                }
            }
        }
    }
}