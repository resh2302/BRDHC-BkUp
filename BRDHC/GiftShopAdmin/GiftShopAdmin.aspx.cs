using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GiftShopAdmin_GiftShopAdmin : System.Web.UI.Page
{
    //creating a new instance of clsGiftShopCard
    clsGiftShopCard objCard = new clsGiftShopCard();

    private void _subRebind()
    {
        //binding data to the gridview
        grd_cards.DataSource = objCard.getCards();
        grd_cards.DataBind();

        //binding datat to the detailsview
        dv_cards.DataSource = objCard.getCards();
        dv_cards.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
            //overriding the master dashobard heading
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "GIFT SHOP ADMIN : SEND A CARD";
            //binding data on pageload
            _subRebind();
    }

    protected void lkb_select_Command(object sender, CommandEventArgs e)
    {
        //clicking on view to see the details of that entry
        Guid _card = Guid.Parse(e.CommandArgument.ToString());
        dv_cards.DataSource = objCard.getCardById(_card);
        dv_cards.DataBind();
    }


    protected void btn_delete_Command(object sender, CommandEventArgs e)
    {
        //deleting that entry
        Guid _CardID = Guid.Parse(e.CommandArgument.ToString());
        _strMes(objCard.commitDelete(_CardID), "delete");
        grd_cards.DataSource = objCard.getCards();
        grd_cards.DataBind();
    }

    //success or failure message
    private void _strMes(bool flag, string str)
    {
        if (flag)
        {
            lbl_mes.Text = "Card " + str + " was successful";
        }
        else
        {
            lbl_mes.Text = "Sorry, unable to " + str + " card";
        }
    }
}