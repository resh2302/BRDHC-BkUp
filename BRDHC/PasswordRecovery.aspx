<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs" Inherits="PasswordRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">
        <asp:PasswordRecovery ID="pr_main" runat="server">
            <MailDefinition From="brdhc@jagsirsingh.com" Subject="Password Recovery BRDHC" />
        </asp:PasswordRecovery>
    </asp:Panel>
</asp:Content>

