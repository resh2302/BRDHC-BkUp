<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="CommunityAdmin.aspx.cs" Inherits="brdhcCommunity_CommunityAdmin" %>
<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <script type="text/javascript"> /* Make this user control */
        $(document).ready(function () {
            console.log("Script loaded");
            $('.dashboardMenuBtn').click(function (e) {
                e.preventDefault();
                $('.pnlLeftMenu').toggleClass('active');
            });
        });
    </script>
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server"> >
        <asp:Panel ID="pnlHead" runat="server"> 
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server"/> 
            <asp:LinkButton ID="mnuToggle"  CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" /> 
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" runat="server">
            <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server">
            </asp:Panel>
                
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

