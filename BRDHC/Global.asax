<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        string ErrorMessage = "The error description is as follows : " + Server.GetLastError().ToString();


        string smtpHost = System.Web.Configuration.WebConfigurationManager.AppSettings["smtpHost"].ToString();
        string fromEmail = System.Web.Configuration.WebConfigurationManager.AppSettings["fromEmail"].ToString();
        string fromName = System.Web.Configuration.WebConfigurationManager.AppSettings["fromName"].ToString();
        string mailPasswod = System.Web.Configuration.WebConfigurationManager.AppSettings["mailPasswod"].ToString();
        System.Net.Mail.SmtpClient SmtpServer = new System.Net.Mail.SmtpClient(smtpHost);
        var mail = new System.Net.Mail.MailMessage();
        mail.From = new System.Net.Mail.MailAddress(fromEmail, fromName);
        mail.To.Add("jagsirsingh@hotmail.com");
        mail.Subject = "Error at www.brdhchumber.com";
        mail.IsBodyHtml = true;

        mail.Body = ErrorMessage;
        SmtpServer.Port = 587;
        SmtpServer.UseDefaultCredentials = false;
        SmtpServer.Credentials = new System.Net.NetworkCredential(fromEmail, mailPasswod);
        SmtpServer.EnableSsl = false;
        SmtpServer.Send(mail);

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
