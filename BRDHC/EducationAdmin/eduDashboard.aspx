<%@ Page Language="C#" MasterPageFile="~/brdhc.master"  AutoEventWireup="true" CodeFile="eduDashboard.aspx.cs" Inherits="EducationAdmin_eduDashboard" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server"> <%--REquired--%>
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

</asp:Content>
