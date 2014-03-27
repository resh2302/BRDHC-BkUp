using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class clsGiftShopCard
{
    public IQueryable<brdhc_GiftShopSendCard> getCards()
    {
        //creating an instance of our LINQ object
        GiftShopCardDataContext objCard = new GiftShopCardDataContext();
        //creating an anonymous variable with its value being the instance of teh LINQ object
        var allCards = objCard.brdhc_GiftShopSendCards.Select(x => x);
        //var allQues = from x in objProd.products select x;
        return allCards;
    }

    public IQueryable<brdhc_GiftShopSendCard> getCardById(Guid _CardID)
    {
        GiftShopCardDataContext objCard = new GiftShopCardDataContext();
        var allCard = objCard.brdhc_GiftShopSendCards.Where(x => x.CardID == _CardID).Select(x => x);
        //x into x, select all columns from the table
        //x.Id to access a specific column in the table
        return allCard;
    }

    public bool commitInsert(string _sName, string _sEmail, string _pName, string _pRoomNum, string _to, string _from, string _message)
    {
        GiftShopCardDataContext objCard = new GiftShopCardDataContext();
        //to ensure all data will be disposed when finished
        using (objCard)
        { 
            //create an instance of the table
            brdhc_GiftShopSendCard objNewCard = new brdhc_GiftShopSendCard();
            //set the table columns being passed from giftShopSendACard.aspx page
            objNewCard.senderName = _sName;
            objNewCard.senderEmail = _sEmail;
            objNewCard.patientName = _pName;
            objNewCard.patientRoom = _pRoomNum;
            objNewCard.To = _to;
            objNewCard.From = _from;
            objNewCard.Message = _message;
            //insert command
            objCard.brdhc_GiftShopSendCards.InsertOnSubmit(objNewCard);
            //commit insert against db
            objCard.SubmitChanges();
            return true;
        }
    
    }
}


