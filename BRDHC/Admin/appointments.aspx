<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" Theme="Theme" AutoEventWireup="true" CodeFile="appointments.aspx.cs" Inherits="Admin_appointments" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
        <asp:UpdatePanel ID="upTime" runat="server">
            <ContentTemplate>

                <%--REquired--%>
                <asp:Label ID="lblErr" runat="server" Visible="false" CssClass="statusMsg" />
                <br />
                <asp:Panel ID="pnlDetails" GroupingText="Book New Appointment" runat="server" CssClass="pnlLabel">
                    <asp:Panel ID="pnlSearch" runat="server" CssClass="pnlLabel">
                        <asp:Label ID="lblSearch" runat="server" AssociatedControlID="txtSearch" Text="Search for Patient" CssClass="infoLabel"></asp:Label>
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="false" OnClick="subGetPatient" />
                    </asp:Panel>
                    <br />
                    <br />

                    <asp:Label ID="lblPName" Text="Patient Name:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtPName" Enabled="false" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtPName" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpApp"></asp:RequiredFieldValidator>
                    <br />
                    <br />

                    <asp:Label ID="lblDName" Text="Doctor Name:" runat="server" CssClass="infoLabel" />
                    <asp:DropDownList ID="ddlDoctor" AutoPostBack="true" OnSelectedIndexChanged="subChangeDoc" runat="server" />
                    <%-- Add validation --%>
                    <br />
                    <br />

                    <asp:Label ID="lblReason" Text="Reason" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtReason" TextMode="MultiLine" Columns="20" Rows="5" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvReason" runat="server" ControlToValidate="txtReason" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpApp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="revReason"
                        runat="server"
                        ErrorMessage="only characters allowed"
                        ControlToValidate="txtReason"
                        ValidationExpression="^[a-zA-Z0-9 .]*$" ValidationGroup="grpApp"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblDate" Text="Appointment Date:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txtDate" runat="server" AutoPostBack="true" OnTextChanged="txtDate_TextChanged" onkeypress="return false;" />
                    <ajax:CalendarExtender ID="calDate" FirstDayOfWeek="Monday" EnableViewState="true" PopupPosition="BottomRight" Format="yyyy-MM-dd" TargetControlID="txtDate" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                    &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Appointment Date" />
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpApp"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblTime" Text="Appointment Time:" runat="server" CssClass="infoLabel" />
                    <asp:DropDownList runat="server" ID="ddlTimes"></asp:DropDownList>

                    <br />
                    <br />
                    <asp:Button ID="btnSU" Text="Save" ValidationGroup="grpApp" runat="server" OnClick="subBookApp" />
                    <asp:Button ID="btnCancel" Text="Cancel" CssClass="btnCancel" runat="server" OnClick="subToggleForm" CausesValidation="false" />
                </asp:Panel>
                <br />
                <asp:Panel ID="pnlTable" CssClass="pnlTable table-responsive" runat="server">
                    <asp:Button ID="brnBookNewApp" Text="Book An Appointment" runat="server" OnClick="subToggleForm" CausesValidation="false" />
                    <br />
                    <br />
                    <asp:Panel ID="pnlAppSearch" GroupingText="Apppointment Search" runat="server" CssClass="pnlLabel">
                        <asp:Panel ID="pnlSearchApp" runat="server" CssClass="pnlLabel">
                            <asp:Label ID="lblName" runat="server" AssociatedControlID="txtSearchName" Text="Search by Patient" CssClass="infoLabel"></asp:Label>
                            <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox><asp:Button ID="btnAppSearch" runat="server" Text="Search" CausesValidation="false" OnClick="subSearchAppointments" />
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Repeater ID="rptApp" runat="server" OnItemCommand="subCommands">
                        <HeaderTemplate>
                            <table class="appTable">
                                <thead>
                                    <tr>
                                        <th>Doctor Name</th>
                                        <th>Patient Name</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Reason</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDName" runat="server" Text='<%#Eval("DoctorName") %>' /></td>
                                <td>
                                    <asp:Label ID="lblPName" runat="server" Text='<%#Eval("PatientName") %>' /></td>
                                <td>
                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("AppointmentDate") %>' /></td>
                                <td>
                                    <asp:Label ID="lblTime" runat="server" Text='<%#Eval("AppointmentTime") %>' /></td>
                                <td>
                                    <asp:Label ID="lblReason" runat="server" Text='<%#Eval("Reason") %>' /></td>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' /></td>
                                <td>
                                    <asp:HiddenField ID="hdfPId" runat="server" Value='<%#Eval("PatientUserId") %>' />
                                    <asp:HiddenField ID="hdfDId" runat="server" Value='<%#Eval("DoctorUserId") %>' />
                                    <asp:HiddenField ID="appointId" runat="server" Value='<%#Eval("AppointmentId") %>' />
                                    <asp:Button ID="btnEdit" runat="server" Text="Reschedule" CssClass="greenBtn" CommandName="editApp" />

                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="redBtn" OnClientClick="return confirm('Are you sure to cancel appointment?');" CommandName="deleteApp" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </asp:Panel>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
