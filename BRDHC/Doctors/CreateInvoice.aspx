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
                <asp:UpdatePanel ID="upInvoice" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>


                        <ajax:TabContainer ID="tcInvoice" runat="server" ActiveTabIndex="0" OnDemand="true" TabStripPlacement="Top">
                            <ajax:TabPanel ID="tabCreate" runat="server" HeaderText="Create Invoice" OnDemandMode="Always">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlAdd" GroupingText="Invoice Info" runat="server" CssClass="pnlSection">

                                        <asp:Label ID="lblName" runat="server" Text="Patient Name : " CssClass="infoLabel" />
                                        <asp:DropDownList ID="ddlInvoice" runat="server" AutoPostBack="true" ValidationGroup="vgInsert" OnSelectedIndexChanged="ddlInvoice_SelectedIndexChanged" />
                                        <br />
                                        <asp:Label ID="lblPatientID" runat="server" Text="PatientID : " CssClass="infoLabel" />
                                        <asp:TextBox ID="txtPatientID" runat="server" Enabled="false" />
                                        <asp:RequiredFieldValidator ID="rfvPID" ControlToValidate="txtPatientID" Text="*Please Select Patient Name" Display="Static" runat="server" ValidationGroup="vgInsert" />
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
                                        <asp:RequiredFieldValidator ControlToValidate="txtDueDate" Text="*Please select due date" runat="server" Display="Static" SetFocusOnError="true" ValidationGroup="vgInsert" />
                                        <br />
                                        <asp:Label ID="lblCreatedBy" runat="server" Text="Created By : " CssClass="infoLabel" />
                                        <asp:TextBox ID="txtCreatedBy" runat="server" Enabled="false" />
                                        <br />

                                    </asp:Panel>
                                    <asp:Panel ID="pnlAmount" GroupingText="Invoice Items" runat="server">
                                        <asp:Panel ID="pnlItems" runat="server">

                                            <asp:GridView ID="gvItems" CssClass="r_gvItems" runat="server" ShowFooter="true" OnRowDeleting="gvItems_RowDeleting" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Item Number" DataField="ItemNumber" />
                                                    <asp:TemplateField HeaderText="Description">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtItem" runat="server" />
                                                            <asp:RequiredFieldValidator ID="rfvItemDesc" ControlToValidate="txtItem" Text="*Please enter item description" Display="Static" SetFocusOnError="true" runat="server" ValidationGroup="vgItem" />
                                                            <asp:RequiredFieldValidator ID="rfvDesc" ControlToValidate="txtItem" Text="*Please enter item description" Display="Static" SetFocusOnError="true" runat="server" ValidationGroup="vgInsert" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Charges">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtCost" runat="server" Text="" />
                                                            <asp:RequiredFieldValidator ID="rfvItemCost" ControlToValidate="txtCost" Text="*Please enter cost" Display="Static" SetFocusOnError="true" runat="server" ValidationGroup="vgItem" />
                                                            <asp:RequiredFieldValidator ID="rfvCost" ControlToValidate="txtCost" Text="*Please enter cost" Display="Static" SetFocusOnError="true" runat="server" ValidationGroup="vgInsert" />
                                                            <asp:RegularExpressionValidator ID="revICost" ControlToValidate="txtCost" Display="Static" Text="*Please eneter cost in one of these formats: 0 or 0.0" SetFocusOnError="true" runat="server" ValidationGroup="vgItem"/>
                                                             <asp:RegularExpressionValidator ID="revItemCost" ControlToValidate="txtCost" Display="Static" Text="*Please eneter cost in one of these formats: 0 or 0.0" SetFocusOnError="true" runat="server" ValidationGroup="vgInsert"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkRemove" Text="Remove" CssClass="lnk" runat="server" CausesValidation="false" CommandName="Delete" />
                                                        </ItemTemplate>
                                                        <FooterStyle HorizontalAlign="NotSet" />
                                                        <FooterTemplate>
                                                            <asp:LinkButton ID="btnAddITem" runat="server" CssClass="lnk" Text="Add Item" CausesValidation="true" ValidationGroup="vgItem" OnClick="btnAddITem_Click" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </asp:Panel>


                                        <asp:Panel ID="pnlTotal" runat="server" CssClass="r_pnlTotal" GroupingText="Invoice Total">
                                            <asp:Label ID="lblTotal" runat="server" Text="Total: " CssClass="infoLabel" />
                                            <asp:TextBox ID="txtTotal" runat="server" Enabled="false" Text="00.00" />
                                            <asp:RequiredFieldValidator ID="rfvTotal" ControlToValidate="txtTotal" Text="*Please click on GET TOTAL" ValidationGroup="vgInsert" runat="server" />
                                            <asp:Button Text="Get Total" runat="server" ID="btnTotal" OnClick="btnTotal_Click" />
                                        </asp:Panel>
                                        <asp:Button ID="btnInsert" runat="server" Text="CREATE INVOICE" OnClick="btnInsert_Click" ValidationGroup="vgInsert" />
                                    </asp:Panel>
                                </ContentTemplate>
                            </ajax:TabPanel>

                            <ajax:TabPanel ID="tabPending" runat="server" HeaderText="Pending Invoices" OnDemandMode="Always">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlView" CssClass="ovScroll" GroupingText="All Invoices" runat="server">

                                        <asp:GridView ID="gvPending" DataKeyNames="InvoiceID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvPending_PageIndexChanging" OnRowCommand="gvPending_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Invoice ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblID" Text='<%#Eval("InvoiceID") %>' runat="server" />
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
                                                        <asp:TextBox ID="txtDueDate" runat="server" Text='<%#Eval("DueOn", "{0:d}") %>' />
                                                        <asp:RequiredFieldValidator ID="rfvDate" Text="*Please select due date" ControlToValidate="txtDueDate" SetFocusOnError="true" Display="Static" runat="server" />
                                                        <ajax:CalendarExtender
                                                            ID="ceDueDate"
                                                            TargetControlID="txtDueDate"
                                                            runat="server" />                                                        
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
                                                        <asp:LinkButton ID="lnkItems" Text="View Items" runat="server" OnClick="lnkItems_Click" CommandArgument="0" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Update Due Date">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="update" CommandArgument='<%# Container.DataItemIndex %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Delete Invoice">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btDelete" runat="server" Text="DElete" CommandName="delete" CommandArgument='<%# Container.DataItemIndex %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </asp:Panel>
                                </ContentTemplate>
                            </ajax:TabPanel>

                            <ajax:TabPanel ID="tabPaid" runat="server" HeaderText="Paid Invoices" OnDemandMode="Always">
                                <ContentTemplate>
                                    <asp:GridView ID="gvPaid" DataKeyNames="InvoiceID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvPaid_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Invoice ID">
                                                <ItemTemplate>
                                                    <%#Eval("InvoiceID") %>
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
                                                    <asp:LinkButton ID="lnkItems" OnClick="lnkItems_Click1" Text="View Items" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                            </ajax:TabPanel>

                        </ajax:TabContainer>

                    </ContentTemplate>
                </asp:UpdatePanel>

                <%-- Modal --%>
                <asp:UpdatePanel ID="upMain" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%-- This invisible button is for the modal's targetcontrolId but the modal will actually be triggered through #lnkItems  --%>
                        <asp:Button ID="btnInvisible" runat="server" Style="display: none" />

                        <ajax:ModalPopupExtender ID="mpeItems" runat="server"
                            OkControlID="btnOkay"
                            TargetControlID="btnInvisible" PopupControlID="pnlItemsPopup"
                            PopupDragHandleControlID="PopupHeader" Drag="true"
                            BackgroundCssClass="ModalPopupBG" Enabled="true">
                        </ajax:ModalPopupExtender>

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


                                                <asp:GridView ID="gvSubItems" runat="server" AutoGenerateColumns="False" OnRowCommand="gvSubItems_RowCommand" CssClass="gvSubItems" DataKeyNames="ItemId">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Item Name">
                                                            <ItemTemplate>
                                                                <asp:HiddenField ID="hdfItemID" runat="server" Value='<%#Eval("ItemId") %>' />
                                                                <asp:HiddenField ID="hdfInvID" runat="server" Value='<%#Eval("InvoiceID") %>' />

                                                                <asp:TextBox ID="txtIName" runat="server" Text='<%#Eval("ItemName") %>' />
                                                                <asp:RequiredFieldValidator ID="rfvDesc" ControlToValidate="txtIName" Text="*Please enter item description" Display="Static" SetFocusOnError="true" runat="server" ValidationGroup="vgItemupdate" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Item Cost">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtICost" runat="server" Text='<%#Eval("ItemCost") %>' />
                                                                <asp:RequiredFieldValidator ID="rfvCost" ControlToValidate="txtICost" Text="*Please enter cost" Display="Static" SetFocusOnError="true" runat="server" ValidationGroup="vgItemupdate" />
                                                                <asp:RegularExpressionValidator ID="revCost" ControlToValidate="txtCost" Display="Static" Text="*Please eneter cost in one of these formats: 0 or 0.0" SetFocusOnError="true" runat="server" ValidationGroup="vgItemupdate" />
                                                                <%-- validation for number format --%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Button ID="btnUpItem" runat="server" Text="Update" ValidationGroup="vgItemupdate" CommandArgument='<%# Container.DataItemIndex %>' CommandName="update" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Button ID="btnDelItem" runat="server" Text="Delete" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex %>' CommandName="delete" />
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
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnInvisible" />
                    </Triggers>
                </asp:UpdatePanel>

            </asp:Panel>
        </asp:Panel>
    </asp:Panel>


</asp:Content>

