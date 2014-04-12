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
    }

    protected void subAdmin(object sender, CommandEventArgs e) {
       
    }


    protected void btnPay_Command(object sender, CommandEventArgs e)
    {

        IQueryable<brdhc_Invoice> invoice = objInvoice.getInvoicesById(Guid.Parse(e.CommandArgument.ToString()));

        List<brdhc_Invoice> inv = invoice.ToList<brdhc_Invoice>();

        
        var arr = invoice.ToArray();
        string amt = arr[0].TotalAmt.ToString();
        string invID = arr[0].InvoiceID.ToString();

        Response.Redirect("https://sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=reshSell@gmail.com&item_name=BRDHC Charges&amount=" + amt + "&item_number=" + invID);
    }

    protected void gvPendingInvoice_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPendingInvoice.PageIndex = e.NewPageIndex;

        _subRebind();
    }

    protected void gvPendingInvoice_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblIStatus = (Label)e.Row.FindControl("lblIStatus");
            Button btnPay = (Button)e.Row.FindControl("btnPay");

            if (lblIStatus.Text == "Pending")
            {
                btnPay.Enabled = true;
            }
            else 
            {
                btnPay.Enabled = false;
            }
        }
    }
    protected void gvPendingInvoice_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        IQueryable<brdhc_Invoice> invoice = objInvoice.getInvoicesById(Guid.Parse(e.CommandArgument.ToString()));

        List<brdhc_Invoice> inv = invoice.ToList<brdhc_Invoice>();


        var arr = invoice.ToArray();
        string amt = arr[0].TotalAmt.ToString();
        string invID = arr[0].InvoiceID.ToString();

        Response.Redirect("https://sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=reshSell@gmail.com&item_name=BRDHC Charges&amount=" + amt + "&item_number=" + invID);
    }
}