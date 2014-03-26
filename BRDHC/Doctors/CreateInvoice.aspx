<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/brdhc.master" CodeFile="CreateInvoice.aspx.cs" Inherits="Doctors_CreateInvoice" %>

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
        <asp:Panel ID="pnlContent" CssClass="pnlContent " runat="server">
            <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="statusMsg" />
            <%--REquired--%>
            <asp:Panel ID="pnlAdd" GroupingText="Create Invoice" runat="server" CssClass="pnlSection">
                <asp:TextBox ID="txtHrs" Text="00" CssClass="" runat="server" />
                <%-- Add validation --%>
                <asp:Label ID="lblPatientName" Text="Select Patient " CssClass="lbl" runat="server" />
                <asp:DropDownList ID="ddlPatients" runat="server" />
                <%-- Add validation --%>
                <asp:Label ID="lblMinA" Text="min" CssClass="lbl" runat="server" />
                <br />

                <asp:Button ID="btnAdd" Text="Add" runat="server" CommandName="Insert" OnCommand="subAdmin" />
                <asp:Button ID="btnCancel" Text="Cancel" CssClass="btnCancel" runat="server" CommandName="Cancel" OnCommand="subAdmin" CausesValidation="false" />
                <br />
            </asp:Panel>
            <asp:Panel ID="pnlView" GroupingText="Current Wait Time" runat="server" CssClass="pnlEmergencyCurrent">
                <asp:Repeater ID="rptCurrent" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="lblCurrentTime" Text='<%#Eval("WaitTime") %>' CssClass="lblWaitTime" runat="server" />
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>

</asp:Content>

