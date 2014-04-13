<%@ Page Language="C#"  MasterPageFile="~/brdhc.master"  AutoEventWireup="true" Theme="HealthTools" CodeFile="GiftShopAdmin.aspx.cs" Inherits="GiftShopAdmin_GiftShopAdmin" maintainScrollPositionOnPostBack="true" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<%--<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>--%>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
                
                <asp:Panel ID="pnl_cards" GroupingText="GIFT SHOP - CARDS" runat="server" CssClass="msPadTop10">

                <div class="bootContainer">   

                            <asp:Label runat="server" ID="lbl_mes" CssClass="msFont11 attn" />
                    
                            <asp:GridView ID="grd_cards" runat="server" DataKeyNames="CardID" AutoGenerateColumns="False" CssClass="col-xs-12 col-sm-6" GridLines="None" >
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="msPadBot10 msPadTop10">

                                            <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" OnCommand="btn_delete_Command" CommandArgument='<%#Bind("CardID") %>' CssClass="btn" OnClientClick="return confirm('Confirm Delete?');" />

                                            <asp:LinkButton ID="lkb_select" runat="server" text="View >" CommandArgument='<%#Bind("CardID") %>' OnCommand="lkb_select_Command" CssClass="msPadRL5 msFont11 msPadAll5" />
                                            
                                            <asp:Label ID="txt_sName" runat="server" Text='<%#Eval("senderName") %>' CssClass="msPadRL5 msFont11 msPadAll5" />
                                            

                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

       
                       <div class="col-xs-12 col-sm-6">

                            <asp:DetailsView ID="dv_cards" runat="server" AutoGenerateRows="False" DataKeyNames="CardID" GridLines="None" CssClass="msMargTop30" >                              
                                <Fields>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                                                                        
                                            <asp:Label ID="lbl_sName" runat="server" Text="Sender Name: " CssClass="msFont11 neutralLight" />
                                            <asp:Label ID="txt_sName" runat="server" Text='<%#Eval("senderName") %>' CssClass="msFont11" />
                                            <br />
                                            <asp:Label ID="lbl_sEmail" runat="server" Text="Sender Email: " CssClass="msFont11 neutralLight" />
                                            <asp:Label ID="txt_sEmail" runat="server" Text='<%#Eval("senderEmail") %>' CssClass="msFont11" />
                                            <br />
                                            <asp:Label ID="lbl_pName" runat="server" Text="Patient Name: " CssClass="msFont11 neutralLight" />
                                            <asp:Label ID="txt_pName" runat="server" Text='<%#Eval("patientName") %>' CssClass="msFont11" />
                                            <br />
                                            <asp:Label ID="lbl_pRoomNum" runat="server" Text="Patient Room Number: " CssClass="msFont11 neutralLight" />
                                            <asp:Label ID="txt_pRoomNum" runat="server" Text='<%#Eval("patientRoom") %>' CssClass="msFont11" />
                                            <br />
                                            <asp:Label ID="lbl_to" runat="server" Text="To: " CssClass="msFont11 neutralLight" />
                                            <asp:Label ID="txt_to" runat="server" Text='<%#Eval("To") %>' CssClass="msFont11" />
                                            <br />
                                            <asp:Label ID="lbl_from" runat="server" Text="From: " CssClass="msFont11 neutralLight" />
                                            <asp:Label ID="txt_from" runat="server" Text='<%#Eval("From") %>' CssClass="msFont11" />
                                            <br />
                                            <asp:Label ID="lbl_message" runat="server" Text="Message: " CssClass="msFont11 neutralLight" />
                                            <asp:Label ID="txt_message" runat="server" Text='<%#Eval("Message") %>' CssClass="msFont11" />

                                      </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>

                        </div>

                    </div>

                    </asp:Panel>
    
            </asp:Panel>

</asp:Content>