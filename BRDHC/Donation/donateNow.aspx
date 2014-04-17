<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="donateNow.aspx.cs" Inherits="Donation_donateNow" Theme="HealthTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">
    <%-- script to toggle the panels --%>
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
   <br />
    <asp:Panel ID="pnlHead" runat="server"> <%--REquired--%>
            <asp:Label ID="lblDashboard" CssClass="msHeader2" runat="server" Text="Donate Now" /> <%--REquired--%>
          <br />
            <%-- Problem: button goes outside container --%>
        </asp:Panel>
    <div id="lblgen">
    <asp:Label ID ="lbl_main" CssClass="msh2home" runat="server" Text="Thank you for your generosity that allows us to continue our shared mission"  />
        </div>
    <br />
    <asp:Label ID="lbltext" runat="server" Text="How many times would u like to Donate?" />

    <asp:RadioButtonList ID="rd_main" runat="server" >
        <asp:ListItem  Value="1" Selected="True">One Time</asp:ListItem>
         <asp:ListItem  Value="2">Recurring</asp:ListItem>
    </asp:RadioButtonList>

    <%-- panel for one time donation --%>
    <asp:Panel ID="pnl_oneTime" runat="server" >
        <br />
          <asp:Button ID="btn" runat="server" OnClick="donateNow" Text="Donate"  />
    </asp:Panel>
    <br /><br />
    <%-- panel for recurring donations --%>
    <asp:Panel ID="pnl_Recurring" runat="server" >
         <asp:Label ID="lbls" runat ="server" Text="Recurring Donation" CssClass="infoLabel" />
        <br />
        <asp:Label ID="lbl_One" runat ="server" Text="When would u like to recurr?" />
        <br />
        <%-- dropdownlist for selecting time --%>
         <asp:DropDownList ID="drpy" runat="server">
          <asp:ListItem Value="D">Daily</asp:ListItem>
          <asp:ListItem Value="M">Monthly</asp:ListItem>
          <asp:ListItem Value="Y">Yearly</asp:ListItem>
          </asp:DropDownList>
        <br /><br />
    
        <asp:Label ID="lblRecur" runat="server" Text="How many times would you like this to recur? (including this payment)"  />
        <br />
      <asp:DropDownList ID="drp" runat="server" >
         <%-- dropdownlist for installments --%>
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
    <%-- text box for getting amount from user --%>
          <asp:TextBox ID="txtamount" runat="server" />
        <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rfv_don"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txtamount"  
                                  ErrorMessage="Please enter Donation Amount" 
                                Text="*Required"
                                ForeColor="#FF0000" />
        <br /><br />
          
     <asp:Button ID="btn_recur" runat="server" OnClick="donateNowRecur" Text="Donate" ValidationGroup="group1" />
        <%-- validattion summary --%>
       <asp:ValidationSummary ID="Vali_summ" runat="server" HeaderText="Errors:" DisplayMode="List" ShowMessageBox="true" ShowSummary="false" ForeColor="#FF0000" Font-Bold="true" ValidationGroup="group1"/>
    </asp:Panel>
  <br />
</asp:Content>

