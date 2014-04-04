<%@ Page Language="C#"  MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="giftShopThankyou.aspx.cs" Inherits="giftShopThankyou" Theme="HealthTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

        <div class="msAll60">
            <asp:Label runat="server" ID="lbl_thk" CssClass="msHeader4 msImp msPadTop30" />
        </div>

        <div class="msAll98">
                <asp:Label ID="quizH2" runat="server" Text="Send a handwritten card to a loved one" CssClass="msHeader2" />
                <asp:Label ID="quizP" runat="server" Text="Send a handwritten card to a loved one is a FREE service provided by the BRDHC auxilary gift shop volunteers. They do their very best to deliver your card within 24 hours of recieving your message. They will send an email notifying you of delivery once it has bee given to the patient. If you have any questions or would like to follow up please call the gift shop at 111-222-3333." CssClass="msPara" />
        </div>
           
        <asp:Panel ID="pnlMsMsg" runat="server">

        <div class="msAll90 msPadTop30 msOH">
               
           <div class="msLeft50">
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_sName" runat="server" Text="Your name" CssClass="msFont11" />
                    <asp:TextBox ID="msSACYourName" runat="server" Value="Ask Jagsir" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_sEmail" runat="server" Text="Your email" CssClass="msFont11" />
                    <asp:TextBox ID="msSACYourEmail" runat="server" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_pName" runat="server" Text="Patient's name" CssClass="msFont11" />
                    <asp:TextBox ID="msSACPname" runat="server" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_pRoomNum" runat="server" Text="Patient's Room Number"  CssClass="msFont11" />
                    <asp:TextBox ID="msSACPrn" runat="server" CssClass="msTxtBox12 msPadAll2 msMargRL10 msRight" /> 
                </div>  
           </div>

             <div class="msRight45">

                 <div class="msMargBot10">
                    <asp:Label ID="mslbl_to" runat="server" Text="To:" CssClass="msFont11" />
                    <asp:TextBox ID="msSACTo" runat="server" CssClass="msTxtBox12 msPadAll2  msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_from" runat="server" Text="From:"  CssClass="msFont11" />
                    <asp:TextBox ID="msSACFrom" runat="server" CssClass="msTxtBox12 msPadAll2  msMargRL10 msRight" />
                </div>
                <br />
                <div class="msMargBot10">
                    <asp:Label ID="mslbl_yourMsg" runat="server" Text="Your message: " CssClass="msFont11" />
                    <asp:TextBox ID="msSACYourMessage" runat="server" Textmode="Multiline" Width="95%" style="font-family: Arial, Verdana, sans-serif;"  Rows="8" CssClass="msTxtBox12 msMargBot10 msMargTop20 msPadAll2" />
                </div>
             </div>
         
        </div>
               
        <div class="msAll90 msPadBot40 msOH">
            <asp:Button CssClass="btn msRight" runat="server" ID="btnSendFlowers" Text="Send now" OnCommand="btnSendFlowers_Command" CommandName="Insert"  />
        </div>
                  
      </asp:Panel>


      <asp:Panel ID="pnlMsSent" runat="server" Visible="false">

        <div class="msAll90 msOH msPadBot30 msPadTop30">
          <asp:Label ID="mSlblTks" runat="server" CssClass="msHeader3 msImp" />
        </div>

      </asp:Panel>

    </asp:Panel>

</asp:Content>
