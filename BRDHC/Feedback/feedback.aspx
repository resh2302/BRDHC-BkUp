<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Theme="Theme" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="Feedback_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">

     <div class="bootContainer">
         <%-- Main panel --%>
        <asp:Panel ID="pnl_feedback" runat="server">
            <asp:Label ID="lbl_message" CssClass="message" runat="server"/>
            <%-- Repeater --%>
        <asp:Repeater ID="rpt_feedback" runat="server" OnItemCommand="insertFeedback">

            <HeaderTemplate>
                <br />
                    <asp:Label ID="lbl_heading" Text="Thank you for your interest in BRDHC Hospital. Please share your feedback on 
                        our website so that we can make it more useful to you." runat="server" CssClass="fheader" />
             <br />
                
                <br />
               <%-- Labels and Text boxes with validation and required field validators --%>
                <%-- Label and textbox for first name --%>
                <asp:Label ID="lbl_fname" Text="First name:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_fname" runat="server" CssClass="textContact" />
                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rfv_fname"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txt_fname"  
                                  ErrorMessage="Please enter your  firstname" 
                                Text="*Required"
                                ForeColor="#FF0000" />
                    
                <br />
                 <%-- Label and textbox for last name --%>
                <asp:Label ID="lbl_lname" Text="Last name:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_lname" runat="server" CssClass="textContact" />
                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rfv_lname"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txt_lname"  
                                  ErrorMessage="Please enter your last name" 
                                Text="*Required"
                                ForeColor="#FF0000" />
                <br />
                 <%-- Label and textbox for if patient --%>
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
                <%-- required field and regularexpression validators for email --%>
                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rfv_email"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txt_email"  
                                  ErrorMessage="Please enter your email address" 
                                Text="*Required"
                                ForeColor="#FF0000" />
                <asp:RegularExpressionValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rev_email"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txt_email"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ErrorMessage="Please enter valid email address" 
                                Text="*Please enter proper email address" 
                                ForeColor="#FF0000" />
                <br />
                 <%-- Label and textbox for phone number --%>
                <asp:Label ID="lbl_phone" Text="Phone Number:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_phone" runat="server" CssClass="textContact" ToolTip="647-000-0000" />
                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rfv_phone"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txt_phone"  
                                  ErrorMessage="Please enter your cell number" 
                                Text="*Required"
                                ForeColor="#FF0000" />
                <asp:RegularExpressionValidator ID="rev_phone" SetFocusOnError="true" Display="Dynamic" 
                runat="server" ErrorMessage="Phone Number is not valid"
                    ValidationGroup="group1" ControlToValidate="txt_phone" ForeColor="Red"
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
                    </asp:RegularExpressionValidator>
                <br />
                 <%-- Label and textbox for city --%>
                <asp:Label ID="lbl_city" Text="City :" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_city" runat="server" CssClass="textContact" />
                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rfv_city"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txt_city"  
                                  ErrorMessage="Please enter your city" 
                                Text="*Required"
                                ForeColor="#FF0000" />


                <br />
                 <%-- Label and textbox for state --%>
                <asp:Label ID="lbl_state" Text="State :" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_state" runat="server" CssClass="textContact" />
                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rfv_state"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txt_state"  
                                  ErrorMessage="Please enter state" 
                                Text="*Required"
                                ForeColor="#FF0000" />

                <br />
                 <%-- Label and textbox for feedback --%>
                <asp:Label ID="lbl_feedback" Text="Feedback:" runat="server" CssClass="infoLabel" />
                 <br />
                <asp:TextBox ID="txt_feedback" runat="server" CssClass="textContact" TextMode="MultiLine" Width="600" />
                <asp:RequiredFieldValidator SetFocusOnError="true" Display="Dynamic"
                                 ID="rfv_feedback"  
                                   runat="server"  
                                 ValidationGroup="group1" 
                                 ControlToValidate="txt_feedback"  
                                  ErrorMessage="Please enter some feedback" 
                                Text="*Required"
                                ForeColor="#FF0000" />

                <br />
                <br />
                <asp:Button ID="btn_sub" Text="Submit" runat="server" CommandName="Insert" ValidationGroup="group1" />
                <asp:Button ID="btn_back" runat="server" CssClass="btnCancel" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                 <%-- validation summary to show all the errors --%>
                <asp:ValidationSummary ID="Vali_summ" runat="server" HeaderText="Errors:" DisplayMode="List" ShowMessageBox="true" ShowSummary="false" ForeColor="#FF0000" Font-Bold="true" ValidationGroup="group1"/>
                <br />
                <br />
            </HeaderTemplate>
        </asp:Repeater>
    </asp:Panel>

          </div>
</asp:Content>


