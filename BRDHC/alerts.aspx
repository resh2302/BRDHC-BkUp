<%@ Page Title="" Language="C#" MasterPageFile="~/homeMaster.master" Theme="Theme" AutoEventWireup="true" CodeFile="alerts.aspx.cs" Inherits="alerts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="styles/healthAlerts.css" rel="stylesheet" />
    <script type="text/javascript" src="js/healthAlert.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:Label ID="lblMsg" Visible="false" runat="server" CssClass="statusMsg"></asp:Label>
        <h1>
            <asp:Label runat="server" ID="lblTitle" /></h1>
        <asp:HiddenField ID="hfaid" runat="server" />
        <asp:Label ID="lblBy" runat="server" Text="By: BRDHC Health Department"></asp:Label><br />
        <asp:Label ID="lblDate" runat="server"></asp:Label><br />
        <br />
        <asp:Label ID="lblDesc" runat="server"></asp:Label>
    </div>
    <div id="showAlert" runat="server" style="text-align: right; padding: 50px;">
        <%--<asp:LinkButton ID="tmpAlertOpen" runat="server"><img src="images/mail_Icon.png" /></asp:LinkButton>--%>
        <img id="pImage" src="images/processing.gif" />
        <input type='submit' name='tmpAlertOpen' id='tmpAlertOpen' value='Send to friend' />
        <div id="tmpAlert">
            <div id="mailMsg" class="statusMsg"></div>
            <asp:TextBox ID="txtEmails" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmails" runat="server" ControlToValidate="txtEmails" Text="*" SetFocusOnError="true" ValidationGroup="grpEmails"></asp:RequiredFieldValidator><br />
            <br />
            <div class="tmpBtns">
                <asp:Button  ID="lbtnSend" ValidationGroup="grpEmails" runat="server" Text="Email" />
            </div>
        </div>
    </div>
    <%--<p>
        <input type='submit' name='tmpDialogueOpen' id='tmpDialogueOpen' value='Open Dialogue' />
    </p>--%>
</asp:Content>

