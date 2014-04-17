<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="donateNow.aspx.cs" Inherits="Donation_donateNow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">
   <script>
       $(document).ready(function () {
           $("#cphSiteMasterBody_pnl_Recurring").hide();
           $("#cphSiteMasterBody_rd_main_0").click(function () {
               $("#cphSiteMasterBody_pnl_Recurring").hide();
               $("#cphSiteMasterBody_pnl_oneTime").show();
           });
           $("#cphSiteMasterBody_rd_main_1").click(function () {
               $("#cphSiteMasterBody_pnl_Recurring").show();
               $("#cphSiteMasterBody_pnl_oneTime").hide();
           });
       });
</script>
    <asp:Label ID="lbltext" runat="server" Text="How many times would u like to Donate?" />
    <asp:RadioButtonList ID="rd_main" runat="server" >
        <asp:ListItem  Value="1" Selected="True">One Time</asp:ListItem>
         <asp:ListItem  Value="2">Recurring</asp:ListItem>
    </asp:RadioButtonList>


    <asp:Panel ID="pnl_oneTime" runat="server" >
          <asp:Button ID="btn" runat="server" OnClick="donateNow" Text="Donate"  />
    </asp:Panel>
    <br /><br />
    <asp:Panel ID="pnl_Recurring" runat="server" >
        <asp:Label ID="lbl_One" runat ="server" Text="When would u like to recurr?" />
        <br />
         <asp:DropDownList ID="drpy" runat="server">
          <asp:ListItem Value="D">Daily</asp:ListItem>
          <asp:ListItem Value="M">Monthly</asp:ListItem>
          <asp:ListItem Value="Y">Yearly</asp:ListItem>
          </asp:DropDownList>
        <br /><br />
    
        <asp:Label ID="lblRecur" runat="server" Text="How many times would you like this to recur? (including this payment)"  />
        <br />
      <asp:DropDownList ID="drp" runat="server" >
          <asp:ListItem Value="1">1</asp:ListItem>
          <asp:ListItem Value="2">2</asp:ListItem>
          <asp:ListItem Value="3">3</asp:ListItem>
          <asp:ListItem Value="3">4</asp:ListItem>
          <asp:ListItem Value="3">5</asp:ListItem>
          <asp:ListItem Value="3">6</asp:ListItem>
          <asp:ListItem Value="3">7</asp:ListItem>
          <asp:ListItem Value="3">8</asp:ListItem>
          <asp:ListItem Value="3">9</asp:ListItem>
          <asp:ListItem Value="3">10</asp:ListItem>
          <asp:ListItem Value="3">11</asp:ListItem>
          <asp:ListItem Value="3">12</asp:ListItem>
         
      </asp:DropDownList>

        <br /><br />
        <asp:Label ID="lbl" runat="server" Text="Enter your Donation Amount:"   />
    
          <asp:TextBox ID="txtamount" runat="server" />
        <br /><br />
          <asp:Button ID="Button1" runat="server" OnClick="donateNowRecur" Text="Donate" />
    </asp:Panel>

</asp:Content>

