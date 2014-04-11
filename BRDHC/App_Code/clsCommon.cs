///////////////////////////////////////////////////////////////////
// AUTHOR:           JAGSIR
// LAST MODIFIED BY: JAGSIR
// DATE MODIFIED: -  22 FEB 2014
// DESCRIPTION:      CLASS FOR COMMON FUNCTIONALITY
///////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;
using System.Reflection;
using System.Data;


/// <summary>
/// CLASS THAT CONTAINS COMMON FUNCTIONS FOR ALL PAGES
/// </summary>
public class clsCommon
{
    #region "Email Properties"
    string smtpHost = WebConfigurationManager.AppSettings["smtpHost"].ToString();
    string fromEmail = WebConfigurationManager.AppSettings["fromEmail"].ToString();
    string fromName = WebConfigurationManager.AppSettings["fromName"].ToString();
    string mailPasswod = WebConfigurationManager.AppSettings["mailPasswod"].ToString();
    # endregion

    #region "Load common valuse in  dropdows"

    public IQueryable<brdhc_Country> getAllCountries()
    {
        CommonDataContext objCommon = new CommonDataContext();
        var countries =
            from c in objCommon.brdhc_Countries
            orderby c.Country
            select c;
        return countries;
    }
    public IQueryable<brdhc_State> getStatesByCountryId(Guid countryId)
    {
        CommonDataContext objCommon = new CommonDataContext();
        var states =
            from s in objCommon.brdhc_States
            where (s.CountryId == countryId)
            orderby s.State
            select s;
        return states;
    }
  
    public IQueryable<brdhc_City> getCitiesByStateId(Guid stateId)
    {
        CommonDataContext objCommon = new CommonDataContext();
        var cities =
            from c in objCommon.brdhc_Cities
            where (c.StateId == stateId)
            orderby c.City
            select c;
        return cities;
    }
    
    public DataTable getMenusByRoleName(string roleName)
    {DataTable dtbl = new DataTable();
        CommonDataContext objCommon = new CommonDataContext();
        if (roleName.ToLower() == "administration")
        {
            var menu =
                from m in objCommon.brdhc_DashboardMenus
                orderby m.MenuTitle
                select m;
            dtbl = LINQToDataTable(menu);
        }
        else
        {
            var menu =
                from m in objCommon.brdhc_DashboardMenus
                where (m.RoleName == roleName.ToLower())
                orderby m.MenuTitle
                select m;
            dtbl = LINQToDataTable(menu);
        }
         return dtbl;
    }
    public DataTable LINQToDataTable<T>(IEnumerable<T> varlist)
    {
        DataTable dtReturn = new DataTable();
        // column names
        PropertyInfo[] oProps = null;
        if (varlist == null) return dtReturn;
        foreach (T rec in varlist)
        {
            // Use reflection to get property names, to create table, Only first time, others will follow
            if (oProps == null)
            {
                oProps = ((Type)rec.GetType()).GetProperties();
                foreach (PropertyInfo pi in oProps)
                {
                    Type colType = pi.PropertyType;
                    if ((colType.IsGenericType) && (colType.GetGenericTypeDefinition() == typeof(Nullable<>)))
                    {
                        colType = colType.GetGenericArguments()[0];
                    }
                    dtReturn.Columns.Add(new DataColumn(pi.Name, colType));
                }
            }
            DataRow dr = dtReturn.NewRow();
            foreach (PropertyInfo pi in oProps)
            {
                dr[pi.Name] = pi.GetValue(rec, null) == null ? DBNull.Value : pi.GetValue
                (rec, null);
            }
            dtReturn.Rows.Add(dr);
        }
        return dtReturn;
    }
    public DataTable getUsersByRole(string roleName)
    {
        UserDetailsDataContext objUser = new UserDetailsDataContext();
        var users =
            from u in objUser.brdhc_UserBasicInfos
            join roles in objUser.aspnet_UsersInRoles
            on u.UserId equals roles.UserId
            join r in objUser.aspnet_Roles
            on roles.RoleId equals r.RoleId
            where (r.RoleName == roleName.ToLower())
            orderby u.FirstName, u.LastName
            select new { u.UserId, FullName = u.FirstName + ' ' + u.LastName };
        DataTable dt = LINQToDataTable(users);
        return dt;
    }
    #endregion


    /// <summary>
    ///  FUNCTION TO CHECK THE VALID EXTENSION FOR THE IMAGE FILE UPLOADED THROUGH FILE UPLOAD CONTROL
    /// </summary>
    /// <param name="fileExtention"></param>
    /// <returns></returns>
    public bool isValidImage(string fileExtention)
    {
        bool result = false;
        List<string> arrValidExtention = new List<string>();
        arrValidExtention.Add(".jpg");
        arrValidExtention.Add(".jpeg");
        arrValidExtention.Add(".png");
        arrValidExtention.Add(".bmp");
        if (arrValidExtention.Contains(fileExtention))
        {
            result = true;
        }

        return result;
    }
    public List<string> GetTimeIntervals()
    {
        List<string> timeIntervals = new List<string>();
        //TimeSpan startTime = new TimeSpan(0, 0, 0);    // THIS IS FOR TIME TO START AT 12:00 AM IN THE MORNING
        TimeSpan startTime = new TimeSpan(9, 0, 0);
        DateTime startDate = new DateTime(DateTime.MinValue.Ticks); // Date to be used to get shortTime format.
        for (int i = 0; i < 8; i++)  // LOOP FOR TOTAL WORKING HOURS IN A DAY LIKE HERE IT IS FOR 8 HOURS FROM 9:00 AM to 4:00 PM
        {
            int minutesToBeAdded = 60 * i;      // Increasing minutes by 60 minutes interval
            TimeSpan timeToBeAdded = new TimeSpan(0, minutesToBeAdded, 0);  // NOW HERE GET TOTAL TIME TO ADD IN START TIME
            TimeSpan t = startTime.Add(timeToBeAdded); // ADD CALCULATED TIME INTO START TIME
            DateTime result = startDate + t;
            timeIntervals.Add(result.ToShortTimeString());      // Use Date.ToShortTimeString() method to get the desired format                
        }
        return timeIntervals;
    }

    # region "Email Functions"
    /// <summary>
    /// sendEmail()
    /// </summary>
    /// <param name="to"></param>
    /// <param name="cc"></param>
    /// <param name="bcc"></param>
    /// <param name="msgBody"></param>
    /// <param name="subject"></param>
    /// <param name="isBodyHTML"></param>
    /// <returns></returns>
    public string sendEMail(string to, string cc, string bcc, string msgBody, string subject, bool isBodyHTML)
    {
        string result = null;
        try
        {
            SmtpClient SmtpServer = new SmtpClient(smtpHost);
            var mail = new MailMessage();
            mail.From = new MailAddress(fromEmail, fromName);
            mail.To.Add(to);
            mail.CC.Add(cc);
            mail.Bcc.Add(bcc);
            mail.Subject = subject;
            mail.IsBodyHtml = isBodyHTML;
            if (isBodyHTML)
            {
                mail.Body = "<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a>" + msgBody + "<br /></div>";
            }
            else
            {
                mail.Body = msgBody;
            }
            SmtpServer.Port = 587;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential(fromEmail, mailPasswod);
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
        }
        catch (Exception ex)
        {
            result = ex.Message.ToString();
        }
        return result;
    }
    /// <summary>
    /// sendEMail()
    /// </summary>
    /// <param name="to"></param>
    /// <param name="cc"></param>
    /// <param name="msgBody"></param>
    /// <param name="subject"></param>
    /// <param name="isBodyHTML"></param>
    /// <returns></returns>
    public string sendEMail(string to, string cc, string msgBody, string subject, bool isBodyHTML)
    {
        string result = null;
        try
        {
            SmtpClient SmtpServer = new SmtpClient(smtpHost);
            var mail = new MailMessage();
            mail.From = new MailAddress(fromEmail, fromName);
            mail.To.Add(to);
            mail.CC.Add(cc);
            mail.Subject = subject;
            mail.IsBodyHtml = isBodyHTML;
            if (isBodyHTML)
            {
                mail.Body = "<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a>" + msgBody + "<br /></div>";
            }
            else
            {
                mail.Body = msgBody;
            }
            SmtpServer.Port = 587;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential(fromEmail, mailPasswod);
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
        }
        catch (Exception ex)
        {
            result = ex.Message.ToString();
        }
        return result;
    }
    /// <summary>
    /// sendEMail()
    /// </summary>
    /// <param name="to"></param>
    /// <param name="msgBody"></param>
    /// <param name="subject"></param>
    /// <param name="isBodyHTML"></param>
    /// <returns></returns>
    public string sendEMail(string to, string msgBody, string subject, bool isBodyHTML)
    {
        string result = null;
        try
        {
            SmtpClient SmtpServer = new SmtpClient(smtpHost);
            var mail = new MailMessage();
            mail.From = new MailAddress(fromEmail, fromName);
            mail.To.Add(to);
            mail.Subject = subject;
            mail.IsBodyHtml = isBodyHTML;
            if (isBodyHTML)
            {
                mail.Body = "<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a>" + msgBody + "<br /></div>";
            }
            else
            {
                mail.Body = msgBody;
            }
            SmtpServer.Port = 587;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential(fromEmail, mailPasswod);
            SmtpServer.EnableSsl = false;
            SmtpServer.Send(mail);
        }
        catch (Exception ex)
        {
            result = ex.Message.ToString();
        }
        return result;
    }

    # endregion

    public static void saveError(Exception ex)
    {
        string eventName = ex.TargetSite.ToString();

        System.Diagnostics.StackTrace st = new System.Diagnostics.StackTrace(ex, true);

        System.Diagnostics.StackFrame frame = st.GetFrame(0); //returns {PermissionDemand at offset 5316022 in file:line:column <filename unknown>:0:0}

        //Get the file name
        string fileName = frame.GetFileName();
        string[] file = fileName.Split('\\');
        string finalFileName = file[file.Count() - 1].ToString();

        //Get the method name
        string methodName = frame.GetMethod().Name; //returns PermissionDemand

        //Get the line number from the stack frame
        int line = frame.GetFileLineNumber(); //returns 0

        //Get the column number
        int col = frame.GetFileColumnNumber(); //returns 0    


        // create a new table with one row and this table is similar in schema with the table in database
        brdhc_ErrorLog svTable = new brdhc_ErrorLog()
        {
            FileName = finalFileName,
            MethodName = methodName,
            EventName = eventName,
            LineNumber = line,
            ColumnNumber = col,
            Message = ex.Message.ToString(),
            ExceptionType = ex.GetType().ToString(),
            ExceptionTime = DateTime.Now
        };
        CommonDataContext obj = new CommonDataContext();
        // call the function to save the row into actual database table
        obj.brdhc_ErrorLogs.InsertOnSubmit(svTable);
        obj.SubmitChanges();

    }
    public IQueryable<brdhc_ErrorLog> getErrorLogs()
    {
        CommonDataContext objCommon = new CommonDataContext();
        return objCommon.brdhc_ErrorLogs.Select(el => el);
    }

    public List<sp_getAlertSubscribersResult> sp_getAlertSubscribers(string applicationName)
    {
        List<sp_getAlertSubscribersResult> myList = new List<sp_getAlertSubscribersResult>();
        CommonDataContext obj = new CommonDataContext();
        return obj.sp_getAlertSubscribers(applicationName).ToList();
    }
}
