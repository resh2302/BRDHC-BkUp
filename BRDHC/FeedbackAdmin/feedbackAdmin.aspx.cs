using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FeedbackAdmin_feedbackAdmin : System.Web.UI.Page
{
    clsCommon objSendMail = new clsCommon();
    feedback obj = new feedback();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }


    protected void subDel(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {

            case "Deletea":
                subDelete(e);
                break;

            case "Cancela":
                _subRebind();
                break;
        }
    }


    private void _subRebind()
    {
        dl_main.DataSource = obj.getFeedbacks();
        dl_main.DataBind();
    }

    protected void subDelete(ListViewCommandEventArgs e)
    {
        lbl_message.Visible = true;
        int id = Convert.ToInt32(e.CommandArgument.ToString());
        bool result;
        result = obj.commitDelete(id);
        if (result)
        {
            _subRebind();
            lbl_message.Text = "Record deleted!";
        }
        else
        {
            lbl_message.Text = "Error!";
        }
    }
}