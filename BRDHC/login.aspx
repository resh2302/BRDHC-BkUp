<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" Theme="HealthTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

    <div id="container">
    <asp:Panel ID="Panel1" CssClass="pnlContainer" runat="server">
    <div class="msAll98 msPadBot10 msOH">

        <asp:Login ID="login_main" runat="server" PasswordRecoveryUrl="~/PasswordRecovery.aspx" DestinationPageUrl="~/Default.aspx" PasswordRecoveryText="Forgot Your Password?" />
    
    </div>
    </asp:Panel>
    </div>

    </asp:Panel>
</asp:Content>

