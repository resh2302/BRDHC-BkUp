using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class giftShopSendACard : System.Web.UI.Page
{
    clsGiftShopCard ObjCard = new clsGiftShopCard();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }
    
    //protected void btnSendFlowers_Click(object sender, EventArgs e)
    //{
    //    _strOutput(ObjCard.commitInsert(msSACYourName.Text, msSACYourEmail.Text, msSACPname.Text, msSACPrn.Text, msSACTo.Text, msSACFrom.Text, msSACYourMessage.Text
             
    //}

    protected void btnSendFlowers_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Insert")
        {
        _strOutput(ObjCard.commitInsert(msSACYourName.Text, msSACYourEmail.Text, msSACPname.Text, msSACPrn.Text, msSACTo.Text, msSACFrom.Text, msSACYourMessage.Text));
            _subRebind();
        }

    }


    private void _panelControl(Panel pnl)
    {
        pnlMsMsg.Visible = false;
        pnlMsSent.Visible = true;
    }

    private void _subRebind()
    {
        msSACYourName.Text = string.Empty;
        msSACYourEmail.Text = string.Empty;
        msSACPname.Text = string.Empty;
        msSACPrn.Text = string.Empty;
        msSACTo.Text = string.Empty;
        msSACFrom.Text = string.Empty;
        msSACYourMessage.Text = string.Empty;
    }

    private void _strOutput(bool flag, string str)
    {
        if (flag)
            lbl_output.Text = "Happy" + str;
        else
            lbl_output.Text = "Sad" + str;
    
    }

}