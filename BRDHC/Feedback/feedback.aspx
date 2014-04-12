<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Theme="Theme" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="Feedback_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">

    
        <asp:Panel ID="pnl_feedback" runat="server">
            <asp:Label ID="lbl_message" CssClass="message" runat="server"/>
        <asp:Repeater ID="rpt_feedback" runat="server" OnItemCommand="insertFeedback">
            <HeaderTemplate>
                <br />
                    <asp:Label ID="lbl_heading" Text="Thank you for your interest in BRDHC Hospital. Please share your feedback on 
                        our website so that we can make it more useful to you." runat="server" CssClass="fheader" />
             <br />
                
                <br />
                <asp:Label ID="lbl_fname" Text="First name:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_fname" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_lname" Text="Last name:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_lname" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_patient" Text="Are you a Patient:" CssClass="infoLabel" runat="server" />
                <asp:RadioButtonList ID="r_isPatient" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow">
                    <asp:ListItem Text="Yes" Value="Yes"/>
                    <asp:ListItem Text="No" Value="No"/>
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="lbl_gender" Text="Gender:" CssClass="infoLabel" runat="server" />
                <asp:RadioButtonList ID="r_gender" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow">
                    <asp:ListItem Text="Male" Value="Male"/>
                    <asp:ListItem Text="Female" Value="Female"/>
                </asp:RadioButtonList>
                  <br />
                <asp:Label ID="lbl_email" Text="Email :" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_email" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_phone" Text="Phone Number:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_phone" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_city" Text="City :" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_city" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_state" Text="State :" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_state" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_feedback" Text="Feedback:" runat="server" CssClass="infoLabel" />
                 <br />
                <asp:TextBox ID="txt_feedback" runat="server" CssClass="textContact" TextMode="MultiLine" Width="600" />
                <br />
                <br />
                <asp:Button ID="btn_sub" Text="Submit" runat="server" CommandName="Insert" />
                <asp:Button ID="btn_back" runat="server" CssClass="btnCancel" Text="Cancel" CommandName="Cancel" />
                <br />
                <br />
            </HeaderTemplate>
        </asp:Repeater>
    </asp:Panel>


</asp:Content>


