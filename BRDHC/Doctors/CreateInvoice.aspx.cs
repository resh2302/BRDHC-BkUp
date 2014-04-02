using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctors_CreateInvoice : System.Web.UI.Page
{
    clsInvoice objInvoice = new clsInvoice();
    clsUserDetails objUser = new clsUserDetails();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "DOCTOR ADMIN DASHBOARD : CREATE INVOICE";
            _subRebind();
        }
    }

    protected void _subRebind() {
       
        ddlInvoice.DataSource = objUser.getAllPatients();
        //ddlInvoice.DataTextFormatString = "{0} {1}";
        ddlInvoice.DataTextField = "FirstName";
        
        ddlInvoice.DataValueField = "UserId";
        ddlInvoice.DataBind();

        gvInvoices.DataSource = objInvoice.getInvoices();
        gvInvoices.DataBind();

        txtInvDate.Text = DateTime.Now.ToShortDateString();

        txtCreatedBy.Text = User.Identity.Name.ToString();
        txtPatientID.Text = string.Empty;
        txtDueDate.Text = string.Empty;
        txtTotal.Text = string.Empty;

        
        

    }

    protected void ddlInvoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtPatientID.ToolTip = txtPatientID.Text = ddlInvoice.SelectedValue.ToString();        
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {        
        _strMessage( objInvoice.insertInvoice( Guid.Parse(txtPatientID.Text), DateTime.Parse(txtInvDate.Text), Convert.ToDouble(txtTotal.Text), txtCreatedBy.Text, "reason" , "Pending", DateTime.Parse(txtDueDate.Text)), "insert");
        _subRebind();
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lblStatus.Visible = true;
            lblStatus.Text = str + " was successful";
            //upStatus.Update();

        }
        else
        {
            lblStatus.Visible = true;
            lblStatus.Text = "Sorry, unable to " + str + " time";
            //upStatus.Update();
        }
    }
}