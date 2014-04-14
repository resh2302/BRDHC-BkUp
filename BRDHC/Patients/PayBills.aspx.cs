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

    private void _subRebind()
    {
        pID = Guid.Parse( Membership.GetUser().ProviderUserKey.ToString());

        gvPendingInvoice.DataSource = objInvoice.getInvoicesByPatientIDandStatus(pID, "Pending");
        gvPendingInvoice.DataBind();

        gvPaidInvoice.DataSource = objInvoice.getInvoicesByPatientIDandStatus(pID, "Paid");
        gvPaidInvoice.DataBind();
    }

    protected void btnPay_Command(object sender, CommandEventArgs e)
    {

        IQueryable<brdhc_Invoice> invoice = objInvoice.getInvoicesById(Guid.Parse(e.CommandArgument.ToString()));

        List<brdhc_Invoice> inv = invoice.ToList<brdhc_Invoice>();

        var arr = invoice.ToArray();
        string amt = arr[0].TotalAmt.ToString();
        string invID = arr[0].InvoiceID.ToString();

        Response.Redirect("https://sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=reshSell@gmail.com&item_name=BRDHC Charges&amount=" + amt + "&item_number=" + invID+"&currency=CAD");
    }

    protected void gvPendingInvoice_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPendingInvoice.PageIndex = e.NewPageIndex;

        _subRebind();
    }

    

    protected void gvPaidInvoice_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPaidInvoice.PageIndex = e.NewPageIndex;

        _subRebind();

    }

    protected void lnkItems_Click(object sender, EventArgs e)
    {
        LinkButton lnkItems = sender as LinkButton;
        GridViewRow row = (GridViewRow)lnkItems.NamingContainer;

        string strSelectedInvID = gvPendingInvoice.DataKeys[row.RowIndex].Value.ToString();
        lblID.Text = strSelectedInvID;

        Guid selectedInvID = Guid.Parse(lblID.Text);
        gvSubItems.DataSource = objItems.getItemsByInvoiceID(selectedInvID);
        gvSubItems.DataBind();
        //upMain.Update();
        mpeItems.Show();
    }

    protected void lnkItems_Click1(object sender, EventArgs e)
    {
        LinkButton lnkItems = sender as LinkButton;
        GridViewRow row = (GridViewRow)lnkItems.NamingContainer;

        string strSelectedInvID = gvPaidInvoice.DataKeys[row.RowIndex].Value.ToString();
        lblID.Text = strSelectedInvID;

        Guid selectedInvID = Guid.Parse(lblID.Text);
        gvSubItems.DataSource = objItems.getItemsByInvoiceID(selectedInvID);
        gvSubItems.DataBind();
        //upMain.Update();
        mpeItems.Show();
    }
    
}