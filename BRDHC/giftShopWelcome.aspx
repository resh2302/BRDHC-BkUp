<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="giftShopWelcome.aspx.cs" Theme="HealthTools" Inherits="giftShopWelcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <div id="container">
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">
    <div class="msAll96 msOH">

         <div class="msLeft60">

            <asp:Label ID="quizH2" runat="server" Text="Welcome to the BRDHC Gift Shoppp" CssClass="msHeader2" />
            <asp:Label ID="quizP" runat="server" Text="The BRDHC gift shop is run by the hospital auxiliary vounteers. Please click on the link 'send a card' below to send a free handwritten card to a loved one. You may also purchase flowers by clicking on link 'send flowers'. There are various bouquets available. You can add a free card to your purcahse at the checkout." CssClass="msPara" />
            
            <div class="msOH msPadTop20 msPadBot40">
                <div class="msLeft50 msCenter">
                <asp:Image ID="sendACard" ImageUrl="~/App_Themes/HealthTools/images/giftshop/card.png" runat="server" AlternateText="[image] of a sympathy card" Width="150px" />
                <br />
                <br />
                <asp:LinkButton CssClass="btn msBtnStartQuiz" PostBackUrl="~/giftShopSendACard.aspx" runat="server" ID="btnSendACard" Text="Send A Card" />
                </div>

                <div class="msRight50 msCenter">
                 <asp:Image ID="Image1" ImageUrl="~/App_Themes/HealthTools/images/giftshop/bouquetFront.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msImgLeft" />
                <br />
                <br />
                <asp:LinkButton CssClass="btn msBtnStartQuiz" PostBackUrl="~/giftShopSendFlowers.aspx" runat="server" ID="btnSendFlowers" Text="Send Flowers" />
                </div>
             </div>
            
        </div>

        <div class="msRight40">

            <div class="msPadTop30">

            <asp:Image ID="giftShop" ImageUrl="~/App_Themes/HealthTools/images/giftshop/giftShop.png" runat="server" AlternateText="[image] of a sympathy card" />

            </div>

        </div>

      </div>
      
    </div>      
    </asp:Panel>
    </div>
</asp:Content>