<%@ Page Language="C#" MasterPageFile="~/brdhc.master" ValidateRequest="false" Theme="HealthTools" AutoEventWireup="true" CodeFile="healthAlerts.aspx.cs" Inherits="Admin_healthAlerts" %>

<%-- AUTHOR:   JAGSIR SINGH --%>
<%-- This page is for the admin side.
    Admin can add, update, delete, publish the alerts and these alerts are saved into database and sent over emails of the users 
    A Free Text Box Editor is used on this page for the description of the alert.
    So admin can style the page--%>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../js/healthAlert.js"></script>
</asp:Content>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
        <div class="bootContainer">
            <asp:UpdatePanel ID="updPanel" runat="server">
                <ContentTemplate>

                    <%--REquired--%>
                    <asp:Label ID="lblErr" runat="server" Visible="false" CssClass="statusMsg" />
                    <br />
                    <asp:Panel ID="pnlDetails" GroupingText="Add New Alert" runat="server" CssClass="pnlLabel">

                        <div class="col-xs-12 col-sm-2 col-sm-offset-1">
                            <asp:Label ID="lblATitle" Text="Alert Title:" runat="server" CssClass="msFont11" />
                        </div>
                        <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txtATitle" runat="server" CssClass="msPadAll2 msMargRL10" Width="50%" />
                            <asp:RequiredFieldValidator ID="rfvATitle" runat="server" ControlToValidate="txtATitle" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpSave"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="col-xs-12 col-sm-2 col-sm-offset-1">
                            <asp:Label ID="lblDesc" Text="Alert Description:" runat="server" CssClass="msFont11" />
                        </div>
                        <div class="col-xs-12 col-sm-8">
                            <FTB:FreeTextBox ID="txtDesc" runat="server"  Width="100%" />
                            <%--<RTE:Editor ID="txtDesc" Text="Type here" runat="server" />--%>
                            <asp:RequiredFieldValidator ID="rfvDesc" Display="Static" runat="server" ControlToValidate="txtDesc" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpSave"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />

                        <div class="col-xs-12 col-sm-2 col-sm-offset-1">
                        </div>
                        <div class="col-xs-12 col-sm-8">
                            <asp:Button ID="btnSU" Text="Save" ValidationGroup="grpSave" runat="server" OnClick="subSaveUpdate" />
                            <asp:Button ID="btnPublish" Text="Publish" ValidationGroup="grpSave" runat="server" OnClick="subPublish" />
                            <asp:Button ID="btnCancel" Text="Cancel" CssClass="btnCancel" runat="server" OnClick="subToggleForm" CausesValidation="false" />
                        </div>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="pnlTable" runat="server">
                        <asp:Button ID="btnAdd" Text="New Alert" runat="server" OnClick="subToggleForm" CausesValidation="false" />
                        <br />
                        <br />
                        <asp:Panel ID="pnlAlertSearch" GroupingText="Alert Search" runat="server" CssClass="pnlLabel">
                            <div class="col-xs-12 col-sm-2 col-sm-offset-1">
                            <asp:Label ID="lblName" runat="server" AssociatedControlID="txtSearchName" Text="Search by Title" CssClass="msFont11"></asp:Label>
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txtSearchName" runat="server" CssClass="msPadAll2 msMargRL10" Width="50%"></asp:TextBox>
                                <asp:Button ID="btnAppSearch" runat="server" Text="Search" OnClick="subSearch" CausesValidation="false" />
                            </div>
                        </asp:Panel>

                        <div>
                            <asp:DataList ID="lstRecords" OnItemDataBound="lstRecords_ItemDataBound" runat="server" OnItemCommand="lstRecords_ItemCommand">
                                <ItemTemplate>
                                    <div class="alerts">
                                        <asp:HiddenField ID="hdfHealthAlertId" runat="server" Value='<%# Eval("HealthAlertId") %>' />
                                        <div class="titleAndDate">
                                            <asp:Label runat="server" ID="lblTitle" SkinID="title" Text='<%#Eval("HealthAlertTitle") %>' />
                                            (
                                        <asp:Label ID="lblDate" runat="server" SkinID="date" Text='<%#Eval("AlertDate") %>' />)
                                        </div>

                                        <div id="div_<%# Container.ItemIndex %>" class="hideDesc">
                                            <asp:Label ID="lblADesc" runat="server" Text='<%# Eval("HealthAlertDescription") %>'></asp:Label><br />
                                            <a id="GB_<%# Container.ItemIndex %>" href="#" onclick="javascript:switchViews('<%# Container.ItemIndex %>', 'close');return false;">Go Back</a>
                                        </div>

                                        <br />
                                        <div>
                                            <asp:Label runat="server" ForeColor="Black" ID="lblDescription" Text='<%#Eval("HealthAlertDescription") %>'>
                                            </asp:Label>
                                            <a id="RM_<%# Container.ItemIndex %>" href="#" onclick="javascript:switchViews('<%# Container.ItemIndex %>', 'show');return false;">Read More</a>
                                            <br />
                                        </div>
                                        <asp:Label ID="lblPublish" runat="server" Text='<%#Eval("Published") %>' /><br />
                                        <asp:Button ID="btnEdit" Text="Edit" runat="server" CommandName="editAlert" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClientClick="return confirm('Are you sure to delete?');" CommandName="delAlert" />
                                    </div>
                                    </div>

                                </ItemTemplate>
                            </asp:DataList>
                        </div>

                        <div class='form-group' style="margin: 30px; text-align: right;">
                            <div class='col-md-12 control-label'>
                            </div>
                        </div>
                    </asp:Panel>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
</asp:Content>
