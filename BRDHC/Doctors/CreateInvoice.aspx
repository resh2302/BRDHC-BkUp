<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/brdhc.master" CodeFile="CreateInvoice.aspx.cs" Inherits="Doctors_CreateInvoice" %>

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
        <asp:Panel ID="pnlDashboard" CssClass="pnlDashboard" runat="server">
            <asp:Panel ID="pnlContent" CssClass="pnlContent " runat="server">
                <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="statusMsg" />
                
                <ajax:TabContainer ID="tcInvoice" runat="server" ActiveTabIndex="1" OnDemand="true" TabStripPlacement="Top">
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
                                <asp:Button ID="btnInsert" runat="server" Text="CREATE INVOICE" OnClick="btnInsert_Click" />

                            </asp:Panel>
                            <asp:Panel ID="pnlAmount" GroupingText="Invoice Amount" runat="server">
                                <asp:Label ID="lblItemsQts" runat="server" Text="Would you like to add some invoice items?" />
                                <asp:RadioButtonList ID="rblItems" AutoPostBack="true" runat="server" OnSelectedIndexChanged="rblItems_SelectedIndexChanged">
                                    <asp:ListItem Text="Yes" Value="Yes" Selected="False" />
                                    <asp:ListItem Text="No" Value="No" Selected="False" />
                                </asp:RadioButtonList>
                                
                                        <asp:Panel ID="pnlItems" runat="server">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtItem" runat="server" CssClass="itemTxt" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCost" runat="server" CssClass="itemTxt" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnAddITem" runat="server" Text="+" CssClass="itemBtn" OnClick="btnAddITem_Click" />
                                            </td>
                                        </tr>
                                        <asp:UpdatePanel ID="upItems" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvItems" runat="server">
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
                                                            <td></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnAddITem" EventName="Click" />
                                            </Triggers>
                                </asp:UpdatePanel>
                                    </table>
                                </asp:Panel>
                                    
                                
                                <asp:Panel ID="pnlTotal" runat="server">
                                    <asp:Label ID="lblTotal" runat="server" Text="Total : " CssClass="infoLabel" />
                                    <asp:TextBox ID="txtTotal" runat="server" Text="" />
                                </asp:Panel>
                                <asp:Button ID="btnInsertAmount" runat="server" Text="Insert Amount" OnClick="btnInsertAmount_Click" />
                            </asp:Panel>
                        </ContentTemplate>
                    </ajax:TabPanel>
                    <ajax:TabPanel ID="tabView" runat="server" HeaderText="View Invoices">
                        <ContentTemplate>
                            <asp:Panel ID="pnlView" GroupingText="All Invoices" runat="server" CssClass="">
                                <asp:GridView ID="gvInvoices" runat="server" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="3">
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
                        </ContentTemplate>
                    </ajax:TabPanel>
                </ajax:TabContainer>



            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

