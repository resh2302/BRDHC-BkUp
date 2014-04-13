<%@ Page Language="C#" MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="giftShopSendFlowers.aspx.cs" Theme="HealthTools" Inherits="giftShopSendFlowers" maintainScrollPositionOnPostBack="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

    <div class="bootContainer">

       <div class="col-xs-12">
           <div class="col-xs-12 col-sm-6 msPadBot20">
                <asp:Label ID="lblH2" runat="server" Text="Send flowers to a loved one!" CssClass="msHeader2" />
                <asp:Label ID="lblPara" runat="server" Text="The gift shop has a selection of bouquets for you to choose from. They come in various sizes and colours." CssClass="msPara" />      
            </div>
          
            <div class="col-xs-12 col-sm-6">
                <div class="msMargTop30 msPadTop20 msPadBot20 msBorder">               
                    <asp:Image ID="imgCard" ImageUrl="~/App_Themes/HealthTools/images/giftshop/card.png" runat="server" AlternateText="[image] of a bouquet of flowers" Width="60px" CssClass="msLeft msPadRL5" BorderColor="Gray" />

                    <asp:Label ID="lblCard" runat="server" Text="All bouquets come with a handwritten card. You will given a space to write out your message during checkout." CssClass="msPara" />
                </div>
            </div>
        </div>

        <div class="col-xs-12 msPadTop30">
            <asp:Repeater runat="server" ID="rpt_shop" OnItemCommand="rpt_shop_ItemCommand">             
                <ItemTemplate>
                <div class="col-xs-6 col-sm-4 col-md-2 col-md-offset-1 msCenter">
                    <asp:Image ID="msBouquet" ImageUrl='<%#Eval ("Picture") %>' runat="server" AlternateText="[image] of a bouquet of flowers" Width="150px" CssClass="msRdImg" />
                    <asp:Label runat="server" ID="lblMsBqt1" Text='<%#Eval ("Price") %>' CssClass="msDisBlk msPadTop10" />
                    <asp:Button ID="btn_10" runat="server" CommandName="btn_10_Command" Text="Purchase" CssClass="btn msDisBlk msAllMarg20" />
                </div>
                </ItemTemplate>
            </asp:Repeater>
         </div>  
             
      </div>   
        
    </asp:Panel>

</asp:Content>