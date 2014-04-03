////////////////////////////////////////////////////////////////////
// AUTHOR:           RESHMA MATHEW
// DESCRIPTION:      CLASS FOR PATIENT'S INVOICE MANAGEMENT
///////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.Collections.ArrayList;


public class clsInvoice
{
    public static Guid insertedInvoiceID;
   
    public IQueryable<brdhc_Invoice> getInvoices()
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        var allInvoices = from x in objInvoiceDC.brdhc_Invoices orderby x.InvoiceID select x;
        return allInvoices;
    }

    public System.Collections.ArrayList insertInvoice(Guid _pID, DateTime _createdOn, string _createdBy, string _reason, string _status, DateTime _dueOn)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        using (objInvoiceDC)
        {
            brdhc_Invoice objInv = new brdhc_Invoice();
            objInv.PatientID = _pID;
            objInv.CreatedOn = _createdOn;
            objInv.CreatedBy = _createdBy;
            objInv.Reason = _reason;
            objInv.Status = _status;
            objInv.DueOn = _dueOn;

            objInvoiceDC.brdhc_Invoices.InsertOnSubmit(objInv);
            objInvoiceDC.SubmitChanges();

            insertedInvoiceID = objInv.InvoiceID;

            System.Collections.ArrayList idBool = new System.Collections.ArrayList();
            idBool.Add(insertedInvoiceID);
            idBool.Add(true);

            return idBool;
        }
    }

    public bool insertAmount(Guid invoiceID, double amount)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        using (objInvoiceDC)
        {
            brdhc_Invoice objInv = new brdhc_Invoice();
            objInv.TotalAmt = amount;

            objInvoiceDC.brdhc_Invoices.InsertOnSubmit(objInv);
            objInvoiceDC.SubmitChanges();

            return true;
        }
    }
 
}