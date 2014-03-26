<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click" />

        <asp:Panel ID="pnl_login" runat="server" Visible="false">
            <asp:Login ID="login_main" runat="server" PasswordRecoveryUrl="~/PasswordRecovery.aspx" PasswordRecoveryText="Forgot Your Password?" ></asp:Login>            
        </asp:Panel>
        
    </div>
    </form>
</body>
</html>
