<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" Theme="HealthTools" AutoEventWireup="true" CodeFile="errorLogs.aspx.cs" Inherits="Admin_errorLogs" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- AUTHOR:   JAGSIR SINGH --%>
    <%-- This page is used to display all the exceptions raised on the site. --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
        <asp:Panel ID="pnlTable" runat="server">
            <asp:GridView ID="grdRecords" runat="server" Width="100%" OnPageIndexChanging="grdRecords_PageIndexChanging" PageSize="5" AutoGenerateColumns="False" AllowPaging="True" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <br />
                            <asp:Label ID="lbl_FName" SkinID="grdTitles" runat="server" Text='File Name: '></asp:Label><asp:Label ID="lblFileName" runat="server" Text='<%# Eval("FileName")%>'></asp:Label><br />
                            <asp:Label ID="lbl_MName" SkinID="grdTitles" runat="server" Text='Method Name: '></asp:Label><asp:Label ID="lblMethodName" runat="server" Text='<%# Eval("MethodName")%>'></asp:Label><br />
                            <asp:Label ID="lbl_LNumber" SkinID="grdTitles" runat="server" Text='Line Number: '></asp:Label><asp:Label ID="lblLineNum" runat="server" Text='<%# Eval("LineNumber")%>'></asp:Label><br />
                            <asp:Label ID="lbl_CNumber" SkinID="grdTitles" runat="server" Text='Column Number: '></asp:Label><asp:Label ID="lblColNum" runat="server" Text='<%# Eval("ColumnNumber")%>'></asp:Label><br />
                            <asp:Label ID="lbl_Mess" SkinID="grdTitles" runat="server" Text='Message: '></asp:Label><asp:Label ID="lblMessage" runat="server" Text='<%# Eval("Message")%>'></asp:Label><br />
                            <asp:Label ID="lbl_EType" SkinID="grdTitles" runat="server" Text='Exception Type: '></asp:Label><asp:Label ID="lblEType" runat="server" Text='<%# Eval("ExceptionType")%>'></asp:Label><br />
                            <asp:Label ID="lbl_ETime" SkinID="grdTitles" runat="server" Text='Exception Time: '></asp:Label><asp:Label ID="lblETime" runat="server" Text='<%# Eval("ExceptionTime")%>'></asp:Label><br />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" PageButtonCount="5" LastPageText="Last" />
                <PagerStyle HorizontalAlign="Right" />
            </asp:GridView>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

