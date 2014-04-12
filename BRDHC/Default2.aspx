<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/healthTools.master" CodeFile="Default2.aspx.cs" Theme="HealthTools" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

        <div class="msPadTop30 msPadBot30 msAll70">
        <asp:Label runat="server" ID="lbl_default" Text="This is a student project from the Web Development program at Humber College." CssClass="msHeader2" />
        </div>

    </asp:Panel>
</asp:Content>