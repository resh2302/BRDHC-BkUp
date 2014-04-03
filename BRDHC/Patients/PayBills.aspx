<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="PayBills.aspx.cs" Inherits="PayBills" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <%--REquired--%>
    <asp:Panel ID="pnlHead" CssClass="pnlHead" runat="server">

        <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />

        <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />

    </asp:Panel>
    <asp:Panel ID="pnlDashboard" CssClass="pnlDashboard" runat="server">

        <asp:Panel ID="pnlContent" CssClass="pnlContent pnlEmergencyNewTime" runat="server">

            <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="statusMsg" />
            <%--REquired--%>

            <table>
                <tr>
                    <th>Invoice ID</th>
                    <th>Invoice Date</th>
                    <th>Amount Payable</th>
                    <th>Created By</th>
                    <th>Due Date</th>
                    <th>Status</th>
                    <th></th>
                </tr>
                <asp:GridView ID="gvInvoice" runat="server" GridLines="Both" AllowPaging="true" PageSize="5">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("InvoiceID") %></td>
                                    <td><%#Eval("CreatedOn") %></td>
                                    <td><%#Eval("TotalAmt") %></td>
                                    <td><%#Eval("CreatedBy") %></td>
                                    <td><%#Eval("DueOn") %></td>
                                    <td><%#Eval("Status") %></td>
                                    <td>
                                        <asp:Button ID="btnSelect" runat="server" Text="PAY NOW" CommandArgument='<%#Eval("InvoiceID") %>' OnCommand="btnSelect_Command" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </table>
        </asp:Panel>
    </asp:Panel>

</asp:Content>

