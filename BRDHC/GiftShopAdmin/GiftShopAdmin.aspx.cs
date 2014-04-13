using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GiftShopAdmin_GiftShopAdmin : System.Web.UI.Page
{
    clsGiftShopCard objCard = new clsGiftShopCard();

    protected void Page_Load(object sender, EventArgs e)
    {
        grd_cards.DataSource = objCard.getCards();
        grd_cards.DataBind();

        dv_cards.DataSource = objCard.getCards();
        dv_cards.DataBind();
    }

    protected void lkb_select_Command(object sender, CommandEventArgs e)
    {
        Guid _card = Guid.Parse(e.CommandArgument.ToString());
        dv_cards.DataSource = objCard.getCardById(_card);
        dv_cards.DataBind();
    }


    protected void btn_delete_Command(object sender, CommandEventArgs e)
    {
        Guid _CardID = Guid.Parse(e.CommandArgument.ToString());
        _strMes(objCard.commitDelete(_CardID), "delete");
        grd_cards.DataSource = objCard.getCards();
        grd_cards.DataBind();
    }

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