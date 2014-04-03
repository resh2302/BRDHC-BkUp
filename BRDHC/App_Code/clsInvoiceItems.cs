////////////////////////////////////////////////////////////////////
// AUTHOR:           RESHMA MATHEW
// DESCRIPTION:      CLASS FOR PATIENT'S INVOICE ITEMS MANAGEMENT
///////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class clsInvoiceItems
{
    public IQueryable<brdhc_InvoiceItem> getItems()
    {
        InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();
        var allItems = from x in objItemDC.brdhc_InvoiceItems orderby x.ItemId select x;
        return allItems;
    }

    public IQueryable<brdhc_InvoiceItem> getItemsByInvoiceID(Guid invoiceID)
    {
        InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();
        var allItems = from x in objItemDC.brdhc_InvoiceItems where x.InvoiceID == invoiceID orderby x.ItemId select x;
        return allItems;
    }

    public bool insertItem(Guid _invoiceID, string _item, double _itemCost)
    {
        InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();
        using (objItemDC)
        {
            brdhc_InvoiceItem objInvItem = new brdhc_InvoiceItem();

            objInvItem.InvoiceID = _invoiceID;
            objInvItem.ItemName = _item;
            objInvItem.ItemCost = _itemCost;

            objItemDC.brdhc_InvoiceItems.InsertOnSubmit(objInvItem);
            objItemDC.SubmitChanges();
            return true;
        }
    }

    public double getTotal(Guid insertedInvoiceID)
    {
        IQueryable<brdhc_InvoiceItem> items =  getItemsByInvoiceID(insertedInvoiceID);
        double total = 0.0;

        foreach( brdhc_InvoiceItem x in items)
        {
            total = total + x.ItemCost;
        }

        return total;
    }
}