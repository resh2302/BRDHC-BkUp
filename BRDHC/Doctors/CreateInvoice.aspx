<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/brdhc.master" CodeFile="CreateInvoice.aspx.cs" Inherits="Doctors_CreateInvoice" Theme="Theme" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <%--REquired--%>
    <asp:Panel ID="pnlContainer" Style="display: inline-block; width: 79%;" runat="server">

        <asp:Panel ID="pnlHead" CssClass="pnlHead" runat="server">

            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />
            <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" CssClass="pnlDashboard fullWidth" runat="server">
            <asp:Panel ID="pnlContent" CssClass="pnlContent fullWidth " runat="server">
                <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="statusMsg" />

                <ajax:TabContainer ID="tcInvoice" runat="server" ActiveTabIndex="0" OnDemand="true" TabStripPlacement="Top">
                    <ajax:TabPanel ID="tabCreate" runat="server" HeaderText="Create Invoice" OnDemandMode="Once">
                        <ContentTemplate>
                            <asp:Panel ID="pnlAdd" GroupingText="Invoice Info" runat="server" CssClass="pnlSection">

                                <asp:Label ID="lblName" runat="server" Text="Patient Name : " CssClass="infoLabel" />
                                <asp:DropDownList ID="ddlInvoice" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlInvoice_SelectedIndexChanged" />
                                <br />
                                <asp:Label ID="lblPatientID" runat="server" Text="PatientID : " CssClass="infoLabel" />
                                <asp:TextBox ID="txtPatientID" runat="server" Enabled="false" />
                                <br />

                                <asp:Label ID="lblInvDate" runat="server" Text="Created On : " CssClass="infoLabel" />
                                <asp:TextBox ID="txtInvDate" runat="server" Enabled="false" />
                                <br />
                                <asp:Label ID="lblDueDate" runat="server" Text="Due On : " CssClass="infoLabel" />
                                <asp:TextBox ID="txtDueDate" runat="server" />
                                <ajax:CalendarExtender
                                    ID="ceDueDate"
                                    TargetControlID="txtDueDate"
                                    runat="server" />
                                <br />
                                <asp:Label ID="lblCreatedBy" runat="server" Text="Created By : " CssClass="infoLabel" />
                                <asp:TextBox ID="txtCreatedBy" runat="server" Enabled="false" />

                                <br />

                            </asp:Panel>
                            <asp:Panel ID="pnlAmount" GroupingText="Invoice Items" runat="server">
                                <asp:Panel ID="pnlItems" runat="server">
                                    <asp:GridView ID="gvItems" CssClass="r_gvItems" runat="server" ShowFooter="true" OnRowDataBound="gvItems_RowDataBound" OnRowDeleting="gvItems_RowDeleting" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField HeaderText="Item Number" DataField="ItemNumber" />
                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtItem" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Charges">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtCost" runat="server" Text="00.00" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkRemove" Text="Remove" CssClass="lnk" runat="server" CommandName="Delete" />
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="NotSet" />
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="btnAddITem" runat="server" CssClass="lnk" Text="Add Item" OnClick="btnAddITem_Click" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>


                                <asp:Panel ID="pnlTotal" runat="server" GroupingText="Invoice Total">
                                    <asp:Label ID="lblTotal" runat="server" Text="Total: " CssClass="infoLabel" />
                                    <asp:TextBox ID="txtTotal" runat="server" Enabled="false" Text="00.00" />
                                    <asp:Button Text="Get Total" runat="server" ID="btnTotal" OnClick="btnTotal_Click" />
                                </asp:Panel>
                                <asp:Button ID="btnInsert" runat="server" Text="CREATE INVOICE" OnClick="btnInsert_Click" />
                            </asp:Panel>
                        </ContentTemplate>
                    </ajax:TabPanel>

                    <ajax:TabPanel ID="tabPending" runat="server" HeaderText="Pending Invoices">
                        <ContentTemplate>
                            <asp:Panel ID="pnlView" GroupingText="All Invoices" runat="server">
                                <asp:GridView ID="gvPending" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvInvoices_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Invoice ID">
                                            <ItemTemplate>
                                                <%#Eval("InvoiceID") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Patient Name">
                                            <ItemTemplate>
                                                <%#Eval("PatientName") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Created On">
                                            <ItemTemplate>
                                                <%#Eval("CreatedOn") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Created By">
                                            <ItemTemplate>
                                                <%#Eval("CreatedBy") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Due On">
                                            <ItemTemplate>
                                                <%#Eval("DueOn") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status (Remove this)">
                                            <ItemTemplate>
                                                <%#Eval("Status") %>
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
                                                <ajax:ModalPopupExtender ID="mpeItems" runat="server"
                                                    CancelControlID="btnCancel" OkControlID="btnOkay"
                                                    TargetControlID="lnkItems" PopupControlID="pnlItemsPopup"
                                                    PopupDragHandleControlID="PopupHeader" Drag="true"
                                                    BackgroundCssClass="ModalPopupBG">
                                                </ajax:ModalPopupExtender>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </ContentTemplate>
                    </ajax:TabPanel>

                    <ajax:TabPanel ID="tabPaid" runat="server" HeaderText="Paid Invoices">
                        <ContentTemplate>
                            <asp:GridView ID="gvPaid" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvInvoices_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="Invoice ID">
                                        <ItemTemplate>
                                            <%#Eval("InvoiceID") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Patient Name">
                                        <ItemTemplate>
                                            <%#Eval("PatientName") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created On">
                                        <ItemTemplate>
                                            <%#Eval("CreatedOn") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created By">
                                        <ItemTemplate>
                                            <%#Eval("CreatedBy") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due On">
                                        <ItemTemplate>
                                            <%#Eval("DueOn") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status (Remove this)">
                                        <ItemTemplate>
                                            <%#Eval("Status") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total Amount">
                                        <ItemTemplate>
                                            <%#Eval("TotalAmt") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                                    <asp:TemplateField HeaderText="View Items">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkItems" Text="View Items" CommandArgument='<%#Eval("InvoiceID") %>' runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </ajax:TabPanel>
                </ajax:TabContainer>

            </asp:Panel>
        </asp:Panel>
    </asp:Panel>

    <%-- Modal --%>
    <asp:Panel ID="pnlItemsPopup" Style="display: none" runat="server">
        <div class="popupItems">
            <div class="PopupHeader" id="PopupHeader">
                Invoice ID :
                                                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("InvoiceID") %>' />
            </div>
            <div class="PopupBody">

                <asp:GridView ID="gvSubItems" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="3" OnPageIndexChanging="gvSubItems_PageIndexChanging">
                    <%--add page index thing--%>
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

            </div>
            <div class="Controls">
                <input id="btnOkay" type="button" value="Done" />
                <input id="btnCancel" type="button" value="Cancel" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>

