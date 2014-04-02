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
   
    public IQueryable<brdhc_Invoice> getInvoices()
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        var allInvoices = from x in objInvoiceDC.brdhc_Invoices orderby x.InvoiceID select x;
        return allInvoices;
    }
    
    public bool insertInvoice( Guid _pID, DateTime _createdOn, double _amt, string _createdBy, string _reason , string _status, DateTime _dueOn)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        using (objInvoiceDC)
        {
            brdhc_Invoice objInv = new brdhc_Invoice();
            objInv.PatientID = _pID;
            objInv.CreatedOn = _createdOn;
            objInv.TotalAmt = _amt;
            objInv.CreatedBy = _createdBy;
            objInv.Reason = _reason;
            objInv.Status = _status;
            objInv.DueOn = _dueOn;

            objInvoiceDC.brdhc_Invoices.InsertOnSubmit(objInv);
            objInvoiceDC.SubmitChanges();
            return true;
        }
    }

 
}