<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">
        <asp:Login ID="login_main" runat="server" PasswordRecoveryUrl="~/PasswordRecovery.aspx" DestinationPageUrl="~/Default.aspx" PasswordRecoveryText="Forgot Your Password?" />
    </asp:Panel>
</asp:Content>

