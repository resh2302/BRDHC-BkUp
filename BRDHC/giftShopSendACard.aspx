<%@ Page Language="C#" MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="giftShopSendACard.aspx.cs" Theme="HealthTools" Inherits="giftShopSendACard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

        <div class="msLeft60">

                <asp:Label ID="quizH2" runat="server" Text="Send a handwritten card to a loved one" CssClass="msHeader2" />
                <asp:Label ID="quizP" runat="server" Text="Send a handwritten card to a loved one is a FREE service provided by the BRDHC auxilary gift shop volunteers. They do their very best to deliver your card within 24 hours of recieving your message. They will send an email notifying you of delivery once it has bee given to the patient. If you have any questions or would like to follow up please call the gift shop at 123-345-6789." CssClass="msPara" />
        
        </div>
            
        <asp:Panel ID="pnlMsMsg" runat="server">

            <div class="msRight30 msCenter msPadTop60">

                <asp:TextBox ID="msSACYourName" runat="server" Text="Your name" CssClass="msTxtBox12 msMargBot10 msPadAll2" />
                <asp:TextBox ID="msSACYourEmail" runat="server" Text="Your email" CssClass="msTxtBox12 msMargBot10 msPadAll2" />

                <asp:TextBox ID="msSACPname" runat="server" Text="Patient's name" CssClass="msTxtBox12 msMargTop10 msMargBot10 msPadAll2" />
                <asp:TextBox ID="msSACPrn" runat="server" Text="Patient's room number" CssClass="msTxtBox12 msMargBot10 msPadAll2" />

            </div>

        <div class="msAll98 msOH">

            <div class="msLeft30">

            <asp:TextBox ID="msSACTo" runat="server" Text="To:" CssClass="msTxtBox12 msMargBot10 msMargTop20 msPadAll2" />
            <asp:TextBox ID="msSACFrom" runat="server" Text="From:" CssClass="msTxtBox12 msMargBot10 msPadAll2" />

             </div>

            <div class="msRight70">

            <asp:TextBox ID="msSACYourMessage" runat="server" Text="Your name" Textmode="Multiline" Width="90%" style="font-family: Arial, Verdana, sans-serif;"  Rows="8" CssClass="msTxtBox12 msMargBot10 msMargTop20 msPadAll2" />

             </div>
         
        </div>
               
        <div class="msAll90 msTRight">

            <asp:Button CssClass="btn" runat="server" ID="btnSendFlowers" Text="Send now" OnCommand="btnSendFlowers_Command" CommandName="Insert"  />
            <%--OnClick="btnSendFlowers_Click"--%>

        </div>    
              
       
      </asp:Panel>

      <asp:Panel ID="pnlMsSent" runat="server" Visible="false">

        <div class="msAll90 msOH msPadBot30 msPadTop30">

           <asp:Label ID="lbl_output" runat="server" />

          <asp:Label ID="mSlblTks" runat="server" Text="Your message has been sent. <br/> You will be notified once the card has been delivered!" CssClass="msHeader3" />
        
        </div>

      </asp:Panel>
                   
    </asp:Panel>

</asp:Content>