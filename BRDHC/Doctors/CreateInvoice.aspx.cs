using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Doctors_CreateInvoice : System.Web.UI.Page
{
    clsInvoice objInvoice = new clsInvoice();
    clsInvoiceItems objItems = new clsInvoiceItems();
    clsUserDetails objUser = new clsUserDetails();

    Guid insertedInvoiceID;
    double total;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "DOCTOR ADMIN DASHBOARD : CREATE INVOICE";
            _subRebind();

            pnlItems.Visible = false;
            pnlAmount.Visible = false;
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
        System.Collections.ArrayList insertResult = objInvoice.insertInvoice( Guid.Parse(txtPatientID.Text), DateTime.Parse(txtInvDate.Text),  txtCreatedBy.Text, "reason" , "Pending", DateTime.Parse(txtDueDate.Text));
        
        insertedInvoiceID = Guid.Parse(insertResult[0].ToString());

        _strMessage(Boolean.Parse(insertResult[1].ToString()), "insert invoice info");
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lblStatus.Visible = true;
            lblStatus.Text = str + " was successful.";
            //upStatus.Update();
            if (str.Equals("insert invoice info"))
            {
                lblStatus.Text += " Please make sure you enter the amount so that the invoice is visible to the patients.";
                pnlAmount.Visible = true;
            }            
        }
        else
        {
            lblStatus.Visible = true;
            lblStatus.Text = "Sorry, unable to " + str + " time";
            //upStatus.Update();
        }
    }
    protected void btnAddITem_Click(object sender, EventArgs e)
    {
        _strMessage( objItems.insertItem(insertedInvoiceID, txtItem.Text, Convert.ToDouble(txtCost.Text)), "insert");

        total = objItems.getTotal(insertedInvoiceID);
        txtTotal.Text = total.ToString();

        gvItems.DataSource = objItems.getItemsByInvoiceID(insertedInvoiceID);
        gvItems.DataBind();
    }
    protected void rblItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblItems.SelectedValue == "Yes")
        {
            pnlItems.Visible = true;
            pnlTotal.Enabled = false;
        }
        else 
        {
            pnlItems.Visible = false;
            pnlTotal.Enabled = true;
        }
    }
    protected void btnInsertAmount_Click(object sender, EventArgs e)
    {
        _strMessage(objInvoice.insertAmount(insertedInvoiceID, total), "insert amount");
        _subRebind();
    }
}