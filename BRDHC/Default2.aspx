<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListView ID="ListView1" runat="server"></asp:ListView>
        <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
       
    <asp:Repeater ID="rpt" runat="server" OnItemCommand="rpt_ItemCommand"
         >
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Select</th><th>Name</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:CheckBox ID="chk" runat="server" />
                </td>
                <td>
                    <asp:LinkButton ID="lnk" runat="server" CommandArgument="oppdId" CommandName="sle" Text="OppName"></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    </div>
    </form>
</body>
</html>
