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

    //creating a new instance of the volAppClass
    volAppClass objApp = new volAppClass();

    //binding data on page load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadOpps();
            _subRebind();
        }
    }

    private void _subRebind()
    {
        msfName.Text = string.Empty;
        mslname.Text = string.Empty;
        msPhone.Text = string.Empty;
        msEmail.Text = string.Empty;
        msAddress.Text = string.Empty;
        msOcc.Text = string.Empty;
        msStudent.Text = string.Empty;
        msPreEx.Text = string.Empty;
        msWhy.Text = string.Empty;
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

    //making a panelControl to toggle the visibility of panels
    private void _panelControl(Panel pnl)
    {
        pnlMsMsg.Visible = false;
        pnlMsSent.Visible = false;
        pnl.Visible = true;
    }

    protected void btnSubmitVolApp_Click(object sender, EventArgs e)
    {
        _strOutput(objApp.commitInsert(msfName.Text, mslname.Text, msPhone.Text, msEmail.Text, msAddress.Text, msOcc.Text, msStudent.Text, msPreEx.Text, msWhy.Text), "submit");
        _subRebind();
        _panelControl(pnlMsSent);
    }

    private void _strOutput(bool flag, string str)
    {
        if (flag)
        {
            mSlblTks.Text = "Your application has been successfully " + str + "ed.";
        }
        else
        {
            mSlblTks.Text = "Unfortunately your application was not able to be " + str + ". <br /><br /> Please call 111-222-3333 to speak with our volunteer coordinator.";
        }

    }

}