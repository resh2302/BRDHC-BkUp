<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" Theme="Theme" AutoEventWireup="true" CodeFile="errorLogs.aspx.cs" Inherits="Admin_errorLogs" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
        <asp:Panel ID="pnlTable" runat="server">
            <asp:GridView ID="grdRecords" runat="server" AutoGenerateColumns="false" AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:TemplateField HeaderText="File Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("FileName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Method Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("MethodName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Event Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("EventName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Line Number">
                        <ItemTemplate>
                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("LineNumber")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Column Number">
                        <ItemTemplate>
                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("ColumnNumber")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Message">
                        <ItemTemplate>
                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("Message")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exception Type">
                        <ItemTemplate>
                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("ExceptionType")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exception Time">
                        <ItemTemplate>
                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("ExceptionTime")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

