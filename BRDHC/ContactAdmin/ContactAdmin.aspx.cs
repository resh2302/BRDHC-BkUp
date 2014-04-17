using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactAdmin : System.Web.UI.Page
{
    contactClass objMessage = new contactClass();
    clsCommon objSendMail = new clsCommon();

    protected void Page_Load(object sender, EventArgs e)
    {          
        Label lblDashboard = Master.dashboardHeading;
        lblDashboard.Text = "CONTACT ADMIN DASHBOARD :";
        lbl_message.Visible = false;
        if (!Page.IsPostBack)
        {
            subLoadAll();

        }
    }
    private void subLoadAll()
    {
        IQueryable<brdhc_ContactUs> objData = objMessage.getMessages();
        lst_inbox.Items.Clear();
        lst_inbox.DataSource = objData;
        lst_inbox.EditIndex = -1;
        lst_inbox.DataBind();

    }


    protected void checkMessage(ListViewCommandEventArgs e)
    {
            objMessage.checkMessage(Guid.Parse(e.CommandArgument.ToString()), true);
    }


    protected void viewMessage(Guid id)
    {
        _panelControl(pnl_view);
        dtl_view.DataSource = objMessage.getMessageByID(id);
        dtl_view.DataBind();
        //lst_inbox.Items.Clear();
        //lst_inbox.DataSource = objMessage.getMessageByID(id);
        //lst_inbox.DataBind();

    }
        protected void subCommands(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "View Message":
                viewMessage(Guid.Parse(e.CommandArgument.ToString()));
                checkMessage(e);
                break;
            case "Deleted":
                _strMessage();
                deleteMessage(e);
                subLoadAll();
                break;
                case "Reply":
                viewMessage(Guid.Parse(e.CommandArgument.ToString()));
                sendReply(e);
                displayReply(e);
                subLoadAll();
                    break;
        }
    }
        protected void deleteMessage(ListViewCommandEventArgs e)
        {
          Guid id = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
          objMessage.deleteMessage(id);
        }
        protected void sendReply(ListViewCommandEventArgs e)
        {
            Label email = (Label)e.Item.FindControl("lbl_emailV");
            TextBox message = (TextBox)e.Item.FindControl("txt_msgR");
            TextBox subject = (TextBox)e.Item.FindControl("txt_subR");
            objSendMail.sendEMail(email.Text, "<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a><br /><br/>" +  message.Text, "(Blind River District Health Centre) " + subject.Text, true);
        }
        protected void displayReply(ListViewCommandEventArgs e)
        {
            TextBox message = (TextBox)e.Item.FindControl("txt_msgR");
            objMessage.replyMessage(Guid.Parse(e.CommandArgument.ToString()), message.Text, DateTime.Parse(DateTime.Now.ToString()));
        }

        private void _panelControl(Panel pnl)
        {
            pnlTable.Visible = false;
            pnl_view.Visible = false;
            pnl.Visible = true;
        }
        private void _strMessage()
        {
            lbl_message.Visible = true;
            lbl_message.Text = "Message was successfully deleted";

        }
}