<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.master" CodeFile="volunteer.aspx.cs"  Theme="HealthTools" Inherits="volunteer" maintainScrollPositionOnPostBack="true"  %>

<%--overriding content on the masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
  
  <%--needed to hold all content centre aligned--%>  
  <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

    <%--container for responsiveness--%>
    <div class="bootContainer">
       
        <%--Intro message--%>
        <div class="col-sm-12">
        <asp:Label ID="lbl_vol_opp" runat="server" Text="Volunteer Opportunities" CssClass="msHeader2" />
        <br />
        <asp:Label ID="lbl_select" runat="server" Text="Click on the opportunity titles below to see more information, then check the ones you are interested in applying for:" CssClass="msPara" />
        </div>

        <%--Repeater holding opportunity title and checkbox--%>
      <div class="col-xs-12 col-sm-11 col-sm-offset-1 msPadTop20 msPadBot20 ">
                <div class="col-xs-12 col-sm-3">
                <asp:Repeater ID="rptOpps" runat="server" OnItemCommand="rptOpps_ItemCommand">
                    <ItemTemplate>
                        <table>
                        <tr>
                            <td>
                                <div class="msPadBot10">
                                <asp:HiddenField ID="hdnOppID" runat="server" Value='<%#Eval("OppId") %>' />
                                <asp:CheckBox ID="chk" runat="server" />
                                <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%#Eval("OppId") %>' CommandName="getOpps" Text='<% #Eval("OppTitle") + " >" %>' CssClass="msFont11" />
                                </div>
                            </td>
                        </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
                </div>

                <div class="col-xs-12 col-sm-9">       
                    <%--Current opportunities are loaded into listview--%>
                    <asp:ListView runat="server" ID="ltv_opps">
                        <LayoutTemplate>
                            <table runat="server" id="tblOpps">
                                <tr runat="server" id="itemPlaceholder">
                                </tr>
                            </table>
                        </LayoutTemplate>               
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="msPara">
                                        <div class="col-xs-12 msPadTop10">
                                        <asp:Label runat="server" ID="lbl_title" Text="Title: " CssClass="neutralLight" /> <%#Eval("OppTitle") %>
                                        </div>

                                        <div class="col-xs-12 msPadTop10">
                                        <asp:Label ID="lbl_skills" runat="server" Text="Skills: " CssClass="neutralLight" /> <%#Eval("Skills") %>
                                        </div>
                                    
                                        <div class="col-xs-12 msPadTop10">
                                        <asp:Label ID="lbl_benefits" runat="server" Text="Benefits: " CssClass="neutralLight" /> Benefits: <%#Eval("Benefits") %>
                                        </div>

                                        <div class="col-xs-12 msPadTop10">
                                        <asp:Label ID="lbl_other" runat="server" Text="Other requirements: " CssClass="neutralLight" /> <%#Eval("Other") %>
                                        </div>

                                        <asp:Label ID="lbl_time" runat="server" Text="Time commitment: " CssClass="neutralLight" /> <%#Eval("CommitmentHow") %>
                                        <br />
                                        <asp:Label ID="lbl_engagement" runat="server" Text="Date an Time of volunteer engagaement: " CssClass="neutralLight" /> <%#Eval("CommitmentWhen") %>
                                        <br />
                                        <asp:Label ID="lbl_contact" runat="server" Text="Contact person: " CssClass="neutralLight" /> <%#Eval("ContactPerson") %>
                                        <br />
                                        <asp:Label ID="lbl_department" runat="server" Text="Department: " CssClass="neutralLight" /> <%#Eval("Department") %>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        </asp:ListView>
                 </div>
          </div>

       <asp:Panel ID="pnlMsMsg" runat="server" CssClass="msPadTop30">

           <%--First name label and textbox--%>
           <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                        <asp:Label ID="mslbl_fName" runat="server" Text="First name" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                        <asp:TextBox ID="msfName" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                <asp:RequiredFieldValidator ID="rfv_fName" runat="server" Text="*Required" ControlToValidate="msfName" ValidationGroup="insert" />
                </div>
            </div>
          
            <%--Last name label and textbox--%>
            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                    <asp:Label ID="mslbl_lname" runat="server" Text="Last name" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                        <asp:TextBox ID="mslname" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                        <asp:RequiredFieldValidator ID="rfv_lname" runat="server" Text="*Required" ControlToValidate="msfname" ValidationGroup="insert" />
                </div>
            </div>

           <%--Phone number label and textbox--%>
            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                    <asp:Label ID="mslbl_phone" runat="server" Text="Phone number"  CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                        <asp:TextBox ID="msPhone" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                        <asp:RequiredFieldValidator ID="rfv_Phone" runat="server" Text="*Required" ControlToValidate="msPhone" ValidationGroup="insert" />
                </div>
            </div>

           <%--Email label and textbox--%>
            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                    <asp:Label ID="mslbl_email" runat="server" Text="Email"  CssClass="msFont11" />
                </div>
               <div class="col-xs-12 col-sm-3">
                        <asp:TextBox ID="msEmail" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                        <asp:RequiredFieldValidator ID="rfv_Email" runat="server" Text="*Required" ControlToValidate="msEmail" ValidationGroup="insert" />
                </div>
            </div>

           <%--Address label and textbox--%>
            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                    <asp:Label ID="mslbl_address" runat="server" Text="Address" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-6">
                    <asp:TextBox ID="msAddress" runat="server" Textmode="Multiline" Width="100%"  Rows="5" CssClass="msTxtBox12 msPadAll2" />
                    <asp:RequiredFieldValidator ID="rfv_Address" runat="server" Text="*Required" ControlToValidate="msAddress" ValidationGroup="insert" />
                </div>
            </div>
           
           <%--Occupation label and textbox--%>          
            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-5">
                    <asp:Label ID="mslbl_occ" runat="server" Text="Occupation" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                    <asp:TextBox ID="msOcc" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                    <asp:RequiredFieldValidator ID="rfv_Occ" runat="server" Text="*Required" ControlToValidate="msOcc" ValidationGroup="insert" />
                </div>
             </div>

            <%--Student label and textbox--%>
             <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-5">
                    <asp:Label ID="mslbl_student" runat="server" Text="Are you a student? If so, what grade/year?"  CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                    <asp:TextBox ID="msStudent" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                    <asp:RequiredFieldValidator ID="rfv_Student" runat="server" Text="*Required" ControlToValidate="msStudent" ValidationGroup="insert" />
                </div>
             </div>

             <%--Previous Experience label and textbox--%>
             <div class="col-xs-12 msMargBot10">
                    <asp:Label ID="mslbl_prevEx" runat="server" Text="What is your previous volunteer experience? " CssClass="msFont11" />
                    <asp:TextBox ID="msPreEx" runat="server" Textmode="Multiline" Width="100%"  Rows="8" CssClass="msTxtBox12 msPadAll2" />
                    <asp:RequiredFieldValidator ID="rfv_PreEx" runat="server" Text="*Required" ControlToValidate="msPreEx" ValidationGroup="insert" />
                </div>

              <%--Why BRDHC label and textbox--%>  
              <div class="col-xs-12 msMargBot10">
                        <asp:Label ID="mslbl_why" runat="server" Text="Why would you like to voluteer at the Blind River Distric Health Centre? " CssClass="msFont11" />
                        <asp:TextBox ID="msWhy" runat="server" Textmode="Multiline" Width="100%" style="font-family: Arial, Verdana, sans-serif;"  Rows="8" CssClass="msTxtBox12 msPadAll2" />
                        <asp:RequiredFieldValidator ID="rfv_Why" runat="server" Text="*Required" ControlToValidate="msWhy" ValidationGroup="insert" />
                </div>

                <%--Submit button--%>
                <div class="col-xs-12  msMargBot30">
                <asp:Button CssClass="btn msLeft" runat="server" ID="btnSubmitVolApp" Text="Submit" OnCommand="btnSubmitVolApp_Command" CommandName="Insert" ValidationGroup="insert"  />
                </div>
        
      </asp:Panel>
          
    </div>
                             
  </asp:Panel>

  <asp:Panel ID="pnlMsSent" runat="server" Visible="false">
      <div class="col-xs-12 msOH msPadBot30 msPadTop30">
          <asp:Label ID="mSlblTks" runat="server" CssClass="msHeader3 msImp" />
       </div>
   </asp:Panel>

</asp:Content>