using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class volunteer : System.Web.UI.Page
{
    private static string _oppId = "1";

    volunteerClass objVol = new volunteerClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadOpps();
        }
    }

    // Get all the opportunites from the db and load them into the checkbox list
    protected void loadOpps()
    {
        IQueryable<brdhc_volunteerOpp> objOpps = objVol.getOpps();
        ckl_opps.DataSource = objOpps;
        ckl_opps.DataTextField = "OppTitle";
        ckl_opps.DataValueField = "OppId";
        ckl_opps.DataBind();
        //ckl_opps.Attributes.Add("CssClass", "cblOpps");
        if (objOpps.Count() > 0)
        { 

        }
        ViewData(new Guid(ckl_opps.Items[0].Value));

        //lblOpp.Text = ckl_opps.Items[0].Text.ToString();
    }


    // Get details of the selected opportunity and load it into listview
    private void ViewData(Guid _oppId)
    {
        ltv_opps.DataSource = objVol.getOppById(_oppId);
        ltv_opps.DataBind();
    }

    // Rebind the list view with the  new opportunities when the opportunity changes
    protected void changeTopic(object sender, EventArgs e)
    {
        foreach (ListItem lt in ckl_opps.Items)
        {
            if (lt.Selected)
            {
                lblOpp.Text = ckl_opps.Text.ToString();
                _oppId = ckl_opps.SelectedItem.ToString();
                ViewData(new Guid(_oppId));
            }
        }
        
    }
}