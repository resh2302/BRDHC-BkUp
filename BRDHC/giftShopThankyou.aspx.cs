using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class giftShopThankyou : System.Web.UI.Page
{
    //creating a new instance of the GiftShopCard class
    clsGiftShopCard ObjCard = new clsGiftShopCard();

    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request.QueryString["tx"];
        var status = Request.QueryString["st"];
        //var price = Request.QueryString["amt"]; I decided not to include the price from the query string

        lbl_thk.Text = "Your purchase is " + status + ".<br /><br />Here is your confirmation id: " + id + ".<br /><br />A receipt has been sent to the email that you provided. <br /><br /> If you would like to include a handwritten card please fill in your details and message below.";
        
        //empty textboxes on page load
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    protected void btnSendFlowers_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Insert")
        {
            Guid CardId = new Guid();
            _strOutput(ObjCard.commitInsert(CardId, msSACYourName.Text, msSACYourEmail.Text, msSACPname.Text, msSACPrn.Text, msSACTo.Text, msSACFrom.Text, msSACYourMessage.Text), "sent");
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
        {
            mSlblTks.Text = "Your message has been " + str + ".";
        }
        else
        {
            mSlblTks.Text = "Unfortunately your message was no able to be " + str + ". <br /><br /> Please call 111-222-3333 to have your message taken over the phone.";
        }

    }

}