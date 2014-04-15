﻿<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="EmergencyViewAll.aspx.cs" Inherits="ViewAll" %>

<%--<%@ Register TagName="EmergencyMenu" TagPrefix="uc" Src="~/EmergencyAdmin/EmergencyMenu.ascx" %>--%>
<%@ MasterType VirtualPath="~/brdhc.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

    <script type="text/javascript"> /* Make this user control */
        $(document).ready(function () {
            console.log("Script loaded");
            $('.dashboardMenuBtn').click(function (e) {
                e.preventDefault();
                $('.pnlLeftMenu').toggleClass('active');
            });
        });
    </script>
    <asp:Panel ID="pnlContainer" style="display: inline-block;width: 79%;" runat="server">
        <%--REquired--%>
        <asp:Panel ID="pnlHead" runat="server">
            <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />
            <%--REquired--%>
            <%-- Problem: button goes outside container --%>
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" runat="server">
            <%--REquired--%>
            <asp:Panel ID="pnlContent" CssClass="pnlContent pnlEmergencyUpdate" runat="server">
                <%--REquired--%>
                <asp:Label ID="lblStatus" CssClass="statusMsg" runat="server" Visible="false" />
                <asp:Panel ID="pnlDetails" runat="server">
                    <asp:Panel ID="pnlAllRecords" GroupingText="Wait Time Records" runat="server">
                        <table class="emergencyTable">
                            <thead>
                                <tr>
                                    <th>
                                        <asp:Label ID="lblTime" runat="server" Text="Time" />
                                    </th>
                                    <th>
                                        <asp:Label ID="lblDate" runat="server" Text="Added On" />
                                    </th>
                                    <th>
                                        <asp:Label ID="lblUpdateBy" runat="server" Text="Updated By" />
                                    </th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptAllRecords" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblGetTime" Text='<%#Eval("WaitTime") %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblGetDate" Text='<%#Eval("AddedOn") %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblGetBy" Text='<%#Eval("UpdatedBy") %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnUpdate" Text="Edit" CssClass="greenBtn" CommandName="Update" OnCommand="subAction" CommandArgument='<%#Eval("EmergencyID") %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnDelete" Text="Delete" CssClass="redBtn" CommandName="Delete" OnCommand="subAction" CommandArgument='<%#Eval("EmergencyID") %>' OnClientClick="return confirm('Confirm Delete?');" runat="server" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlEdit" runat="server" GroupingText="Update Wait Time Record" Visible="false">
                        <asp:Repeater ID="rptUpdate" runat="server" OnItemCommand="subEdit" OnItemDataBound="subItemData">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdfIDU" runat="server" Value='<%#Eval("EmergencyID") %>' />
                                
                                <%-- hdfWaitTimeU is used to retrieve the WaitTime and break it into hrs and min in the code behind --%>
                                <asp:HiddenField ID="hdfWaitTimeU" Value='<%#Eval("WaitTime") %>' runat="server" />

                                <asp:Label ID="lblTimeU" Text="Wait Time:" runat="server" CssClass="infoLabel" />
                                <asp:TextBox ID="txtHrsU"  runat="server"  CssClass="txtEmergencyU" /> hrs
                               
                                <asp:TextBox ID="txtMinU" runat="server" CssClass="txtEmergencyU minU" /> min                               
                                <br />
                                

                                <asp:Label ID="lblDateU" Text="Added On:" runat="server" CssClass="infoLabel" />
                                <asp:TextBox ID="txtDateU" Text='<%#Eval("AddedOn") %>' Enabled="false" runat="server" />
                                <%-- Add validation --%>
                                <br />
                                <asp:Label ID="lblUpdatedBy" Text="Updated By:" runat="server" CssClass="infoLabel" />
                                <asp:TextBox ID="txtUpdatedBy" Text='<%#Eval("UpdatedBy") %>' Enabled="false" runat="server" />
                                <br />
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="false" CssClass="btnCancel" />
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>  
                </asp:Panel>

            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
