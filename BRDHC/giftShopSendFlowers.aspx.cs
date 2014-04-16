using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class giftShopSendFlowers : System.Web.UI.Page
{
    string Name;
    double Price;
    
    //creating a new instance of the giftShopStoreClass
    giftShopStoreClass objBou = new giftShopStoreClass();
    
    //linding data on page load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subBind();
        }

    }

    //binding data in the repeater
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
                HiddenField HdfId = (HiddenField)e.Item.FindControl("hdf_id");
                Name = HdfId.Value;
                Label lblPrice = (Label)e.Item.FindControl("lblMsBqt1");
                Price = Double.Parse(lblPrice.Text);
                Response.Redirect("https:www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=markiGiftshop@blah.com&currency_code=CAD&item_name=BRDHC_" + Name + "&amount=" + Price);
                break;
        }      
    }

}   