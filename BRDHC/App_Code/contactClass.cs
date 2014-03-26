using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for contactClass
/// </summary>
public class contactClass
{
    public IQueryable<brdhc_ContactUs> getMessages()
    {
        contactUsDataContext objMessages = new contactUsDataContext();
        var allMessages = objMessages.brdhc_ContactUs.Select(x => x);
        return allMessages;
    }

    public IQueryable<brdhc_ContactUs> getMessageByID(Guid id)
    {
        contactUsDataContext objMessages = new contactUsDataContext();
        var singleMessages = objMessages.brdhc_ContactUs.Where(x => x.ContactMessageId == id).Select(x => x);
        return singleMessages;
    }
    //insert new message
    public bool insertMessage(Guid id, string _fname, string _lname, string _email, string _phone, string _message,
        string _subject, //bool isChecked, 
        DateTime _contactDate)
    {
        contactUsDataContext objMessages = new contactUsDataContext();
        using (objMessages)
        {
            brdhc_ContactUs objNewMessage = new brdhc_ContactUs();
            objNewMessage.ContactMessageId = Guid.NewGuid();
            objNewMessage.FirstName = _fname;
            objNewMessage.LastName = _lname;
            objNewMessage.Email = _email;
            objNewMessage.Phone = _phone;
            objNewMessage.Message = _message;
            objNewMessage.Subject = _subject;
            //objNewMessage.IsChecked = isChecked;
            objNewMessage.ContactDate = _contactDate;
            objMessages.brdhc_ContactUs.InsertOnSubmit(objNewMessage);
            objMessages.SubmitChanges();
            return true;
        }
    }
    public bool checkMessage(Guid id, bool _isChecked)
    {
        contactUsDataContext objMessages = new contactUsDataContext();
        using (objMessages)
        {
            var checkMessage = objMessages.brdhc_ContactUs.Single(x=>x.ContactMessageId == id);
            checkMessage.IsChecked = _isChecked;
            objMessages.SubmitChanges();
            return true;
            
        }
    }
    public bool replyMessage(Guid id, string _replyMsg, DateTime _replyDate)
    {
        contactUsDataContext objMessages = new contactUsDataContext();
        using (objMessages)
        {
            var replyMessage = objMessages.brdhc_ContactUs.Single(x => x.ContactMessageId == id);
            replyMessage.ReplyMessage = _replyMsg;
            replyMessage.ReplyDate = _replyDate;
            objMessages.SubmitChanges();
            return true;
        }
    }

    public bool deleteMessage(Guid id)
    {
        contactUsDataContext objMessages = new contactUsDataContext();
        using (objMessages)
        {
            var objDelMessage = objMessages.brdhc_ContactUs.Single(x => x.ContactMessageId == id);
            objMessages.brdhc_ContactUs.DeleteOnSubmit(objDelMessage);
            objMessages.SubmitChanges();
            return true;
        }
    }
}