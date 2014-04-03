using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PayBills : System.Web.UI.Page
{
    clsInvoiceItems objItems = new clsInvoiceItems();
    clsInvoice objInvoice = new clsInvoice();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "PATIENT DASHBOARD : PAY BILLS";
            _subRebind();
        }

        
    }

    private void _subRebind()
    {
        gvInvoice.DataSource = objInvoice.getInvoices();
        gvInvoice.DataBind();
          
    }

    protected void subAdmin(object sender, CommandEventArgs e) {
       
    }


    protected void btnSelect_Command(object sender, CommandEventArgs e)
    {

        IQueryable<brdhc_Invoice> invoice = objInvoice.getInvoicesById(Guid.Parse(e.CommandArgument.ToString()));

        List<brdhc_Invoice> inv = invoice.ToList<brdhc_Invoice>();

        
        var arr = invoice.ToArray();
        string amt = arr[0].TotalAmt.ToString();
        string invID = arr[0].InvoiceID.ToString();

        Response.Redirect("https://sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=reshSell@gmail.com&item_name=BRDHC Charges&amount=" + amt + "&item_number=" + invID);
    }
}