<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" MasterPageFile="~/brdhc.master" Theme="HealthTools" Inherits="brdhcAdmin_registration" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
        <asp:Label ID="lblErr" runat="server" Visible="false" CssClass="statusMsg" /><br />
        <asp:Panel ID="pnlDetails" GroupingText="User Info" runat="server" CssClass="pnlLabel">
            <div id="divForm">
                <table>
                    <tr>
                        <td colspan="2" class="formHeader">
                            <asp:Label ID="lblHeading" runat="server" Text="Register New User"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblRoles" runat="server" Text="Register[Role]:" AssociatedControlID="ddlRoles"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRoles" runat="server" AutoPostBack="true" OnSelectedIndexChanged="subRoleChange"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblIdentity" runat="server" AssociatedControlID="txtIdentity" Text="Identity: "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIdentity" runat="server" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvIdentity" runat="server" ControlToValidate="txtIdentity" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Identity is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
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
                        <td>
                            <asp:Label ID="lblFName" runat="server" AssociatedControlID="txtFName" Text="First Name:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFName" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtFName" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="First Name is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblLName" runat="server" AssociatedControlID="txtLName" Text="Last Name:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLName" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="txtLName" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Last Name is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDOB" runat="server" Text="Date of Birth:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                            <ajax:CalendarExtender ID="calDOB" FirstDayOfWeek="Sunday" EnableViewState="true" Format="yyyy-MM-dd" TargetControlID="txtDOB" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                            &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Date of Birth." />
                            <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Date of Birth is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <asp:Panel ID="pnlPatients" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="lblFDoctor" runat="server" AssociatedControlID="txtFDoctor" Text="Family Doctor Name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFDoctor" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFDoctor" runat="server" ControlToValidate="txtFDoctor" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Family Doctor Name is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </asp:Panel>
                    <asp:Panel ID="pnlDoctors" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="lblSpeciality" runat="server" AssociatedControlID="ddlSpecialities" Text="Speciality:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSpecialities" runat="server" DataTextField="Speciality" DataValueField="SpecialityId" DataSourceID="sdsSpeciality"></asp:DropDownList>
                                <asp:SqlDataSource ID="sdsSpeciality" runat="server" ConnectionString="<%$ ConnectionStrings:myCon %>" SelectCommand="SELECT * FROM [brdhc_DoctorSpecialities] ORDER BY Speciality"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </asp:Panel>
                    <asp:Panel ID="pnlDepartment" runat="server">
                        <tr>
                            <td>
                                <asp:Label ID="lblDepartment" runat="server" AssociatedControlID="txtDepartment" Text="Department:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDepartment" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" ControlToValidate="txtDepartment" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Department is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td>
                            <asp:Label ID="lblJoinDate" runat="server" Text="Joining Date:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtJoiningDate" runat="server"></asp:TextBox>
                            <ajax:CalendarExtender ID="calJoingDate" FirstDayOfWeek="Sunday" EnableViewState="true" Format="yyyy-MM-dd" TargetControlID="txtJoiningDate" PopupButtonID="imgCalJoin" runat="server"></ajax:CalendarExtender>
                            &nbsp;<asp:ImageButton ID="imgCalJoin" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Date of Joining." />
                            <asp:RequiredFieldValidator ID="rfvJoiningDate" runat="server" ControlToValidate="txtJoiningDate" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Date of Joing is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="E-mail is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Invalid email." ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblAddress" runat="server" AssociatedControlID="txtAddress" Text="Address:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Address is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
                        </td>
                        <td>
                            <ajax:ComboBox ID="ddlStateAjax" runat="server" AutoPostBack="true" OnSelectedIndexChanged="subChangeCities"></ajax:ComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCity" runat="server" AssociatedControlID="ddlCity" Text="City:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPostalCode" runat="server" AssociatedControlID="txtPostalCode" Text="Postal Code:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPostalCode" MaxLength="7" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Postal Code is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" Text="Phone:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" MaxLength="15"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="*" Display="Dynamic" SetFocusOnError="true" ToolTip="Phone is required." ValidationGroup="grpRegister"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblFax" runat="server" AssociatedControlID="txtFax" Text="Fax:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFax" runat="server" MaxLength="15"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblComunityName" runat="server" AssociatedControlID="txtCommunityName" Text="Community Name:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCommunityName" runat="server" MaxLength="100"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnRegister" runat="server" Text="Register" ValidationGroup="grpRegister" OnClick="subRegister" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlTable" CssClass="pnlTable table-responsive" runat="server">
            <div id="divDetails">
                <asp:Button ID="btnAdd" runat="server" Text="New Registration" OnClick="btnAdd_Click" /><br />
                <br />
                <asp:Panel ID="pnlSearch" runat="server">
                    <table style="width: 100%; border: none;">
                        <tr>
                            <td style="width: 25%; text-align: right; padding: 10px; border: none;">
                                <asp:Label ID="lblRolesDes" runat="server" Text="Role:" AssociatedControlID="ddlRoles"></asp:Label>
                            </td>
                            <td style="width: 50%; text-align: left; padding: 20px; border: none;">
                                <asp:DropDownList ID="ddlRolesDes" runat="server"></asp:DropDownList>&nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="false" OnClick="subSearchUsers" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Repeater ID="rptUserDetails" runat="server" OnItemDataBound="rptUserDetails_ItemDataBound" OnItemCommand="rptUserDetails_ItemCommand">
                    <HeaderTemplate>
                        <table>
                            <tr class="colHeaderRow">
                                <td>Name</td>
                                <td>User Name</td>
                                <td>Date of Birth</td>
                                <td>Identification</td>
                                <td>Department</td>
                                <td>Join Date</td>
                                <td>Specility</td>
                                <td>Community Group Name</td>
                                <td>Is Locked</td>
                                <td>Action</td>
                            </tr>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <%--<asp:Panel ID="pnlRPT" runat="server">--%>
                        <tr class="itemTemp">
                            <td>
                                <asp:LinkButton ID="lnkFullName" runat="server" CommandName="editUser" Text='<%#Eval("Name") %>'></asp:LinkButton>
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
                                <asp:Label ID="lblDep" runat="server" Text='<%#Eval("Department") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblJoinDate" runat="server" Text='<%#Eval("JoinDate") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblSpec" runat="server" Text='<%#Eval("Speciality") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblCName" runat="server" Text='<%#Eval("CommunityGroupName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLock" runat="server" Text='<%#Eval("IsLocked") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdfUserId" runat="server" Value='<%#Eval("UserId") %>'></asp:HiddenField>
                                <asp:HiddenField ID="hdfLock" runat="server" Value='<%#Eval("IsLocked") %>'></asp:HiddenField>
                                <asp:Button ID="btnLock" runat="server" CommandName="lock" OnClientClick="return confirm('Are you sure?');" CommandArgument='<%#Eval("UserId") %>' />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="redBtn" OnClientClick="return confirm('Are you sure to delete?');" CommandName="deleteUser" />
                            </td>
                        </tr>

                        <%--</asp:Panel>--%>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <%--<asp:Panel ID="pnlRPT" runat="server">--%>
                        <tr class="altItemTemp">
                            <td>
                                <asp:LinkButton ID="lnkFullName" runat="server" CommandName="editUser" Text='<%#Eval("Name") %>'></asp:LinkButton>
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
                                <asp:Label ID="lblDep" runat="server" Text='<%#Eval("Department") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblJoinDate" runat="server" Text='<%#Eval("JoinDate") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblSpec" runat="server" Text='<%#Eval("Speciality") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblCName" runat="server" Text='<%#Eval("CommunityGroupName") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblLock" runat="server" Text='<%#Eval("IsLocked") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdfUserId" runat="server" Value='<%#Eval("UserId") %>'></asp:HiddenField>
                                <asp:HiddenField ID="hdfLock" runat="server" Value='<%#Eval("IsLocked") %>'></asp:HiddenField>
                                <asp:Button ID="btnLock" runat="server" CommandName="lock" OnClientClick="return confirm('Are you sure?');" CommandArgument='<%#Eval("UserId") %>' />
                            </td>
                        </tr>

                        <%--</asp:Panel>--%>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
