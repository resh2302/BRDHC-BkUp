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

        <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">

            <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="statusMsg" />
            <%--REquired--%>

            <ajax:TabContainer ID="tcBills" runat="server">
                <ajax:TabPanel ID="tpPending" runat="server" HeaderText="Pending Bills" OnDemandMode="Once">
                    <ContentTemplate>
                        <asp:GridView ID="gvPendingInvoice" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvPendingInvoice_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="Doctor Username">
                                    <ItemTemplate>
                                        <%#Eval("CreatedBy") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created On">
                                    <ItemTemplate>
                                        <%#Eval("CreatedOn","{0:d}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Due On">
                                    <ItemTemplate>
                                        <%#Eval("DueOn","{0:d}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIStatus" Text='<%#Eval("Status") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Amount">
                                    <ItemTemplate>
                                        <%#Eval("TotalAmt") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View Items">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkItems" Text="View Items" CommandArgument='<%#Eval("InvoiceID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button Text="Pay Now" CssClass="btnAdd" ID="btnPay" OnCommand="btnPay_Command" runat="server" CommandArgument='<%#Eval("InvoiceID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </ajax:TabPanel>
                <%--/ #tpPending--%>
                <ajax:TabPanel ID="tpPaid" runat="server" HeaderText="Paid Bills" OnDemandMode="Once">
                    <ContentTemplate>
                         <asp:GridView ID="gvPaidInvoice" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvPaidInvoice_PageIndexChanging" OnRowDataBound="gvPaidInvoice_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Transaction ID">
                                    <ItemTemplate>
                                        <%#Eval("TransactionID") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Paid On">
                                    <ItemTemplate>
                                        <%#Eval("PaidOn") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Doctor Username">
                                    <ItemTemplate>
                                        <%#Eval("CreatedBy") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created On">
                                    <ItemTemplate>
                                        <%#Eval("CreatedOn","{0:d}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Due On">
                                    <ItemTemplate>
                                        <%#Eval("DueOn","{0:d}") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIStatus" Text='<%#Eval("Status") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Amount">
                                    <ItemTemplate>
                                        <%#Eval("TotalAmt") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View Items">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkItems" Text="View Items" CommandArgument='<%#Eval("InvoiceID") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button Text="Pay Now" CssClass="btnAdd" ID="btnPay" OnCommand="btnPay_Command" runat="server" CommandArgument='<%#Eval("InvoiceID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </ajax:TabPanel>
                <%--/ #tpPaid--%>
            </ajax:TabContainer>
            <%--/ #tcBills--%>
        </asp:Panel>
    </asp:Panel>

</asp:Content>

