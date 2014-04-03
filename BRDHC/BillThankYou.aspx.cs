using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BillThankYou : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string str = "tx : "+ Request.QueryString["tx"]+" amt : "+Request.QueryString["amt"]+ " st :"+Request.QueryString["st"]+" item_number :"+ Request.QueryString["item_number"];
        lblData.Text = str;
    }
}