using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Donation_donateNow : System.Web.UI.Page
{
    protected void donateNow(object sender, EventArgs e)
    {
        Response.Redirect("https://sandbox.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KVPHR5SNA73MA");
    }

    protected void donateNowRecur(object sender, EventArgs e)
    {
        string times = drp.SelectedItem.Text;
        string period = drpy.SelectedItem.Text;
        string amount = txtamount.Text.ToString();
        Response.Redirect("https://sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick-subscriptions&business=kpatel@gmail.com&lc=CA&item_name=Donate to BRDHC trust&item_number=1234&no_note=1&no_shipping=2&src=1&p3=1&currency_code=CAD&bn=PP-SubscriptionsBF:btn_subscribeCC_LG.gif:NonHosted&t3=" + period + "&srt=" + times + "&a3=" + amount + "");
    }
}