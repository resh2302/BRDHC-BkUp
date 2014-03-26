<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EmergencyWaitTime.aspx.cs" Inherits="EmergencyWaitTime" %>

<%--<%@ Register Src="~/Patients/patientLeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc" %>--%>

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
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server"> <%--REquired--%>
        <asp:Panel ID="pnlHead" runat="server"> <%--REquired--%>
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" Text="PATIENT DASHBOARD : EMERGENCY WAIT TIME" /> <%--REquired--%>
            <asp:LinkButton ID="mnuToggle"  CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" /> <%--REquired--%>
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" runat="server"> <%--REquired--%>
            <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server"> <%--REquired--%>
               <uc:LeftMenu ID="left_menu" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server"> <%--REquired--%>
                <%-- you can replace everything under pnlContent --%>
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

