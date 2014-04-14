using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class giftShopStoreClass
{
    public IQueryable<brdhc_GiftShopStore> getBouquets()
    {
        //creating an instance of our LINQ object
        giftShopStoreClassDataContext objBou = new giftShopStoreClassDataContext();
        //creating an anonymous variable with its value being the instance of teh LINQ object
        var allBouquets = objBou.brdhc_GiftShopStores.Select(x => x);
        //var allQues = from x in objProd.products select x;
        return allBouquets;
    }

    public IQueryable<brdhc_GiftShopStore> getQuesById(Guid _BouquetID)
    {
        giftShopStoreClassDataContext objBou = new giftShopStoreClassDataContext();
        var allQues = objBou.brdhc_GiftShopStores.Where(x => x.BouquetID == _BouquetID).Select(x => x);
        //x into x, select all columns from the table
        //x.Id to access a specific column in the table
        return allQues;
    }

    //THIS IS AN INSERT
    public bool commitInsert(string _Name, string _Picture, string _Price)
    {
        giftShopStoreClassDataContext objBou = new giftShopStoreClassDataContext();
        using (objBou)
        {
            brdhc_GiftShopStore objNewBou = new brdhc_GiftShopStore();
            objNewBou.Name = _Name;
            objNewBou.Picture = _Picture;
            objNewBou.Price = _Price;

            objBou.brdhc_GiftShopStores.InsertOnSubmit(objNewBou);
            objBou.SubmitChanges(); //this will commit the changes
            return true; //boolean
        }
    }

    //THIS IS AN UPDATE
    public bool commitUpdate(Guid _BouquetID, string _Name, string _Picture, string _Price)
    {
        giftShopStoreClassDataContext objBou = new giftShopStoreClassDataContext();
        using (objBou)
        {
            //updating a single row at a time which row depends on the _id
            var objUpBou = objBou.brdhc_GiftShopStores.Single(x => x.BouquetID == _BouquetID);
            objUpBou.Name = _Name;
            objUpBou.Picture = _Picture;
            objUpBou.Price = _Price;
            objBou.SubmitChanges(); //this will commit the changes
            return true; //boolean
        }
    }

    //THIS IS A DELETE
    public bool commitDelete(Guid _BouquetID)
    {
        giftShopStoreClassDataContext objBou = new giftShopStoreClassDataContext();
        using (objBou)
        {
            var objDelBou = objBou.brdhc_GiftShopStores.Single(x => x.BouquetID == _BouquetID);
            objBou.brdhc_GiftShopStores.DeleteOnSubmit(objDelBou); //if you want to delete all best to drop the table
            objBou.SubmitChanges(); //this will commit the changes
            return true; //boolean
        }
    }

}