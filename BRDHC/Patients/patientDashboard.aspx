<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="patientDashboard.aspx.cs" Inherits="Patients_patientDashboard" %>

<%@ Register Src="~/Patients/patientLeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc" %>
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
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">
        <%--REquired--%>
        <asp:Panel ID="pnlHead" runat="server">
            <%--REquired--%>
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" Text="PATIENT DASHBOARD : MY PROFILE" />
            <%--REquired--%>
            <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />
            <%--REquired--%>
            <%-- Problem: button goes outside container --%>
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" runat="server">
            <%--REquired--%>
            <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server">
                <%--REquired--%>
                <uc:LeftMenu ID="left_menu" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
                <%--REquired--%>
                <asp:Panel ID="pnlDetails" GroupingText="Personal Info" runat="server" CssClass="pnlLabel">
                    <asp:Label ID="lblID" Text="Patient ID:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtID" Text="ID" Enabled="false" runat="server" />

                    <br />
                    <asp:Label ID="lblName" Text="Name:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtName" Text="PatientName" runat="server" />
                    <%-- Add validation --%>
                    <br />
                    <asp:Label ID="lblContact" Text="Contact No.:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtContact" Text="ContactNo" runat="server" />
                    <%-- Add validation --%>
                    <br />
                    <asp:Label ID="lblEmail" Text="Email ID:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtEmail" Text="Email" Enabled="false" runat="server" />
                    <br />
                    <asp:Label ID="lblHNo" Text="Health Card #:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtHNo" Text="Health Card #" runat="server" />

                    <br />
                    <br />
                    <asp:Button ID="btnUpdate" Text="Update" runat="server" />
                    <asp:Button ID="btnCancel" Text="Cancel" CssClass="btnCancel" runat="server" CausesValidation="false" />
                </asp:Panel>
                <br />
                <asp:Panel ID="pnlPwd" GroupingText="Change Password" runat="server" CssClass="pnlPwdLabel">
                    <asp:ChangePassword LabelStyle-CssClass="passLabel" TextBoxStyle-CssClass="passBox" ID="cp" runat="server" ContinueDestinationPageUrl="~/TemplateDashboard/Dashboard.aspx" CancelDestinationPageUrl="~/TemplateDashboard/Dashboard.aspx" ChangePasswordTitleText="" SuccessText="Password changed successfully!" ChangePasswordFailureText="Password could not be changed" CancelButtonStyle-CssClass="btnCancel" RenderOuterTable="False" />
                </asp:Panel>
                <br />
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

