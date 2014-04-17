<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="donateThanku.aspx.cs" Inherits="donateThanku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">

    <asp:Label ID="lbl_thanks" runat ="server" Text="You have successfully donated to Blind River District health centre. Thank you." CssClass="msHeader2" />
    <a href ="home.aspx" >Return Home</a>
</asp:Content>

