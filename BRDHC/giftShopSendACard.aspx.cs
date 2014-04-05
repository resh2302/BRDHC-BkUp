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

    protected void btnSendFlowers_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Insert")
        {
        _strOutput(ObjCard.commitInsert(msSACYourName.Text, msSACYourEmail.Text, msSACPname.Text, msSACPrn.Text, msSACTo.Text, msSACFrom.Text, msSACYourMessage.Text), "sent");
            _subRebind();
            _panelControl(pnlMsSent);
        }

    }

    private void _panelControl(Panel pnl)
    {
        pnlMsMsg.Visible = false;
        pnlMsSent.Visible = false;
        pnl.Visible = true;
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
            mSlblTks.Text = "Your message has been " + str + ". <br /><br /> You will be notified via email once your card has been delivered.";
        else
            mSlblTks.Text = "Unfortunately your message was no able to be " + str + ". <br /><br /> Please call 111-222-3333 to have your message taken over the phone.";
    
    }

}