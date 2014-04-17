<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="EmergencyNewTime.aspx.cs" Inherits="NewTime" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

   
        <%--REquired--%>
        <asp:Panel ID="pnlHead" CssClass="pnlHead" runat="server">
            
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />
            
            <%-- Menu button for dahsboard's mobile view --%>
            <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />
           
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" CssClass="pnlDashboard" runat="server">
            
            <asp:Panel ID="pnlContent" CssClass="pnlContent pnlEmergencyNewTime" runat="server">
                <%-- label for showing status messages --%>
                <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="statusMsg" />
        <%--REquired--%>
                 
                <asp:Panel ID="pnlAdd" GroupingText="New Wait Time" runat="server" CssClass="pnlSection">
                    <asp:TextBox ID="txtHrs" Text="00" CssClass="txtEmergency" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvHrs" Text="*Please enter hours" Display="Static" SetFocusOnError="true" ControlToValidate="txtHrs" runat="server" ValidationGroup="vgAdd" />
                    <asp:RangeValidator ID="rvHrs" MinimumValue="0" MaximumValue="99" Type="Integer" Display="Static" SetFocusOnError="true"  Text="*Enter hours between 00 and 99" ControlToValidate="txtHrs" runat="server" ValidationGroup="vgAdd" />

                    <asp:Label ID="lblHrsA" Text="hrs  " CssClass="lbl" runat="server" />
                    <asp:TextBox ID="txtMin" Text="15" CssClass="txtEmergency" runat="server" />
                    <asp:RequiredFieldValidator ID="rfvMin" Text="*Please Enter Min" SetFocusOnError="true" Display="Static" ControlToValidate="txtMin" runat="server" ValidationGroup="vgAdd" />
                    <asp:RangeValidator ID="rvMin" MinimumValue="0" MaximumValue="99" Type="Integer" Display="Static" SetFocusOnError="true"  Text="*Enter minutes between 00 and 99" ControlToValidate="txtMin" runat="server" ValidationGroup="vgAdd" />
                    
                    <asp:Label ID="lblMinA" Text="min" CssClass="lbl" runat="server" />

                    <br />
                    <asp:Button ID="btnAdd" Text="Add" runat="server" CommandName="Insert" OnCommand="subAdmin" ValidationGroup="vgAdd" />
                    <asp:Button ID="btnCancel" Text="Cancel" CssClass="btnCancel" runat="server" CommandName="Cancel" OnCommand="subAdmin" CausesValidation="false" />
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlView" GroupingText="Current Wait Time" runat="server" CssClass="pnlEmergencyCurrent">
                    <asp:Repeater ID="rptCurrent" runat="server">
                        <ItemTemplate>
                            <asp:Label ID="lblCurrentTime" Text='<%#Eval("WaitTime") %>' CssClass="lblWaitTime" runat="server" />
                        </ItemTemplate>
                    </asp:Repeater>                    
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    
</asp:Content>

