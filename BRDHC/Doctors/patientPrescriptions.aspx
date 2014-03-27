<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="patientPrescriptions.aspx.cs" Inherits="Doctors_patientPrescriptions" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">

    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">

        <asp:Label ID="lblErr" runat="server" Visible="false" CssClass="statusMsg" />
        <br />
        <asp:Panel ID="pnlDetails" GroupingText="New Prescription" runat="server" CssClass="pnlLabel">
            <asp:Panel ID="pnlSearch" runat="server" CssClass="pnlLabel">
                <asp:Label ID="lblSearch" runat="server" AssociatedControlID="txtSearch" Text="Search for Patient" CssClass="infoLabel"></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="false" />
            </asp:Panel>
            <br />
            <br />

            <asp:Label ID="lblPName" Text="Patient Name:" runat="server" CssClass="infoLabel" />
            <asp:TextBox ID="txtPName" Enabled="false" runat="server" />
            <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtPName" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpApp"></asp:RequiredFieldValidator>
            <br />
            <br />

            <br />
            <br />
            <asp:Button ID="btnSU" Text="Save" ValidationGroup="grpPres" runat="server" />
            <asp:Button ID="btnCancel" Text="Cancel" CssClass="btnCancel" runat="server" CausesValidation="false" />
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlTable" CssClass="pnlTable table-responsive" runat="server">
            <asp:Button ID="btnNewPres" Text="New Prescription" runat="server" CausesValidation="false" />
            <br />
            <br />
            <asp:Panel ID="pnlAppSearch" GroupingText="Apppointment Search" runat="server" CssClass="pnlLabel">
                <asp:Panel ID="pnlSearchPres" runat="server" CssClass="pnlLabel">
                    <asp:Label ID="lblName" runat="server" AssociatedControlID="txtSearchPres" Text="Search by Patient" CssClass="infoLabel"></asp:Label>
                    <asp:TextBox ID="txtSearchPres" runat="server"></asp:TextBox><asp:Button ID="btnPresSearch" runat="server" Text="Search" CausesValidation="false"/>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
        <br />
    </asp:Panel>
</asp:Content>

