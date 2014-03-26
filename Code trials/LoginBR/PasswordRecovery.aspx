<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs" Inherits="PasswordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:PasswordRecovery  ID="pr_main" runat="server">
            <MailDefinition From="brdhc@jagsirsingh.com" Subject="Password Recovery BRDHC" />            
        </asp:PasswordRecovery>
    </div>
    </form>
</body>
</html>
