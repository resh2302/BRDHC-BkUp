<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" Theme="Theme" AutoEventWireup="true" CodeFile="PatientAppointment.aspx.cs" Inherits="PatientAppointment" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <%--REquired--%>
    <asp:Panel ID="pnlContainer" Style="display: inline-block; width: 79%;" runat="server">
        <asp:Panel ID="pnlHead" CssClass="pnlHead" runat="server">
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />
        </asp:Panel>
        <%--/ #pnlHead--%>
        <asp:Panel ID="pnlDashboard" CssClass="pnlDashboard fullWidth" runat="server">
            <asp:Panel ID="pnlContent" CssClass="pnlContent fullWidth " runat="server">
                <%-- ajax control toolkit tabcontainer used to display to tabs - Making requests , request status --%>
                <ajax:TabContainer ID="tcAppointments" runat="server" ActiveTabIndex="0" OnDemand="true" TabStripPlacement="Top">
                    <%-- Tab for making requests --%>
                    <ajax:TabPanel ID="tabReq" runat="server" HeaderText="Request Appointment" OnDemandMode="Once">
                        <ContentTemplate>
                            <asp:Panel ID="pnlReq" runat="server">
                                <asp:Label ID="lblDoc" runat="server" Text="Select Doctor" CssClass="infoLabel" />
                                <%-- dropdown showing doctors' names --%>
                                <asp:DropDownList ID="ddlDoctor" runat="server" AutoPostBack="true" />
                                <br />
                                <br />
                                <asp:Label ID="lblReason" Text="Reason" runat="server" CssClass="infoLabel" />
                                <%-- text area for entering reason for appointment --%>
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
                                <%-- textbox for date of appointment --%>
                                <asp:TextBox ID="txtDate" runat="server" AutoPostBack="true" OnTextChanged="txtDate_TextChanged" onkeypress="return false;" />
                                <%-- ajax controltoolkit's calendar extender for datepicker --%>
                                <ajax:CalendarExtender ID="calDate" FirstDayOfWeek="Monday" EnableViewState="true" PopupPosition="BottomRight" Format="yyyy-MM-dd" TargetControlID="txtDate" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                                &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Appointment Date" />
                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="grpApp"></asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:Label ID="lblTime" Text="Appointment Time:" runat="server" CssClass="infoLabel" />
                                <%-- dropdown with available times --%>
                                <asp:DropDownList runat="server" ID="ddlTimes"></asp:DropDownList>
                                <br />
                                <br />
                                <asp:Button ID="btnSU" Text="Save" ValidationGroup="grpApp" runat="server" OnClick="subBookApp" />
                                <asp:Button ID="btnCancel" Text="Cancel" CssClass="btnCancel" runat="server" OnClick="btnCancel_Click" CausesValidation="false" />
                            </asp:Panel>
                        </ContentTemplate>
                    </ajax:TabPanel> <%--/ #tabReq--%>
                    <%-- Tab for viewing request status --%>
                    <ajax:TabPanel ID="tabStatus" runat="server" HeaderText="Request Status" OnDemandMode="Once">
                        <ContentTemplate>
                            <asp:Panel ID="pnlEmpty" runat="server">
                                <asp:Label ID="lblEmpty" runat="server" Text="You have no appointments" />
                            </asp:Panel>
                            <asp:Panel ID="pnlApp" runat="server">
                                <table>
                                    <tr>
                                        <td>Appointment ID</td>
                                        <td>Doctor Name</td>
                                        <td>Date</td>
                                        <td>Time </td>
                                        <td>Reason</td>
                                        <td>Request Status</td>
                                    </tr>
                                    <asp:DataList ID="dlApp" runat="server">
                                        
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%#Eval("AppointmentId") %>
                                                </td>
                                                <td>
                                                    <%#Eval("DoctorName") %>
                                                </td>
                                                <td>
                                                    <%#Eval("AppointmentDate", "{0:d}") %>
                                                </td>
                                                <td>
                                                    <%#Eval("AppointmentTime") %>
                                                </td>
                                                <td>
                                                    <%#Eval("Reason") %>
                                                </td>
                                                <td>
                                                    <%#Eval("approvalStatus") %>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </ajax:TabPanel> <%--/ #tabStatus--%>

                </ajax:TabContainer><%--  / #tcAppointments--%>

            </asp:Panel>
            <%--/ #pnlContent--%>
        </asp:Panel>
        <%--/ #pnlDashboard--%>
    </asp:Panel>
    <%--/ #pnlContainer--%>
</asp:Content>

