using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class giftShopSendFlowers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_10_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=markiGiftshop@blah.com&currency_code=CAD&item_name=BRDHC_Bouquet_10.00&amount=10.00");
    }
    protected void btn_20_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=markiGiftshop@blah.com&currency_code=CAD&item_name=BRDHC_Bouquet_20.00&amount=20.00");
    }
    protected void btn_30_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=markiGiftshop@blah.com&currency_code=CAD&item_name=BRDHC_Bouquet_30.00&amount=30.00");
    }
    protected void btn_40_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=markiGiftshop@blah.com&currency_code=CAD&item_name=BRDHC_Bouquet_40.00&amount=40.00");
    }
    protected void btn_50_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=markiGiftshop@blah.com&currency_code=CAD&item_name=BRDHC_Bouquet_50.00&amount=50.00");
    }
}   