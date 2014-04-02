<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/brdhc.master" CodeFile="CreateInvoice.aspx.cs" Inherits="Doctors_CreateInvoice" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <%--REquired--%>
    <asp:Panel ID="pnlContainer" style="display: inline-block;width: 79%;" runat="server">
    <asp:Panel ID="pnlHead" CssClass="pnlHead" runat="server">
        <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />
        <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />
    </asp:Panel>
    <asp:Panel ID="pnlDashboard" CssClass="pnlDashboard" runat="server">
        <asp:Panel ID="pnlContent" CssClass="pnlContent " runat="server">
            <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="statusMsg" />
            <%--REquired--%>
            <asp:Button ID="btn_create" runat="server" Text="NEW INVOICE"  />
            <%--<ajax:ModalPopupExtender ID="mpeCreate" runat="server" 
                TargetControlID="btn_create"
                PopupControlID="pnlAdd"
                OkControlID="OkButton"
                CancelControlID="CancelButton"
                OnOkScript="onOk()"
                >
            </ajax:ModalPopupExtender>--%>
            <asp:Panel ID="pnlAdd" GroupingText="Create Invoice" runat="server" CssClass="pnlSection">
                <div class="rm_leftBox">
                    
                    <asp:label ID="lblName" runat="server" Text="Patient Name : " CssClass="infoLabel" />
                    <asp:DropDownList ID="ddlInvoice" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlInvoice_SelectedIndexChanged" />
                    <br />
                    <asp:label ID="lblPatientID" runat="server" Text="PatientID : " CssClass="infoLabel" />
                    <asp:TextBox ID="txtPatientID" runat="server" Enabled="false" />
                    <br />
                    
                </div>
                <div class="rm_rightBox">
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
                    <asp:Label ID="lblTotal" runat="server" Text="Total : " CssClass="infoLabel" />
                    <asp:TextBox ID="txtTotal" runat="server" Text="" />
                </div>
                <div id="items">
                    <table>
                    <asp:GridView ID="gvItems" runat="server" >
                        <EmptyDataTemplate>
                            <tr>
                                <td> <asp:TextBox ID="txtItem" runat="server" /> </td>
                                <td> <asp:TextBox ID="txtCost" runat="server" /> </td>
                            </tr>
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%#Eval("Item") %>
                                        </td>
                                        <td>
                                            <%#Eval("ItemCost") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                        </table>
                </div>
                <div>
                    <asp:Button ID="btnInsert" runat="server" Text="CREATE INVOICE" OnClick="btnInsert_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlView" GroupingText="All Invoices" runat="server" CssClass="pnlEmergencyCurrent">
                <asp:GridView ID="gvInvoices" runat="server" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="5" >
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                
                                <%#Eval("InvoiceID") %>
                                <%#Eval("PatientID") %>
                                <%#Eval("CreatedOn") %>
                                <%#Eval("TotalAmt") %>
                                <%#Eval("CreatedBy") %>
                                <%#Eval("Reason") %>
                                <%#Eval("Status") %>
                                <%#Eval("DueOn") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
        </asp:Panel>
</asp:Content>

