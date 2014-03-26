<%@ Page Language="C#" MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="giftShopSendFlowers.aspx.cs" Theme="HealthTools" Inherits="giftShopSendFlowers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

      <div class="msAll90">

         <div class="msLeft50 msPadBot30">

            <asp:Label ID="lblH2" runat="server" Text="Send flowers to a loved one!" CssClass="msHeader2" />
            <asp:Label ID="lblPara" runat="server" Text="The gift shop has a selection of bouquets for you to choose from. They come in various sizes and colours." CssClass="msPara" />
        
        </div>
          
        <div class="msRight50">

            <div class="msMargTop30 msPadTop20 msPadBot20 msBorder">
               
                <asp:Image ID="imgCard" ImageUrl="~/App_Themes/HealthTools/images/giftshop/card.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="60px" CssClass="msLeft msPadRL5" BorderColor="Gray" />

                <asp:Label ID="lblCard" runat="server" Text="All bouquets come with a handwritten card. You will given a space to write out your message during checkout." CssClass="msPara" />

            </div>

        </div>

      </div>

    <div class="msAll90 msOH">
            
        <div class="msAll98 msPadTop20 msCenter">

            <div class="msLeft msPadRL5">

            <asp:Image ID="msBouquet1" ImageUrl="~/App_Themes/HealthTools/images/giftshop/bouquet1.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msRdImg" />

            <asp:Label runat="server" ID="lblMsBqt1" Text="Price: $10.00" CssClass="msDisBlk msPadTop10" />

         <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                <input type="hidden" name="cmd" value="_xclick" />
                <input type="hidden" name="business" value="markiGiftshop@blah.com" />
                <input type='hidden' name='currency_code' value='CAD'/>
                <input type="hidden" name="item_name" value="BRDHC Bouquet - 10.00" />
                <input type="hidden" name="amount" value="10.00" /> 
                <input type="submit" value="Purchase" class="btn msDisBlk msMargTop10" />

           </form>            

            </div>

            <div class="msLeft msPadRL5">

            <asp:Image ID="msBouquet2" ImageUrl="~/App_Themes/HealthTools/images/giftshop/bouquet4.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msRdImg" />

            <asp:Label runat="server" ID="lblMsBqt2" Text="Price: $20.00" CssClass="msDisBlk msPadTop10" />

            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                <input type="hidden" name="cmd" value="_xclick" />
                <input type="hidden" name="business" value="markiGiftshop@blah.com" />
                <input type='hidden' name='currency_code' value='CAD'/>
                <input type="hidden" name="item_name" value="BRDHC Bouquet - 20.00" />
                <input type="hidden" name="amount" value="20.00" /> 
                <input type="submit" value="Purchase" class="btn msDisBlk msMargTop10" />

            </form>

            </div>


            <div class="msLeft msPadRL5">
            
            <asp:Image ID="msBouquet3" ImageUrl="~/App_Themes/HealthTools/images/giftshop/bouquet3.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msRdImg" />

             <asp:Label runat="server" ID="lblMsBqt3" Text="Price: $30.00" CssClass="msDisBlk msPadTop10" />

            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                <input type="hidden" name="cmd" value="_xclick" />
                <input type="hidden" name="business" value="markiGiftshop@blah.com" />
                <input type='hidden' name='currency_code' value='CAD'/>
                <input type="hidden" name="item_name" value="BRDHC Bouquet - 30.00" />
                <input type="hidden" name="amount" value="30.00" /> 
                <input type="submit" value="Purchase" class="btn msDisBlk msMargTop10" />

            </form>

            </div>
            
            <div class="msLeft msPadRL5">

            <asp:Image ID="msBouquet4" ImageUrl="~/App_Themes/HealthTools/images/giftshop/bouquet2.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msRdImg" />

            <asp:Label runat="server" ID="Label1" Text="Price: $40.00" CssClass="msDisBlk msPadTop10" />

            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                <input type="hidden" name="cmd" value="_xclick" />
                <input type="hidden" name="business" value="markiGiftshop@blah.com" />
                <input type='hidden' name='currency_code' value='CAD'/>
                <input type="hidden" name="item_name" value="BRDHC Bouquet - 40.00" />
                <input type="hidden" name="amount" value="40.00" /> 
                <input type="submit" value="Purchase" class="btn msDisBlk msMargTop10" />

            </form>

            </div>

            <div class="msLeft msPadRL5">

            <asp:Image ID="msBouquet5" ImageUrl="~/App_Themes/HealthTools/images/giftshop/bouquet5.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msRdImg" />

             <asp:Label runat="server" ID="Label2" Text="Price: $50.00" CssClass="msDisBlk msPadTop10" />

              <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                <input type="hidden" name="cmd" value="_xclick" />
                <input type="hidden" name="business" value="markiGiftshop@blah.com" />
                <input type='hidden' name='currency_code' value='CAD'/>
                <input type="hidden" name="item_name" value="BRDHC Bouquet - 50.00" />
                <input type="hidden" name="amount" value="50.00" /> 
                <input type="submit" value="Purchase" class="btn msDisBlk msMargTop10" />

            </form>

            </div>
                 
         </div>

    </div>

        
    </asp:Panel>

</asp:Content>