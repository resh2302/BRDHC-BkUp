<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" Theme="Theme" AutoEventWireup="true" CodeFile="healthAlerts.aspx.cs" Inherits="Admin_healthAlerts" %>

<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ MasterType VirtualPath="~/brdhc.master" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
        <link href="../styles/healthAlerts.css" rel="stylesheet" />
        <script type="text/javascript" src="../js/healthAlert.js"></script>

        <asp:UpdatePanel ID="updPanel" runat="server">
            <ContentTemplate>

                <%--REquired--%>
                <asp:Label ID="lblErr" runat="server" Visible="false" CssClass="statusMsg" />
                <br />
                <asp:Panel ID="pnlDetails" GroupingText="Add New Alert" runat="server" CssClass="pnlLabel">

                    <asp:Label ID="lblATitle" Text="Alert Title:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtATitle" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvATitle" runat="server" ControlToValidate="txtATitle" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpSave"></asp:RequiredFieldValidator>
                    <br />
                    <br />

                    <asp:Label ID="lblDesc" Text="Alert Description" runat="server" CssClass="infoLabel" />
                    <FTB:FreeTextBox ID="txtDesc" runat="server" />
                    <%--<RTE:Editor ID="txtDesc" Text="Type here" runat="server" />--%>
                    <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="txtDesc" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpSave"></asp:RequiredFieldValidator>
                    <br />
                    <br />

                    <asp:Button ID="btnSU" Text="Save" ValidationGroup="grpSave" runat="server" OnClick="subSaveUpdate" />
                    <asp:Button ID="btnPublish" Text="Publish" ValidationGroup="grpSave" runat="server" OnClick="subPublish" />
                    <asp:Button ID="btnCancel" Text="Cancel" CssClass="btnCancel" runat="server" OnClick="subToggleForm" CausesValidation="false" />
                </asp:Panel>
                <br />
                <asp:Panel ID="pnlTable" runat="server">
                    <asp:Button ID="btnAdd" Text="New Alert" runat="server" OnClick="subToggleForm" CausesValidation="false" />
                    <br />
                    <br />
                    <asp:Panel ID="pnlAlertSearch" GroupingText="Alert Search" runat="server" CssClass="pnlLabel">
                        <asp:Label ID="lblName" runat="server" AssociatedControlID="txtSearchName" Text="Search by Title" CssClass="infoLabel"></asp:Label>
                        <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox><asp:Button ID="btnAppSearch" runat="server" Text="Search" OnClick="subSearch" CausesValidation="false" />
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
                                    <asp:Label runat="server" ID="lblDescription" Text='<%#Eval("HealthAlertDescription") %>'>
                                    </asp:Label>
                                    <div id="div<%# Container.ItemIndex %>" class="hideDesc">
                                        <asp:Label ID="lblADesc" runat="server" Text='<%# Eval("HealthAlertDescription") %>'></asp:Label><br />
                                        <input type="submit" name='tmpDialogueClose' value='Close Dialogue' id="tmpDialogueClose" />
                                    </div>
                                    <br />
                                    <a href="javascript:switchViews('div<%# Container.ItemIndex %>', 'one');">Show Details</a>
                                    <%--<asp:LinkButton ID="lbtnMore" OnClientClick='javascript:switchViews("div<%# Container.ItemIndex %>","one"); return false;' runat="server">Read More</asp:LinkButton>--%>
                                    <br />
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
                            <%--<asp:DataPager ID="dpRecords" runat="server" PagedControlID="lstRecords"
                                PageSize="4" OnPreRender="dpRecords_PreRender">
                                <Fields>
                                    <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>--%>
                        </div>
                    </div>
                </asp:Panel>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

