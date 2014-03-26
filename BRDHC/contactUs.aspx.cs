using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contactUs : System.Web.UI.Page
{
    contactClass objContact = new contactClass();
    clsCommon objSendMail = new clsCommon();

    private void _subRebind()
   {
        txt_sub.Text = string.Empty;
        txt_fname.Text = string.Empty;
       txt_lname.Text = string.Empty;
        txt_email.Text = string.Empty;
        txt_msg.Text = string.Empty;
       txt_phone.Text = string.Empty;
        txt_sub.Text = string.Empty;
    }
    protected void subMessage(object sender, CommandEventArgs e)
    {
            switch (e.CommandName)
            {
                case "Insert":
                    _strMessage(objContact.insertMessage(Guid.NewGuid(), txt_fname.Text, txt_lname.Text, txt_email.Text, txt_phone.Text, txt_msg.Text, txt_sub.Text, DateTime.Parse(DateTime.Now.ToString())), txt_sub.Text.ToString());
                    objSendMail.sendEMail(txt_email.Text, "<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a><br />" + "<br />Thank you for yor message. Subject: '" 
                        + txt_sub.Text.ToString() + "' <br />We will take it into consideration and reply if neccesary", "(Blind River District Health Centre) Thank you for your message", true);
                    _subRebind();
                    break;
                case "Cancel":
                    _subRebind();
                    break;
        }
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = "Message " + str + " was recieved.";
        else
            lbl_message.Text = "Sorry, unable to " + str + " message";
    }



}