<%@ Page Language="C#"  MasterPageFile="~/healthTools.master" AutoEventWireup="true" Theme="HealthTools" CodeFile="GiftShopAdmin.aspx.cs" Inherits="GiftShopAdmin_GiftShopAdmin" %>

<%@ MasterType VirtualPath="~/healthTools.master" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
                
                <asp:Panel ID="pnl_cards" GroupingText="GIFT SHOP - CARDS" runat="server">
                    
                    <asp:GridView ID="grd_cards" runat="server" DataKeyNames="CardID" AutoGenerateSelectButton="True" AutoGenerateColumns="False" >
                        
                        <Columns>
                            
                            <asp:TemplateField>

                                <ItemTemplate>

                                    <asp:Label ID="lbl_Name" runat="server" Text="Name" />
                                    <asp:TextBox ID="txt_cardID" runat="server" Text='<%#Eval("CardID") %>' />
                                    <asp:TextBox ID="txt_sName" runat="server" Text='<%#Eval("senderName") %>' />
                                    <asp:TextBox ID="txt_sEmail" runat="server" Text='<%#Eval("senderEmail") %>' />
                                    <asp:TextBox ID="txt_pName" runat="server" Text='<%#Eval("patientName") %>' />
                                    <asp:TextBox ID="txt_pRoomNum" runat="server" Text='<%#Eval("patientRoom") %>' />
                                    <asp:TextBox ID="txt_to" runat="server" Text='<%#Eval("To") %>' />
                                    <asp:TextBox ID="txt_from" runat="server" Text='<%#Eval("From") %>' />
                                    <asp:TextBox ID="txt_message" runat="server" Text='<%#Eval("Message") %>' />

                                </ItemTemplate>

                            </asp:TemplateField>
                            
                        </Columns>

                    </asp:GridView>

                    <asp:DetailsView ID="dv_cards" runat="server" AutoGenerateRows="False" DataKeyNames="CardID" >
                
                        <Fields>

                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />

                        </Fields>

                    </asp:DetailsView>

                </asp:Panel>


                <asp:Panel ID="pnl_flowers" GroupingText="GIFT SHOP - FLOWERS" runat="server">
                    
                    <asp:GridView ID="gv_flowers" runat="server" DataKeyNames="CardID" AutoGenerateSelectButton="True" AutoGenerateColumns="False" >
                        
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

                </asp:Panel>

            </asp:Panel>

</asp:Content>