<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="giftShopSendFlowers.aspx.cs" Theme="HealthTools" Inherits="giftShopSendFlowers" %>

<%--overriding content on the masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <%--needed to hold all content centre aligned--%>
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

    <%--container for responsiveness--%>
    <div class="bootContainer">

       <div class="col-xs-12">
           <%--Greeting message--%>
           <div class="col-xs-12 col-sm-6 msPadBot20">
                <asp:Label ID="lblH2" runat="server" Text="Send flowers to a loved one!" CssClass="msHeader2" />
                <asp:Label ID="lblPara" runat="server" Text="The gift shop has a selection of bouquets for you to choose from. They come in various sizes and colours." CssClass="msPara" />    
            </div>
          <%--Note about cards with flowers--%>
            <div class="col-xs-12 col-sm-6">
                <div class="msMargTop30 msPadTop20 msPadBot20 msBorder">               
                    <asp:Image ID="imgCard" ImageUrl="~/App_Themes/HealthTools/images/giftshop/card.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="60px" CssClass="msLeft msPadRL5" BorderColor="Gray" />
                    <asp:Label ID="lblCard" runat="server" Text="All bouquets come with a handwritten card. You will given a space to write out your message during checkout." CssClass="msPara" />
                </div>
            </div>
        </div>

        <%--Flowers picture, price and purchase in a repeater--%>
        <div class="col-xs-12 msPadTop30">
            <asp:Repeater runat="server" ID="rpt_shop" OnItemCommand="rpt_shop_ItemCommand">             
                <ItemTemplate>
                <div class="col-xs-6 col-sm-4 col-md-3 msCenter">
                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval ("Name") %>' />
                    <asp:Image ID="msBouquet" ImageUrl='<%#Eval ("Picture") %>' runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msRdImg" />
                    <%--text and Eval inside the text field--%>
                    <div class="col-xs-12 msPadTop20 msPadBot10">
                    <asp:Label runat="server" ID="lblMsPrice" Text="Price :" />
                    <asp:Label runat="server" ID="lblMsBqt1" Text='<%#Eval ("Price") %>' />
                    </div>
                    <asp:Button ID="btn_10" runat="server" CommandName="btn_10_Command" Text="Purchase" CssClass="btn msDisBlk msAllMarg20" />
                </div>
                </ItemTemplate>
            </asp:Repeater>
         </div>            
      </div>   
        
    </asp:Panel>

</asp:Content>