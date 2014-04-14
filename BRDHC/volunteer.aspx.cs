using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class volunteer : System.Web.UI.Page
{
    private static string _OppId = "1";

    //creating a new instance of the volunteerClass
    volunteerClass objVol = new volunteerClass();

    //binding data on page load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadOpps();
        }
    }

    //loading the opportunities into the repeater
    protected void loadOpps()
    {
        IQueryable<brdhc_volunteerOpp> objOpps = objVol.getOpps();

        if (objOpps.Count() > 0)
        {
            rptOpps.DataSource = objOpps;
            rptOpps.DataBind();
        }
        //ViewData(new Guid(ckl_opps.Items[0].Value));

    }


    // Get details of the selected opportunity and load it into listview
    private void ViewData(Guid _OppId)
    {
        ltv_opps.DataSource = objVol.getOppById(_OppId);
        ltv_opps.DataBind();
    }

    
    protected void rptOpps_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "getOpps":
                ViewData(new Guid(e.CommandArgument.ToString()));
                break;
        }
    }

    protected void btnSubmitVolApp_Command(object sender, CommandEventArgs e)
    {

    }
}