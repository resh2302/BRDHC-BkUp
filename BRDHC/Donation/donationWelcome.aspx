<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Theme="HealthTools" AutoEventWireup="true" CodeFile="donationWelcome.aspx.cs" Inherits="Donation_donationWelcome" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">
   
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server"> <%--REquired--%>
        <asp:Panel ID="pnlHead" runat="server"> <%--REquired--%>
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" Text="Make a Donation to BRDHC Trust" /> <%--REquired--%>
          
            <%-- Problem: button goes outside container --%>
        </asp:Panel>
     <%--REquired--%>
        <%-- Labels and panels --%>
               <asp:Panel ID="pnlInner" CssClass="pnlDonate" runat="server" >
           <asp:Label ID="lblDonate" runat="server" Text="The Blind River District Health Centre Foundation raises funds to ensure that the Blind River District Health Centre can fulfill its vision and continue to expand services, develop new programs, and bring leading-edge technology and treatment to the people of our North Shore communities. The donations you make can be left undesignated for equipment purchases throughout the Health Centre.
             You can also decide to donate to a particular program, for example Golden Birches Terrace. You decide where your contribution will be used. Many people donate to departments which have helped them or a loved one or to the area they work in at the Health Centre." />
                   <br /><br />
                    <asp:Label ID="lblDonateNow" runat="server" Text="Donate Now" CssClass="myLabel" />
                  <br />
                    <asp:Label runat="server" Text="Donate online quickly and easily through our secure donation process." />
                   <br />
                   <asp:Button ID="donateNow" runat="server" Text="Donate Now" OnClick="subClick" />  
                   <br /><br />  
                   <asp:Label ID="lblPhone" runat="server" Text="Donate By Phone" CssClass="myLabel"  />
                   <br />
                   <asp:Label runat="server" Text="To speak to someone at the BRDHC Foundation about making a donation call 1800 BRDHC (1800 278 462)." />
          </asp:Panel>
        </asp:Panel>
   
          <br />
       

</asp:Content>

