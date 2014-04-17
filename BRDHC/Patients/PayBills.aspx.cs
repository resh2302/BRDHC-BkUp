using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class PayBills : System.Web.UI.Page
{
    clsInvoiceItems objItems = new clsInvoiceItems();
    clsInvoice objInvoice = new clsInvoice();

    Guid pID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("../login.aspx");
            }
            else
            {
                Label lblDashboard = Master.dashboardHeading;
                lblDashboard.Text = "PATIENT DASHBOARD : PAY BILLS";
                _subRebind();
            }
        }
    }

    // method used to bind the gridviews according to patient id and status
    private void _subRebind()
    {
        pID = Guid.Parse( Membership.GetUser().ProviderUserKey.ToString());

        gvPendingInvoice.DataSource = objInvoice.getInvoicesByPatientIDandStatus(pID, "Pending");
        gvPendingInvoice.DataBind();

        gvPaidInvoice.DataSource = objInvoice.getInvoicesByPatientIDandStatus(pID, "Paid");
        gvPaidInvoice.DataBind();
    }

    // clicking on the pay button redirects user to paypal
    protected void btnPay_Command(object sender, CommandEventArgs e)
    {

        IQueryable<brdhc_Invoice> invoice = objInvoice.getInvoicesById(Guid.Parse(e.CommandArgument.ToString()));

        List<brdhc_Invoice> inv = invoice.ToList<brdhc_Invoice>();

        var arr = invoice.ToArray();
        string amt = arr[0].TotalAmt.ToString();
        string invID = arr[0].InvoiceID.ToString();
        // invoice info are sent to paypal in this link
        Response.Redirect("https://sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=reshSell@gmail.com&item_name=BRDHC Charges&amount=" + amt + "&item_number=" + invID+"&currency=CAD");
    }

    protected void gvPendingInvoice_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // activating gvPendingInvoice paging
        gvPendingInvoice.PageIndex = e.NewPageIndex;

        _subRebind();
    }

    

    protected void gvPaidInvoice_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // activating gvPaidInvoice paging
        gvPaidInvoice.PageIndex = e.NewPageIndex;

        _subRebind();

    }


    // method to get invoiceID from gvPendingInvoice and show popup with appropriate invoice items
    protected void lnkItems_Click(object sender, EventArgs e)
    {
        LinkButton lnkItems = sender as LinkButton;
        GridViewRow row = (GridViewRow)lnkItems.NamingContainer;

        string strSelectedInvID = gvPendingInvoice.DataKeys[row.RowIndex].Value.ToString();
        lblID.Text = strSelectedInvID;
        // get ID
        Guid selectedInvID = Guid.Parse(lblID.Text);
        // bind grid view
        gvSubItems.DataSource = objItems.getItemsByInvoiceID(selectedInvID);
        gvSubItems.DataBind();
        
        //show popup
        mpeItems.Show();

    }

    // method to get invoiceID from gvPaidInvoice and show popup with appropriate invoice items
    protected void lnkItems_Click1(object sender, EventArgs e)
    {
        LinkButton lnkItems = sender as LinkButton;
        GridViewRow row = (GridViewRow)lnkItems.NamingContainer;

        string strSelectedInvID = gvPaidInvoice.DataKeys[row.RowIndex].Value.ToString();
        lblID.Text = strSelectedInvID;
        // get ID
        Guid selectedInvID = Guid.Parse(lblID.Text);
        // bind grid view
        gvSubItems.DataSource = objItems.getItemsByInvoiceID(selectedInvID);
        gvSubItems.DataBind();
        //show popup
        mpeItems.Show();
    }
    
}