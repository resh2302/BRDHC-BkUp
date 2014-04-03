<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="BillThankYou.aspx.cs" Inherits="BillThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">
    <asp:Label ID="lblTY" runat="server" Text="Thank You. Your transaction was successful" />
    <%-- Capture data in querystring and display message according to status --%>

    <asp:Label ID="lblData" runat="server" />
</asp:Content>

