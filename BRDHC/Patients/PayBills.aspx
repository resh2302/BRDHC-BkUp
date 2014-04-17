<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="PayBills.aspx.cs" Inherits="PayBills" Theme="Theme" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlHead" CssClass="pnlHead" runat="server">

        <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />

        <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />

    </asp:Panel>
    <asp:Panel ID="pnlDashboard" CssClass="pnlDashboard" runat="server">

        <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
            <%-- tabcontainer for showing 2 tabs - pending and paid invoices --%>
            <ajax:TabContainer ID="tcBills" runat="server">
                <%-- tab for pending invoices --%>
                <ajax:TabPanel ID="tpPending" runat="server" HeaderText="Pending Bills" OnDemandMode="Once">
                    <ContentTemplate>
                        <%-- gridview used for displaying pending invoices --%>
                        <asp:GridView ID="gvPendingInvoice" DataKeyNames="InvoiceID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvPendingInvoice_PageIndexChanging">
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
                                        <asp:LinkButton ID="lnkItems" Text="View Items" OnClick="lnkItems_Click" runat="server" />
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
                <%-- tab for displaying paid invoices --%>
                <ajax:TabPanel ID="tpPaid" runat="server" HeaderText="Paid Bills" OnDemandMode="Once">
                    <ContentTemplate>
                        <%-- Gridview used for paid invoices --%>
                        <asp:GridView ID="gvPaidInvoice" runat="server" DataKeyNames="InvoiceID" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvPaidInvoice_PageIndexChanging">
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
                                        <asp:LinkButton ID="lnkItems" Text="View Items" OnClick="lnkItems_Click1" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </ajax:TabPanel>
                <%--/ #tpPaid--%>
            </ajax:TabContainer>
            <%--/ #tcBills--%>
            <%-- button set as TargetControlID for popup but never displayed and used, this was a small hack to avoid an error message becaus the TargetControlID is a mandatory attribute. The popup is displayed on click of lnkItems from codebehind  --%>
            <asp:Button ID="btnInvisible" runat="server" Style="display: none" />
            <%-- modal popup to dispaly invoice items --%>
            <ajax:ModalPopupExtender ID="mpeItems" runat="server"
                OkControlID="btnOkay"
                TargetControlID="btnInvisible" PopupControlID="pnlItemsPopup"
                PopupDragHandleControlID="PopupHeader" Drag="true"
                BackgroundCssClass="ModalPopupBG" Enabled="true">
            </ajax:ModalPopupExtender>
            <%-- panel for the popup --%>
            <asp:Panel ID="pnlItemsPopup" Style="display: none" runat="server">
                <div class="popupItems">
                    <div class="PopupHeader" id="PopupHeader">
                        Invoice ID : 
                            <asp:Label ID="lblID" runat="server" />
                    </div>
                    <div class="PopupBody">
                        <asp:UpdatePanel ID="upGv" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>

                                <asp:Panel ID="gvWrapper" CssClass="r_gvWrapper" runat="server">

                                    <%-- gridview used for dispalying all the invoice items according to the invoice id --%>
                                    <asp:GridView ID="gvSubItems" runat="server" AutoGenerateColumns="False" CssClass="gvSubItems" DataKeyNames="ItemId">

                                        <Columns>
                                            <asp:TemplateField HeaderText="Item Name">
                                                <ItemTemplate>
                                                    <%#Eval("ItemName") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Item Cost">
                                                <ItemTemplate>
                                                    <%#Eval("ItemCost") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </ContentTemplate>

                        </asp:UpdatePanel>
                    </div>
                    <div class="Controls">
                        <asp:Button ID="btnOkay" Text="CLOSE" runat="server" />
                    </div>
                </div>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>

</asp:Content>

