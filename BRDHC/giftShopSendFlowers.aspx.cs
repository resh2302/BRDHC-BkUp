using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class giftShopSendFlowers : System.Web.UI.Page
{

    giftShopStoreClass objBou = new giftShopStoreClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subBind();
        }

        //String Name = FindControl("lbl_name");
    }

    protected void _subBind()
    {
        rpt_shop.DataSource = objBou.getBouquets();
        rpt_shop.DataBind();
    }

    protected void rpt_shop_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "btn_10_Command":
                //Response.Redirect("https:www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=markiGiftshop@blah.com&currency_code=CAD&item_name=BRDHC_" + Name + "&amount=" + Price);
                break;
        }      
    }

}   