<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="patientPrescriptions.aspx.cs" Inherits="Doctors_patientPrescriptions" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <script type="text/javascript" src="../js/prescriptions.js"></script>
    <link rel="stylesheet" href="../styles/patientPrescriptions.css" />
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">

            <asp:Label ID="lblErr" runat="server" Visible="false" CssClass="statusMsg" />
            <br />
            <asp:Panel ID="pnlDetails" GroupingText="New Prescription" runat="server" CssClass="pnlLabel">
                <asp:Panel ID="pnlSearch" runat="server" CssClass="pnlLabel">
                    <asp:Label ID="lblSearch" runat="server" AssociatedControlID="txtSearch" Text="Appointment Id" CssClass="infoLabel"></asp:Label>
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="Search" />
                </asp:Panel>
                <br />

                <asp:HiddenField ID="hdfPresId" runat="server" />

                <asp:Label ID="lblHCard" Text="Patient Health Card:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txtHCard" Enabled="false" runat="server" />
                <asp:RequiredFieldValidator ID="rfvHCard" runat="server" ControlToValidate="txtHCard" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpPres"></asp:RequiredFieldValidator>
                <br />

                <asp:Label ID="lblPName" Text="Patient Name:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txtPName" Enabled="false" runat="server" />
                <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtPName" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpPres"></asp:RequiredFieldValidator>
                <br />

                <asp:Label ID="lblDName" Text="Doctor Name:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txtDName" Enabled="false" runat="server" />
                <asp:RequiredFieldValidator ID="rfvDName" runat="server" ControlToValidate="txtDName" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpPres"></asp:RequiredFieldValidator>
                <br />

                <asp:Label ID="lblRepeat" Text="Repeat:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txtRepeat" runat="server" />
                <asp:RequiredFieldValidator ID="rfvRepeat" runat="server" ControlToValidate="txtRepeat" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpPres"></asp:RequiredFieldValidator>
                <br />

                <asp:Label ID="lblDate" Text="Prescription Date:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txtDate" runat="server" />
                <ajax:CalendarExtender ID="calDate" FirstDayOfWeek="Sunday" EnableViewState="true" Format="yyyy-MM-dd" TargetControlID="txtDate" runat="server"></ajax:CalendarExtender>
                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpPres"></asp:RequiredFieldValidator>
                <br />
                <br />
                <table id="tblMedDetail" style="width: 80%; border: 1px solid black;">
                    <tr>
                        <td style="padding: 10px; text-align: right;">
                            <asp:Button ID="btnAddMed" runat="server" Text="Add Medicine" />
                        </td>
                    </tr>
                </table>
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
                        <asp:TextBox ID="txtSearchPres" runat="server"></asp:TextBox><asp:Button ID="btnPresSearch" runat="server" Text="Search" CausesValidation="false" />
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>
            <br />
    </asp:Panel>
</asp:Content>

