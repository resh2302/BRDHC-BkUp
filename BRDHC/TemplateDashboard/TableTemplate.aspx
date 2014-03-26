<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TableTemplate.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">
        <asp:Panel ID="pnlHead" runat="server">
            <%--REquired--%>
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" Text="PATIENT DASHBOARD : APPOINTMENTS" />
            <%--REquired--%>
            <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />
            <%--REquired--%>
            <%-- Problem: button goes outside container --%>
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" runat="server">
            <%--REquired--%>
            <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server">
                <%--REquired--%>
                <asp:Menu ID="mnuLeft" runat="server" Orientation="Vertical" CssClass="Menu" StaticEnableDefaultPopOutImage="False" RenderingMode="List">
                    <Items>
                        <asp:MenuItem NavigateUrl="#" Text="My Profile" Value="New Item"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="#" Text="Appointments" Selected="true" Value="New Item">
                            <asp:MenuItem NavigateUrl="#" Text="Upcoming Appointments" />
                            <asp:MenuItem NavigateUrl="#" Text="Request Appointments" />
                            <asp:MenuItem NavigateUrl="#" Text="Request Status" />
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="#" Text="Doctor Schedule" Value="New Item"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="#" Text="Prescription" Value="New Item"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="#" Text="Pay Bills" Value="New Item"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </asp:Panel>
            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
                <%--REquired--%>
                <asp:Panel ID="pnlTable" CssClass="pnlTable table-responsive" runat="server">
                    <table class="blueTable table">
                        <thead>
                            <tr>
                                <th>Heading 1</th>
                                <th>Heading 2</th>
                                <th>Heading 3</th>
                                <th>Heading 4</th>
                                <th>Heading 5</th>
                                <th>Heading 6</th>
                                <th>Heading 7</th>
                                <th>Heading 8</th>
                                <th>Heading 9</th>
                            </tr>
                        </thead>
                        <tr>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                        </tr>
                        <tr>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                        </tr>
                        <tr>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                            <td>some content</td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

