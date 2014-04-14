<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="giftShopWelcome.aspx.cs" Theme="HealthTools" Inherits="giftShopWelcome" %>

<%--overriding content on the masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
     <%--needed to hold all content centre aligned--%>
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

    <%--container for responsiveness--%>
    <div class="bootContainer">

         <div class="col-xs-12 msPadBot20">
            <asp:Label ID="quizH2" runat="server" Text="Welcome to the BRDHC Gift Shop" CssClass="msHeader2" />
         </div>

         <div class="col-xs-12 col-sm-6 msPadBot30">

            <div class="col-xs-12">
            <%--Intro welcome message--%>
            <asp:Label ID="quizP" runat="server" Text="The BRDHC gift shop is run by the hospital auxiliary vounteers. Please click on the link 'send a card' below to send a free handwritten card to a loved one. You may also purchase flowers by clicking on link 'send flowers'. There are various bouquets available. You can add a free card to your purcahse at the checkout." CssClass="msPara" />
            </div>
            
            <div class="col-xs-12 msPadTop20">
                <%--Send a card--%>
                <div class="col-xs-12 col-sm-6 msCenter msPadTop20">
                <asp:Image ID="sendACard" ImageUrl="~/App_Themes/HealthTools/images/giftshop/card.png" runat="server" AlternateText="[image] of a sympathy card" Width="150px" />
                <br />
                <br />
                <asp:LinkButton CssClass="btn msBtnStartQuiz" PostBackUrl="~/giftShopSendACard.aspx" runat="server" ID="btnSendACard" Text="Send A Card" />
                </div>

                <%--Send flowers--%>
                <div class="col-xs-12 col-sm-6 msCenter msPadTop20">
                 <asp:Image ID="Image1" ImageUrl="~/App_Themes/HealthTools/images/giftshop/bouquetFront.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msImgLeft" />
                <br />
                <br />
                <asp:LinkButton CssClass="btn msBtnStartQuiz" PostBackUrl="~/giftShopSendFlowers.aspx" runat="server" ID="btnSendFlowers" Text="Send Flowers" />
                </div>
             </div>

        </div>

        <%--picture of the BRDHC gift shop--%>
        <div class="col-xs-12 col-sm-6 msCenter msPadTop30">
            <asp:Image ID="giftShop" ImageUrl="~/App_Themes/HealthTools/images/giftshop/giftShop.png" runat="server" AlternateText="[image] of a sympathy card" Width="90%" />
        </div>

      </div>
            
    </asp:Panel>
</asp:Content>