using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;


public partial class Doctors_CreateInvoice : System.Web.UI.Page
{
    clsInvoice objInvoice = new clsInvoice();
    clsInvoiceItems objItems = new clsInvoiceItems();
    clsUserDetails objUser = new clsUserDetails();

    string strDocUname = Membership.GetUser().ToString();
    Guid insertedInvoiceID;
    Guid selectedInvID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("../login.aspx");
            }
            else
            {
                Label lblDashboard = Master.dashboardHeading;
                lblDashboard.Text = "DOCTOR ADMIN DASHBOARD : CREATE INVOICE : " + Membership.GetUser().ToString();
                _subRebind();
            }
        }
    }

    protected void _subRebind() {
        
        strDocUname = Membership.GetUser().ToString();

        ddlInvoice.DataSource = objUser.getAllPatientNames();
        ddlInvoice.DataTextField = "patientName";
        
        ddlInvoice.DataValueField = "UserId";
        ddlInvoice.DataBind();

        gvPending.DataSource = objInvoice.getInvoicebyDocStatus(strDocUname, "Pending"); // get status pending
        gvPending.DataBind();

        gvPaid.DataSource = objInvoice.getInvoicebyDocStatus(strDocUname, "Paid"); // get status paid
        gvPaid.DataBind();

        txtInvDate.Text = DateTime.Now.ToString();

        txtCreatedBy.Text = User.Identity.Name.ToString();
        txtPatientID.Text = string.Empty;
        txtDueDate.Text = string.Empty;
        txtTotal.Text = string.Empty;

        setInitialItemRow();

    }

    protected void ddlInvoice_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtPatientID.ToolTip = txtPatientID.Text = ddlInvoice.SelectedValue.ToString();        
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        // insert invoice
         objInvoice.insertInvoice( Guid.Parse(txtPatientID.Text), DateTime.Parse(txtInvDate.Text),  txtCreatedBy.Text, "reason" , "Pending", DateTime.Parse(txtDueDate.Text), Double.Parse(txtTotal.Text.ToString()));
        

        foreach (GridViewRow row in gvItems.Rows)
        {
            TextBox txtDesc = (TextBox)row.FindControl("txtItem");
            TextBox txtCost = (TextBox)row.FindControl("txtCost");

            string desc = txtDesc.Text.ToString();
            string costText = txtCost.Text.ToString();

            if (costText == "")
            {
                costText = "0.0";
            }
            else
            {
                double cost = Double.Parse(costText.ToString());
                objItems.insertItem(insertedInvoiceID, desc, cost);  
            }
            
        }

        _subRebind();
        
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lblStatus.Visible = true;
            lblStatus.Text = str + " was successful.";
                     
        }
        else
        {
            lblStatus.Visible = true;
            lblStatus.Text = "Sorry, unable to " + str + " invoice";
        }
    }


    protected void btnAddITem_Click(object sender, EventArgs e) // only create new textboxes
    {
        AddNewRowToGrid();
    }
    

    private void setInitialItemRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("ItemNumber"));
        dt.Columns.Add(new DataColumn("Column1"));
        dt.Columns.Add(new DataColumn("Column2"));

        dr = dt.NewRow();
        dr["ItemNumber"] = 1;
        dr["Column1"] = string.Empty;
        dr["Column2"] = string.Empty;
        dt.Rows.Add(dr);

        // Storing the datatable in viewstate
        ViewState["CurrentTable"] = dt;

        gvItems.DataSource = dt;
        gvItems.DataBind();
    }

    private void SetPreviousData()
    {
        int rowIndex = 0;
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TextBox txtItem = (TextBox)gvItems.Rows[rowIndex].Cells[1].FindControl("txtItem");
                    TextBox txtCost = (TextBox)gvItems.Rows[rowIndex].Cells[2].FindControl("txtCost");

                    txtItem.Text = dt.Rows[i]["Column1"].ToString();
                    txtCost.Text = dt.Rows[i]["Column2"].ToString();

                    rowIndex++;
                }
            }
        }
    }

    private void AddNewRowToGrid()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the TextBox values
                    TextBox txtItem = (TextBox)gvItems.Rows[rowIndex].Cells[1].FindControl("txtItem");
                    TextBox txtCost = (TextBox)gvItems.Rows[rowIndex].Cells[2].FindControl("txtCost");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["ItemNumber"] = i + 1;

                    dtCurrentTable.Rows[i - 1]["Column1"] = txtItem.Text;
                    dtCurrentTable.Rows[i - 1]["Column2"] = txtCost.Text;

                    rowIndex++;
                }
                dtCurrentTable.Rows.Add(drCurrentRow);
                ViewState["CurrentTable"] = dtCurrentTable;

                gvItems.DataSource = dtCurrentTable;
                gvItems.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }

        //Set Previous Data on Postbacks
        SetPreviousData();
    }

   
    protected void btnTotal_Click(object sender, EventArgs e)
    {
        
        double total = 0.0;
        foreach (GridViewRow row in gvItems.Rows)
        {
            TextBox txtCost = (TextBox)row.FindControl("txtCost");
            string cost = txtCost.Text.ToString();

            if (cost == ""){
                cost = "0.0";
            }
            else {
                total += Double.Parse(cost);                   
            }
        }

        txtTotal.Text = total.ToString();

    }
    
    protected void lnkRemove_Click(object sender, EventArgs e)
    {
        //Get the button that raised the event
        LinkButton btn = (LinkButton)sender;

        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        int rowIndex = gvr.RowIndex;
    }

    protected void gvItems_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Set Previous Data on Postbacks
        //SetPreviousData();
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
           
            dtCurrentTable.Rows.RemoveAt(e.RowIndex);
            ViewState["CurrentTable"] = dtCurrentTable;

            gvItems.DataSource = dtCurrentTable;
            gvItems.DataBind();
            
        }
        //Set Previous Data on Postbacks
        SetPreviousData();
    }

    

   /* private void removeAllItems(GridViewDeleteEventArgs e)
    { 
        foreach (GridViewRow row in gvItems.Rows)
        {
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                if (e.RowIndex == 0)
                {
                    Response.Write("<script>alert('Hello');</script>");
                }
                else
                {
                    dtCurrentTable.Rows.RemoveAt(e.RowIndex);                
                }
                gvItems.DataSource = dtCurrentTable;
                gvItems.DataBind();
            }
        }
    }*/

    protected void gvPaid_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPaid.PageIndex = e.NewPageIndex;
        gvPaid.DataSource = objInvoice.getInvoicebyDocStatus(strDocUname, "Paid"); // get status pending
        gvPaid.DataBind();
    }
    protected void gvPending_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPending.PageIndex = e.NewPageIndex;
        gvPending.DataSource = objInvoice.getInvoicebyDocStatus(strDocUname, "Pending"); // get status pending
        gvPending.DataBind();
    }
    protected void lnkItems_Command(object sender, CommandEventArgs e)
    {
        string strSelectedInvID = e.CommandArgument.ToString();
        lblID.Text = strSelectedInvID;

        selectedInvID = Guid.Parse(lblID.Text);
        gvSubItems.DataSource = objItems.getItemsByInvoiceID(selectedInvID);
        gvSubItems.DataBind();

        
    }


    protected void lnkItems_Click(object sender, EventArgs e)
    {
        LinkButton lnkItems = sender as LinkButton;
        GridViewRow row = (GridViewRow)lnkItems.NamingContainer;

        string strSelectedInvID = gvPending.DataKeys[row.RowIndex].Value.ToString();
        lblID.Text = strSelectedInvID;

        selectedInvID = Guid.Parse(lblID.Text);
        gvSubItems.DataSource = objItems.getItemsByInvoiceID(selectedInvID);
        gvSubItems.DataBind();
        upMain.Update();
        mpeItems.Show();
    }

    
    protected void gvSubItems_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Get rowindex
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        //Get Row
        GridViewRow gvr = gvSubItems.Rows[rowIndex];

        HiddenField hdfInvID = gvSubItems.Rows[rowIndex].FindControl("hdfInvID") as HiddenField;
        HiddenField hdfItemID = gvSubItems.Rows[rowIndex].FindControl("hdfItemID") as HiddenField;

        switch(e.CommandName)
        {
            case "update":
                TextBox txtItem = gvSubItems.Rows[rowIndex].FindControl("txtIName") as TextBox;
                TextBox txtICost = gvSubItems.Rows[rowIndex].FindControl("txtICost") as TextBox;

                objItems.updateItem(Guid.Parse(hdfInvID.Value.ToString()), txtItem.Text.ToString(), Double.Parse(txtICost.Text.ToString()), Guid.Parse(hdfItemID.Value.ToString()));
                break;

            case "delete":
                objItems.deleteItem(Guid.Parse(hdfItemID.Value.ToString()), Guid.Parse(hdfInvID.Value.ToString()));
                break;
        }
        _subRebind();
    }



    protected void gvPending_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Get rowindex
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        //Get GridViewRow
        GridViewRow gvr = gvPending.Rows[rowIndex];

        //get invoice id from label in gridview
        Label lblID = gvPending.Rows[rowIndex].FindControl("lblID") as Label;

        switch (e.CommandName)
        {
            case "update":
                TextBox txtDueDate = gvPending.Rows[rowIndex].FindControl("txtDueDate") as TextBox;
                //call update method
                objInvoice.updateDueDate(Guid.Parse(lblID.Text), DateTime.Parse(txtDueDate.Text));
                break;

            case "delete":
                //call delete method
                objInvoice.deleteInvoice(Guid.Parse(lblID.Text));
                break;
        }
        _subRebind();
    }
    protected void lnkItems_Click1(object sender, EventArgs e)
    {
        LinkButton lnkItems = sender as LinkButton;
        GridViewRow row = (GridViewRow)lnkItems.NamingContainer;

        string strSelectedInvID = gvPaid.DataKeys[row.RowIndex].Value.ToString();
        lblID.Text = strSelectedInvID;

        selectedInvID = Guid.Parse(lblID.Text);
        gvSubItems.DataSource = objItems.getItemsByInvoiceID(selectedInvID);
        gvSubItems.DataBind();
        upMain.Update();
        mpeItems.Show();
    }
}