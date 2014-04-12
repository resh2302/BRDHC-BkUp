<%@ Page Language="C#"  MasterPageFile="~/healthTools.master" AutoEventWireup="true" Theme="HealthTools" CodeFile="GiftShopAdmin.aspx.cs" Inherits="GiftShopAdmin_GiftShopAdmin" %>

<%@ MasterType VirtualPath="~/healthTools.master" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent msPadTop10" runat="server">
                
                <asp:Panel ID="pnl_cards" GroupingText="GIFT SHOP - CARDS" runat="server" CssClass="msPadTop10">

                   <div class="msAll98 msPadTop10">

                       <div class="msLeft40">
                    
                            <asp:GridView ID="grd_cards" runat="server" DataKeyNames="CardID" AutoGenerateColumns="False" >
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>

                                            <asp:LinkButton ID="lkb_select" runat="server" text="Select" CommandArgument='<%#Bind("CardID") %>' OnCommand="lkb_select_Command" CssClass="msPadRL5 msFont11 msPadAll5" />
                                            <asp:Label ID="txt_sName" runat="server" Text='<%#Eval("senderName") %>' CssClass="msPadRL5 msFont11 msPadAll5" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>
       
                       <div class="msRight60">

                            <asp:DetailsView ID="dv_cards" runat="server" AutoGenerateRows="False" DataKeyNames="CardID" >
                                <Fields>
                                    <asp:TemplateField>
                                        <ItemTemplate>

                                            <asp:Label ID="lbl_sName" runat="server" Text="Sender Name: " />
                                            <asp:Label ID="txt_sName" runat="server" Text='<%#Eval("senderName") %>' />
                                            <br />
                                            <asp:Label ID="lbl_sEmail" runat="server" Text="Sender Email: " />
                                            <asp:Label ID="txt_sEmail" runat="server" Text='<%#Eval("senderEmail") %>' />
                                            <br />
                                            <asp:Label ID="lbl_pName" runat="server" Text="Patient Name: " />
                                            <asp:Label ID="txt_pName" runat="server" Text='<%#Eval("patientName") %>' />
                                            <br />
                                            <asp:Label ID="lbl_pRoomNum" runat="server" Text="Patient Room Number: " />
                                            <asp:Label ID="txt_pRoomNum" runat="server" Text='<%#Eval("patientRoom") %>' />
                                            <br />
                                            <asp:Label ID="lbl_to" runat="server" Text="To: " />
                                            <asp:Label ID="txt_to" runat="server" Text='<%#Eval("To") %>' />
                                            <br />
                                            <asp:Label ID="lbl_from" runat="server" Text="From: " />
                                            <asp:Label ID="txt_from" runat="server" Text='<%#Eval("From") %>' />
                                            <br />
                                            <asp:Label ID="lbl_message" runat="server" Text="Message: " />
                                            <asp:Label ID="txt_message" runat="server" Text='<%#Eval("Message") %>' />
                                
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>

                        </div>

                       </div>

                    </asp:Panel>


                    <%--<asp:Panel ID="pnl_flowers" GroupingText="GIFT SHOP - FLOWERS" runat="server" CssClass="msPadTop10" />
                    
                        <asp:GridView ID="gv_flowers" runat="server" DataKeyNames="CardID" AutoGenerateColumns="False" >     
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>


                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <asp:DetailsView ID="dv_flowers" runat="server" AutoGenerateRows="False"  >      
                            <Fields>


                            </Fields>
                        </asp:DetailsView>

                    </asp:Panel>--%>


            </asp:Panel>

</asp:Content>