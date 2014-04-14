<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" Theme="HealthTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

    <div id="container">
    <div class="msAll98 msPadBot10 msPadTop30">
    
    <div class="bootContainer">
    <div class="col-xs-12 col-sm-6 col-sm-offset-3 msParaNo">

        <asp:Login ID="login_main" runat="server" PasswordRecoveryUrl="~/PasswordRecovery.aspx" DestinationPageUrl="~/Admin/appointments.aspx" PasswordRecoveryText="Forgot Your Password?" />
    
    </div>
    </div>
    </div>
    </div>

    </asp:Panel>
</asp:Content>

