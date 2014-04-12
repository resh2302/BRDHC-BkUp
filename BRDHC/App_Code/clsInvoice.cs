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
        var allInvoices = from x in objInvoiceDC.brdhc_Invoices orderby x.CreatedOn select x;
        return allInvoices;
    }

    public IQueryable<brdhc_Invoice> getInvoicesByPatientIDandStatus(Guid pID, string status)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        var allInvoices = from x in objInvoiceDC.brdhc_Invoices where x.PatientID == pID && x.Status == status orderby x.CreatedOn select x;
        return allInvoices;
    }

    public List<sp_getInvoiceByDocNameResult> getInvoicesbyDocUname(string docUsername)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        return objInvoiceDC.sp_getInvoiceByDocName(docUsername).ToList();
    }

    public IQueryable<brdhc_Invoice> getInvoicesById(Guid id)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        var invoice = from x in objInvoiceDC.brdhc_Invoices where x.InvoiceID == id orderby x.InvoiceID select x;
        return invoice;
    }

    public System.Collections.ArrayList insertInvoice(Guid _pID, DateTime _createdOn, string _createdBy, string _reason, string _status, DateTime _dueOn, Double _total)
    {
        InvoicesDataContext objInvoiceDC = new InvoicesDataContext();
        using (objInvoiceDC)
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
                     

            System.Collections.ArrayList idBool = new System.Collections.ArrayList();
            idBool.Add(invoiceID);
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