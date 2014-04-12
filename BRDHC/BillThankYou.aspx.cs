using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BillThankYou : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        clsInvoice objInv = new clsInvoice();
        clsCommon objCom = new clsCommon();

        Guid invID = Guid.Parse(Request.QueryString["item_number"]);
        string txID = Request.QueryString["tx"];
        string txStatus = Request.QueryString["st"];
        
        string str = "tx : "+ Request.QueryString["tx"]+" amt : "+Request.QueryString["amt"]+ " st :"+Request.QueryString["st"]+" item_number :"+ Request.QueryString["item_number"];
        

        if (txStatus == "Completed")
        {
            lblData.Text = " Your transaction was completed successfully! ";
            lblData.Text += "<br/> Please make a note of the following details : ";
            lblData.Text += "<br/> <b> Transaction ID : </b>" + txID;
            lblData.Text += "<br/> <b> Paid on date : </b>" + DateTime.Now;
            lblData.Text += "<br/> <br/> <br/>";
            lblData.Text += str;

            // update db
            objInv.updateTransaction(invID, txID, DateTime.Now);

        }
        else {
            lblData.Text = " Your transaction was not completed!";
            lblData.Text += "<br/> <br/>";
            lblData.Text += "Please contact PayPal or your credit card provider and try again later.";
        }
    }
}