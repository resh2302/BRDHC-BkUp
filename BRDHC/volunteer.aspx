<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/healthTools.master" CodeFile="volunteer.aspx.cs"  Theme="HealthTools" Inherits="volunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

       <asp:Panel ID="allOpps" runat="server">
        <div class="msAll98 msPadBot10 msOH">
        <asp:Label ID="lbl_vol_opp" runat="server" Text="Volunteer Opportunities" CssClass="msHeader2" />
        <br />
        <asp:Label ID="lbl_select" runat="server" Text="Click on the opportunity titles below to see more information, then select the opportunities you are interested in applying for:::" CssClass="msPara" />
        </div>

        <div class="msAll90 msOH">
            <div class="msLeft20 msPadTop20 msPadBot20 msOH">
                <asp:Repeater ID="rptOpps" runat="server" OnItemCommand="rptOpps_ItemCommand">
                    <ItemTemplate>
                        <table>
                        <tr>
                            <td>
                                <div>
                                <asp:HiddenField ID="hdnOppID" runat="server" Value='<%#Eval("OppId") %>' />
                                <asp:CheckBox ID="chk" runat="server" />
                                <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%#Eval("OppId") %>' CommandName="getOpps" Text='<%#Eval("OppTitle") %>' />
                                </div>
                            </td>
                        </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="msRight80 msPadTop20 msOH">       

                <%--<asp:Label ID="lblOpp" runat="server"></asp:Label>--%>

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
                                    <asp:Label runat="server" ID="lbl_title" Text="Title: " CssClass="neutralLight" /> <%#Eval("OppTitle") %>
                                    <br />
                                    <asp:Label ID="lbl_skills" runat="server" Text="Skills: " CssClass="neutralLight" /> <%#Eval("Skills") %>
                                    <br />
                                    <asp:Label ID="lbl_benefits" runat="server" Text="Benefits: " CssClass="neutralLight" /> Benefits: <%#Eval("Benefits") %>
                                    <br />
                                    <asp:Label ID="lbl_other" runat="server" Text="Other requirements: " CssClass="neutralLight" /> <%#Eval("Other") %>
                                    <br />
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
        </asp:Panel>

        <asp:Panel ID="pnlMsMsg" runat="server">
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <div class="msAll90 msOH">
             <div class="msLeft70">               
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_fName" runat="server" Text="First name" CssClass="msFont11" />
                    <asp:TextBox ID="msfName" runat="server" CssClass="msPadAll2 msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_lname" runat="server" Text="Last name" CssClass="msFont11" />
                    <asp:TextBox ID="mslname" runat="server" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_phone" runat="server" Text="Phone number"  CssClass="msFont11" />
                    <asp:TextBox ID="msPhone" runat="server" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" /> 
                </div>
                <br /> 
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_email" runat="server" Text="Email"  CssClass="msFont11" />
                    <asp:TextBox ID="msEmail" runat="server" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" /> 
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_address" runat="server" Text="Address" CssClass="msFont11" />
                    <asp:TextBox ID="msAddress" runat="server" Textmode="Multiline" Width="100%" style="font-family: Arial, Verdana, sans-serif;"  Rows="5" CssClass="msTxtBox12 msMargBot10 msMargTop20 msPadAll2" />
                </div>
                <br />             
            </div>

            <div class="msLeft90">
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_occ" runat="server" Text="Occupation" CssClass="msFont11" />
                    <asp:TextBox ID="msOcc" runat="server" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_student" runat="server" Text="Are you a student? If so, what grade/year?"  CssClass="msFont11" />
                    <asp:TextBox ID="msStudent" runat="server" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_prevEx" runat="server" Text="What is your previous volunteer experience? " CssClass="msFont11 msMargBot5" />
                    <asp:TextBox ID="msPreEx" runat="server" Textmode="Multiline" Width="100%" style="font-family: Arial, Verdana, sans-serif;"  Rows="8" CssClass="msTxtBox12 msMargBot10 msMargTop20 msPadAll2" />
                </div>
                <br />
                <div class="msMargBot10">
                        <asp:Label ID="mslbl_why" runat="server" Text="Why would you like to voluteer at the Blind River Distric Health Centre? " CssClass="msFont11 msMargBot5" />
                        <asp:TextBox ID="msWhy" runat="server" Textmode="Multiline" Width="100%" style="font-family: Arial, Verdana, sans-serif;"  Rows="8" CssClass="msTxtBox12 msMargBot10 msMargTop20 msPadAll2" />
                </div>
            <br />
            <asp:Button CssClass="btn msLeft msMargBot30" runat="server" ID="btnSubmitVolApp" Text="Submit" OnCommand="btnSubmitVolApp_Command" CommandName="Insert"  />
            <br /><br />
         </div> 
      </div>                     
      </asp:Panel>


      <asp:Panel ID="pnlMsSent" runat="server" Visible="false">
        <div class="msAll90 msOH msPadBot30 msPadTop30">
          <asp:Label ID="mSlblTks" runat="server" CssClass="msHeader3 msImp" />
        </div>
      </asp:Panel>

    </asp:Panel>

</asp:Content>