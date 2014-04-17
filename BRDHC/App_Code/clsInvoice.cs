////////////////////////////////////////////////////////////////////
// AUTHOR:           RESHMA MATHEW
// DESCRIPTION:      CLASS FOR PATIENT'S INVOICE MANAGEMENT
///////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class clsInvoice
{
   //method to get all invoices
    public IQueryable<brdhc_Invoice> getInvoices()
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        var allInvoices = from x in objInvoiceDC.brdhc_Invoices orderby x.CreatedOn select x;
        return allInvoices;
    }

    //method to get all invoices by patient Id and status
    public IQueryable<brdhc_Invoice> getInvoicesByPatientIDandStatus(Guid pID, string status)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        var allInvoices = from x in objInvoiceDC.brdhc_Invoices where x.PatientID == pID && x.Status == status orderby x.CreatedOn select x;
        return allInvoices;
    }

    //method to get all invoices by doctor logged in
    public List<sp_getInvoiceByDocNameResult> getInvoicesbyDocUname(string docUsername)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        return objInvoiceDC.sp_getInvoiceByDocName(docUsername).ToList();
    }

    //method to get all invoices by doctor logged in and invoice status
    public List<sp_getInvoiceByDocStatusResult> getInvoicebyDocStatus(string docUsername, string status)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        return objInvoiceDC.sp_getInvoiceByDocStatus(docUsername, status).ToList();
    }

    //method to get all invoices by ID
    public IQueryable<brdhc_Invoice> getInvoicesById(Guid id)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        var invoice = from x in objInvoiceDC.brdhc_Invoices where x.InvoiceID == id orderby x.InvoiceID select x;
        return invoice;
    }

    //method to insert invoice
    public void insertInvoice(Guid _pID, DateTime _createdOn, string _createdBy, string _reason, string _status, DateTime _dueOn, Double _total)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        try
        {
            Guid invoiceID = Guid.NewGuid();
            Console.Write(invoiceID);
            brdhc_Invoice objInv = new brdhc_Invoice();
            objInv.InvoiceID = invoiceID;
            objInv.PatientID = _pID;
            objInv.CreatedOn = _createdOn;
            objInv.CreatedBy = _createdBy;
            objInv.Reason = _reason;
            objInv.Status = _status;
            objInv.DueOn = _dueOn;
            objInv.TotalAmt = _total;

            objInvoiceDC.brdhc_Invoices.InsertOnSubmit(objInv);
            objInvoiceDC.SubmitChanges();

        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
        }
    }

  //method to update transaction if completed
    public void updateTransaction(Guid invID, string txID, DateTime txDate)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();

        try
        {
            var inv = objInvoiceDC.brdhc_Invoices.Single(x => x.InvoiceID == invID);
            inv.TransactionID = txID;
            inv.PaidOn = txDate;
            inv.Status = "Paid";
            objInvoiceDC.SubmitChanges();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
    }

    //method to update invoice, only due date allowed
    public void updateDueDate(Guid invID, DateTime dueOn)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        try
        {
            var inv = objInvoiceDC.brdhc_Invoices.Single(x => x.InvoiceID == invID);
            inv.DueOn = dueOn;
            objInvoiceDC.SubmitChanges();
        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
        }
    }

    //method to delete invoice
    public void deleteInvoice(Guid invID)
    { 
        
       try
        {
           // delete all invoice items with this invID
            // respective datacontext object
            InvoiceItemDataContext objItemDC = new InvoiceItemDataContext();

            //get rows to delete
            var delItem = from i in objItemDC.brdhc_InvoiceItems where (i.InvoiceID == invID) select i;

            // delete from table
            objItemDC.brdhc_InvoiceItems.DeleteAllOnSubmit(delItem);
            //commit delete
            objItemDC.SubmitChanges();

           // delete invoice
           InvoicesDataContext objInvDC = new InvoicesDataContext();

           //get row to delete
           var delInv = from i in objInvDC.brdhc_Invoices where (i.InvoiceID == invID) select i;

           //delete from table
           objInvDC.brdhc_Invoices.DeleteAllOnSubmit(delInv);
           //commit delete
           objInvDC.SubmitChanges();
            
        }
        catch (Exception e)
        {
            clsCommon.saveError(e);
            
        }
    }
    
}