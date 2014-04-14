<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/healthTools.master" CodeFile="volunteer.aspx.cs"  Theme="HealthTools" Inherits="volunteer" maintainScrollPositionOnPostBack="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
  <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

    <div class="bootContainer">
       <div class="col-sm-12">

        <asp:Label ID="lbl_vol_opp" runat="server" Text="Volunteer Opportunities" CssClass="msHeader2" />
        <br />
        <asp:Label ID="lbl_select" runat="server" Text="Click on the opportunity titles below to see more information, then check the ones you are interested in applying for:" CssClass="msPara" />
        </div>

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
                    <%-- Current Opportunities are loaded into listview from the codebehind file --%>
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

           <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                        <asp:Label ID="mslbl_fName" runat="server" Text="First name" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                        <asp:TextBox ID="msfName" runat="server" CssClass="msPadAll2" Width="100%" />
                </div>
            </div>
          
            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                    <asp:Label ID="mslbl_lname" runat="server" Text="Last name" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                        <asp:TextBox ID="mslname" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                </div>
            </div>


            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                    <asp:Label ID="mslbl_phone" runat="server" Text="Phone number"  CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                        <asp:TextBox ID="msPhone" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" /> 
                </div>
            </div>

            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                    <asp:Label ID="mslbl_email" runat="server" Text="Email"  CssClass="msFont11" />
                </div>
               <div class="col-xs-12 col-sm-3">
                        <asp:TextBox ID="msEmail" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" /> 
                </div>
            </div>

            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-2">
                    <asp:Label ID="mslbl_address" runat="server" Text="Address" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-6">
                    <asp:TextBox ID="msAddress" runat="server" Textmode="Multiline" Width="100%"  Rows="5" CssClass="msPadAll2" />
                </div>
            </div>          

            <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-5">
                    <asp:Label ID="mslbl_occ" runat="server" Text="Occupation" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                    <asp:TextBox ID="msOcc" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                </div>
             </div>

             <div class="col-xs-12 msMargBot10"> 
               <div class="col-xs-12 col-sm-5">
                    <asp:Label ID="mslbl_student" runat="server" Text="Are you a student? If so, what grade/year?"  CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-3">
                    <asp:TextBox ID="msStudent" runat="server" CssClass="msTxtBox12 msPadAll2" Width="100%" />
                </div>
             </div>

                <div class="col-xs-12 msMargBot10">
                    <asp:Label ID="mslbl_prevEx" runat="server" Text="What is your previous volunteer experience? " CssClass="msFont11" />
                    <asp:TextBox ID="msPreEx" runat="server" Textmode="Multiline" Width="100%"  Rows="8" CssClass="msTxtBox12 msPadAll2" />
                </div>

                <div class="col-xs-12 msMargBot10">
                        <asp:Label ID="mslbl_why" runat="server" Text="Why would you like to voluteer at the Blind River Distric Health Centre? " CssClass="msFont11" />
                        <asp:TextBox ID="msWhy" runat="server" Textmode="Multiline" Width="100%" style="font-family: Arial, Verdana, sans-serif;"  Rows="8" CssClass="msTxtBox12 msPadAll2" />
                </div>

                <div class="col-xs-12  msMargBot30">
                <asp:Button CssClass="btn msLeft" runat="server" ID="btnSubmitVolApp" Text="Submit" OnCommand="btnSubmitVolApp_Command" CommandName="Insert"  />
                </div>
          </div>
        
      </asp:Panel>
          
    </div>
                             
 </asp:Panel>

      <asp:Panel ID="pnlMsSent" runat="server" Visible="false">
        <div class="msAll90 msOH msPadBot30 msPadTop30">
          <asp:Label ID="mSlblTks" runat="server" CssClass="msHeader3 msImp" />
        </div>
      </asp:Panel>

</asp:Content>