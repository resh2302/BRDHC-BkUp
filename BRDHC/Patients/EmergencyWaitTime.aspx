<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="NewTime.aspx.cs" Inherits="NewTime" %>

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
    <%--REquired--%>
    <asp:Panel ID="pnlHead" CssClass="pnlHead" runat="server">

        <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />

        <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />

    </asp:Panel>
    <asp:Panel ID="pnlDashboard" CssClass="pnlDashboard" runat="server">

        <asp:Panel ID="pnlContent" CssClass="pnlContent pnlEmergencyNewTime" runat="server">
            <asp:Panel ID="pnlView" GroupingText="Current Emergency Wait Time" runat="server" CssClass="pnlEmergencyCurrent">
                <asp:Repeater ID="rptCurrent" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="lblCurrentTime" Text='<%#Eval("WaitTime") %>' CssClass="lblWaitTime" runat="server" />
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
            <br />
        </asp:Panel>
    </asp:Panel>
    </asp:Panel>
</asp:Content>

