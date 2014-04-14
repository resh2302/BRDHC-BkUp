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
    // method to get all invoice items 
    public IQueryable<brdhc_InvoiceItem> getItems()
    {
        InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();
        var allItems = from x in objItemDC.brdhc_InvoiceItems orderby x.ItemId select x;
        return allItems;
    }

    // method to get all invoice items by invoice id
    public List<brdhc_InvoiceItem> getItemsByInvoiceID(Guid invoiceID)
    {
        InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();
        var allItems = from x in objItemDC.brdhc_InvoiceItems where x.InvoiceID == invoiceID orderby x.ItemId select x;
        return allItems.ToList();
    }

    // to insert invoice items for the appropriate invoice ID 
    public void insertItem(Guid _invoiceID, string _item, double _itemCost)
    {
        InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();
        try
        {
            brdhc_InvoiceItem objInvItem = new brdhc_InvoiceItem();

            objInvItem.InvoiceID = _invoiceID;
            objInvItem.ItemName = _item;
            objInvItem.ItemCost = _itemCost;

            objItemDC.brdhc_InvoiceItems.InsertOnSubmit(objInvItem);
            objItemDC.SubmitChanges();

        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
        }
    }

    // to get total cost of all invoice items
    public double getTotal(Guid InvoiceID)
    {
        List<brdhc_InvoiceItem> items = getItemsByInvoiceID(InvoiceID);
        double total = 0.0;

        foreach( brdhc_InvoiceItem x in items)
        {
            total = total + x.ItemCost;
        }
        return total;
    }


    // method to update invoice items 
    public void updateItem(Guid _invoiceID, string _item, double _cost, Guid _itemID)
    {
        try
        {
            // respective datacontext object
            InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();
            // get row to update
            var upItem = objItemDC.brdhc_InvoiceItems.Single(i => i.ItemId == _itemID);
            //updating values
            upItem.ItemName = _item;
            upItem.ItemCost = _cost;

            //updating table
            objItemDC.SubmitChanges();

            //updating total
            InvoicesDataContext objInvDC = new InvoicesDataContext();
            //get invoice row
            var inv = objInvDC.brdhc_Invoices.Single(i => i.InvoiceID == _invoiceID);
            //calculating total
            double total = getTotal(_invoiceID);

            //update total
            inv.TotalAmt = total;

            objInvDC.SubmitChanges();

        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
        }
    }

    //method to delete invoice item

    public void deleteItem(Guid _itemID, Guid _invoiceID)
    {
        try
        {
            // respective datacontext object
            InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();

            //get row to delete
            var delItem = from i in objItemDC.brdhc_InvoiceItems where (i.ItemId == _itemID) select i;

            // delete from table
            objItemDC.brdhc_InvoiceItems.DeleteAllOnSubmit(delItem);
            //commit delete
            objItemDC.SubmitChanges();

            //updating total
            InvoicesDataContext objInvDC = new InvoicesDataContext();
            //get invoice row
            var inv = objInvDC.brdhc_Invoices.Single(i => i.InvoiceID == _invoiceID);
            //calculating total
            double total = getTotal(_invoiceID);

            //update total
            inv.TotalAmt = total;

            objInvDC.SubmitChanges();
        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
            
        }
    }
}