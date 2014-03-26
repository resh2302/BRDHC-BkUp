<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmergencyMenu.ascx.cs" Inherits="EmergencyAdmin_EmergencyMenu" %>


<asp:Menu ID="mnuLeft" runat="server" Orientation="Vertical" CssClass="Menu" StaticEnableDefaultPopOutImage="False" RenderingMode="List">
    <Items>
        <asp:MenuItem NavigateUrl="~/EmergencyAdmin/EmergencyAdminDashboard.aspx" Text="My Profile"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/EmergencyAdmin/NewTime.aspx" Text="New Wait Time"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/EmergencyAdmin/ViewAll.aspx" Text="View All"></asp:MenuItem>
    </Items>
</asp:Menu>
