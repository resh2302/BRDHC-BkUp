<%@ Page Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" Theme="HealthTools" CodeFile="GiftShopStoreFront.aspx.cs" Inherits="GiftShopAdmin_GiftShopStoreFront" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
                
                <div class="bootContainer">

                <asp:Panel ID="Panel1" GroupingText="GIFT SHOP - STORE - INSERT" runat="server" CssClass="msPadTop10">

                <div class="col-xs-12">
                    <asp:Label runat="server" ID="lbl_photo" Text="Upload your photos below. Please note only jpgs under 700kb are accepted." CssClass="msMargTop50 msPara mainDark msMargBot10" />
                    <asp:FileUpload id="FileUploadPhoto" runat="server" />
                    <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
                    <br /><br />
                    <asp:Label runat="server" id="UploadStatusLabel" text="Upload status: " CssClass="msPara neutralLight msMargBot30" />
                </div>

               <div class="col-xs-12 col-sm-4 col-sm-offset-1">
               <asp:Label ID="lbl_nameI" runat="server" text="Bouquet name:" CssClass="msFont11" />
               </div>
               <div class="col-xs-12 col-sm-6">
               <asp:TextBox ID="txt_nameI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
               </div>

                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                <asp:Label ID="lbl_pictureI" runat="server" text="Bouquet picture:" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-6">
                <asp:TextBox ID="txt_pictureI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                </div>

                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                <asp:Label ID="lbl_priceI" runat="server" text="Bouquet price:" CssClass="msFont11" />
                </div>
                <div class="col-xs-12 col-sm-6">
                <asp:TextBox ID="txt_priceI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                </div>

                <div class="col-xs-12 col-sm-3 col-sm-offset-2">
                <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" CssClass="msMargBot10 msMargTop20" />
                 <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" CssClass="msMargBot10 msMargTop20" />
                 </div>

                </asp:Panel>

                <asp:Panel ID="pnl_cards" GroupingText="GIFT SHOP - STORE - UPDATE & DELETE" runat="server" CssClass="msPadTop10">

                <asp:Label runat="server" ID="lbl_mes" />

                <asp:Repeater runat="server" ID="rpt_all" OnItemCommand="subUpDel">

                <ItemTemplate>

                    <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("BouquetID") %>' />

                    <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                        <asp:Label ID="lbl_name" runat="server" text="Bouquet name:" CssClass="msFont11" />
                        </div>
                        <div class="col-xs-12 col-sm-6">
                        <asp:TextBox ID="txt_name" runat="server" Text='<%#Bind("Name") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                    </div>

                    <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                        <asp:Label ID="lbl_picture" runat="server" text="Bouquet picture:" CssClass="msFont11" />
                        </div>
                        <div class="col-xs-12 col-sm-6">
                        <asp:TextBox ID="txt_picture" runat="server" Text='<%#Bind("Picture") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                    </div>

                    <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                        <asp:Label ID="lbl_price" runat="server" text="Bouquet price:" CssClass="msFont11" />
                        </div>
                        <div class="col-xs-12 col-sm-6">
                        <asp:TextBox ID="txt_price" runat="server" Text='<%#Bind("Price") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                    </div>

                    <div class="col-xs-12 col-sm-6 col-sm-offset-2">
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CssClass="msMargBot10 msMargTop20" />
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CssClass="msMargBot10 msMargTop20" OnClientClick="return confirm('Confirm Delete?');" />
                                 <asp:Button ID="btn_cancel2" runat="server" Text="Cancel" CssClass="msMargBot10 msMargTop20" CommandName="Cancel" />
                      </div>

                </ItemTemplate>

                </asp:Repeater>

            </asp:Panel>

            </div>
            
            </asp:Panel>
</asp:Content>