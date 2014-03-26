<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setDashboradMenus.aspx.cs" Inherits="Admin_setDashboradMenus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />

            <asp:Repeater ID="rpt_main" runat="server" DataSourceID="sds_main" OnItemCommand="subCommand" OnItemDataBound="rpt_main_ItemDataBound">
                <HeaderTemplate>
                    <table>
                        <tr style="background: #d3d3d3">
                            <td style="width:100px;">Menu ID</td>
                            <td style="width: 300px;">Menu Title</td>
                            <td style="width: 300px;">Menu Url</td>
                            <td style="width: 300px;">Role Name</td>
                            <td style="width: 300px;">Parent Menu Id</td>
                            <td style="width: 100px;">Status</td>
                            <td style="width: 100px;">Actions</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="ID: " />
                            <asp:Label ID="lbl_idE" runat="server" Text='<%#Eval("MenuId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lbl_name" runat="server" Text="Menu Title: " />
                            <asp:TextBox ID="txt_Title" runat="server" Text='<%#Eval("MenuTitle") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lbl_Description" runat="server" Text="Menu Url: " />
                            <asp:TextBox ID="txt_MenuUrl" runat="server" Text='<%#Eval("MenuUrl") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lbl_price" runat="server" Text="Role Name: " />
                            <asp:TextBox ID="txt_RoelName" runat="server" Text='<%#Eval("RoleName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="lbl_ParentID" runat="server" Text="Role Name: " />
                            <asp:TextBox ID="txt_ParentId" runat="server" Text='<%#Eval("ParentId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Status: " />
                            <asp:Checkbox ID="chk_status" runat="server" Checked='<%#Eval("Status") %>' />
                        </td>
                        <td>
                            <asp:LinkButton ID="btn_edit" runat="server" Text="Update" CommandName="doUpdate" />
                            <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="doDelete" OnClientClick="return confirm('Confirm delete?');" />
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="txt_menuTitlei" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_MenuUrli" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlroles"  runat="server"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_ParentIdi" runat="server" />
                        </td>
                        <td><asp:CheckBox ID="chkStatus" runat="server" Checked="true" />
                        </td>
                        <td>
                            <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="doInsert" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="sds_main" runat="server" ConnectionString="<%$ ConnectionStrings:myCon %>" DeleteCommand="DELETE FROM [brdhc_DashboardMenus] WHERE [MenuId] = @MenuId" InsertCommand="INSERT INTO [brdhc_DashboardMenus] ([MenuTitle], [MenuUrl], [RoleName], [Status], [ParentId]) VALUES (@MenuTitle, @MenuUrl, @RoleName, @Status, @ParentId)" SelectCommand="SELECT * FROM [brdhc_DashboardMenus]" UpdateCommand="UPDATE [brdhc_DashboardMenus] SET [MenuTitle] = @MenuTitle, [MenuUrl] = @MenuUrl, [RoleName] = @RoleName, [Status] = @Status, [ParentId] = @ParentId WHERE [MenuId] = @MenuId">
                <DeleteParameters>
                    <asp:Parameter Name="MenuId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MenuTitle" Type="String" />
                    <asp:Parameter Name="MenuUrl" Type="String" />
                    <asp:Parameter Name="RoleName" Type="String" />
                    <asp:Parameter Name="Status" Type="Boolean" />
                    <asp:Parameter Name="ParentId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MenuTitle" Type="String" />
                    <asp:Parameter Name="MenuUrl" Type="String" />
                    <asp:Parameter Name="RoleName" Type="String" />
                    <asp:Parameter Name="Status" Type="Boolean" />
                    <asp:Parameter Name="ParentId" Type="Int32" />
                    <asp:Parameter Name="MenuId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>


        </div>
    </form>
</body>
</html>
