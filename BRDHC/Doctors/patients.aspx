<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" Theme="Theme" CodeFile="patients.aspx.cs" Inherits="Doctors_patients" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../js/doctorsJScript.js"></script>
</asp:Content>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">

    <asp:Label ID="lblErr" runat="server"></asp:Label>
    <asp:Panel ID="pnlForm" runat="server">
        <div id="divForm">
            <table>
                <tr>
                    <td colspan="2" class="formHeader">
                        <asp:Label ID="lblHeading" runat="server" Text="Register Patient"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblGender" runat="server" Text="Gender:" AssociatedControlID="rdblGender"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rdblGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="true" Text="Male" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblFName" runat="server" AssociatedControlID="txtFName" Text="First Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFName" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtFName" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="First Name is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblLName" runat="server" AssociatedControlID="txtLName" Text="Last Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLName" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="txtLName" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Last Name is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblDOB" runat="server" Text="Date of Birth:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                        <ajax:CalendarExtender ID="calDOB" FirstDayOfWeek="Sunday" EnableViewState="true" TargetControlID="txtDOB" Format="yyyy-MM-dd" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                        &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Date of Birth." />
                        <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Date of Birth is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblFDoctor" runat="server" AssociatedControlID="txtFDoctor" Text="Family Doctor Name:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFDoctor" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFDoctor" runat="server" ControlToValidate="txtFDoctor" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Family Doctor Name is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblRegDate" runat="server" Text="Registration Date:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRegDate" runat="server"></asp:TextBox>
                        <ajax:CalendarExtender ID="calRegDate" FirstDayOfWeek="Sunday" EnableViewState="true" TargetControlID="txtRegDate" Format="yyyy-MM-dd" PopupButtonID="imgCalReg" runat="server"></ajax:CalendarExtender>
                        &nbsp;<asp:ImageButton ID="imgCalReg" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Date" />
                        <asp:RequiredFieldValidator ID="rfvJoiningDate" runat="server" ControlToValidate="txtRegDate" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Date of Registration is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="right">
                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="E-mail is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid email." ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblIdentity" runat="server" AssociatedControlID="txtIdentity" Text="Health Card Number:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtIdentity" runat="server" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvIdentity" runat="server" ControlToValidate="txtIdentity" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Health Card Number is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblAddress" runat="server" AssociatedControlID="txtAddress" Text="Address:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Address is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
                    </td>
                    <td>
                        <ajax:ComboBox ID="ddlStateAjax" runat="server" AutoPostBack="true" OnSelectedIndexChanged="subChangeCities"></ajax:ComboBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblCity" runat="server" AssociatedControlID="ddlCity" Text="City:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblPostalCode" runat="server" AssociatedControlID="txtPostalCode" Text="Postal Code:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPostalCode" MaxLength="7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Postal Code is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" Text="Phone:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server" MaxLength="15"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Phone is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lblFax" runat="server" AssociatedControlID="txtFax" Text="Fax:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFax" runat="server" MaxLength="15"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right"></td>
                    <td>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" ValidationGroup="grpRegister" OnClick="subRegister" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlDetails" runat="server">
        <div id="divDetails">
            <asp:Button ID="btnAdd" runat="server" Text="Add New Patient" OnClick="btnAdd_Click" /><br />
            <br />
            <table>
                <asp:Repeater ID="rptUserDetails" runat="server">
                    <HeaderTemplate>
                        <tr>
                            <td colspan='6' class="displayHeader">Patients</td>
                        </tr>
                        <tr class="colHeaderRow">
                            <td>Name</td>
                            <td>User Name</td>
                            <td>Date of Birth</td>
                            <td>Health Card</td>
                            <td>Registration Date</td>
                            <td>Is Locked</td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Panel ID="pnlRPT" runat="server">
                            <tr class="itemTemp">
                                <td>
                                    <asp:Label ID="lblFullName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblUName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDOB" runat="server" Text='<%#Eval("DOB") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblIdentification" runat="server" Text='<%#Eval("Identification") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblJoinDate" runat="server" Text='<%#Eval("JoinDate") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblLock" runat="server" Text='<%#Eval("IsLocked") %>'></asp:Label>
                                </td>
                            </tr>

                        </asp:Panel>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <asp:Panel ID="pnlRPT" runat="server">
                            <tr class="altItemTemp">
                                <td>
                                    <asp:Label ID="lblFullName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblUName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDOB" runat="server" Text='<%#Eval("DOB") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblIdentification" runat="server" Text='<%#Eval("Identification") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblJoinDate" runat="server" Text='<%#Eval("JoinDate") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblLock" runat="server" Text='<%#Eval("IsLocked") %>'></asp:Label>
                                </td>
                            </tr>

                        </asp:Panel>
                    </AlternatingItemTemplate>
                </asp:Repeater>

            </table>
        </div>
    </asp:Panel>
    </asp:Panel>
</asp:Content>

