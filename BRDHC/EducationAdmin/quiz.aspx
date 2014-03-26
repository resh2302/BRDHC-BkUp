<%@ Page Language="C#" MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="quiz.aspx.cs" Theme="HealthTools" Inherits="EducationAdmin_quiz" %>

<%@ MasterType VirtualPath="~/healthTools.master" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
                
                <asp:Panel ID="Panel4" GroupingText="QUIZ - INSERT" runat="server">
                       
                            <asp:Label ID="lbl_mes" runat="server" />
                            <br />

                    <div class="msFormAll">

                        <div class="msFormLeft">
                            <asp:Label ID="Label1" runat="server" text="THIS Name" CssClass="msFormLabel" />
                            <asp:Label ID="Label2" runat="server" text="THIS Image" CssClass="msFormLabel" />
                            <asp:Label ID="Label3" runat="server" text="THIS Calories" CssClass="msFormLabel" />
                            <asp:Label ID="Label4" runat="server" text="THIS Fat" CssClass="msFormLabel" />
                            <asp:Label ID="Label5" runat="server" text="THAT Name" CssClass="msFormLabel" />
                            <asp:Label ID="Label6" runat="server" text="THAT Image" CssClass="msFormLabel" />
                            <asp:Label ID="Label7" runat="server" text="THAT Calories" CssClass="msFormLabel" />
                            <asp:Label ID="Label8" runat="server" text="THAT Fat" CssClass="msFormLabel" />
                            <asp:Label ID="Label9" runat="server" text="Answer" CssClass="msFormLabel" />
                        </div>
                        
                        <div class="msFormRight">
                            <asp:TextBox ID="txt_THISnameI" runat="server" />
                            <asp:TextBox ID="txt_THISimageI" runat="server" />
                            <asp:TextBox ID="txt_THIScaloriesI" runat="server" />
                            <asp:TextBox ID="txt_THISfatI" runat="server" />
                            <asp:TextBox ID="txt_THATnameI" runat="server" /> 
                            <asp:TextBox ID="txt_THATimageI" runat="server" />
                            <asp:TextBox ID="txt_THATcaloriesI" runat="server" />
                            <asp:TextBox ID="txt_THATfatI" runat="server" />                           
                            <asp:TextBox ID="txt_AnswerI" runat="server" />
                        </div>
                    </div>

                            <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert" />
                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" />  
                        <br />
                        <br /> 
                </asp:Panel>        
                        
                <asp:Panel ID="mspnl_ud" GroupingText="QUIZ - UPDATE and DELETE" runat="server">
                           
                        <asp:ListView ID="rpt_all" runat="server" OnItemCommand="subUpDel">

                            <LayoutTemplate>
                                <table runat="server" id="Table1">
                                    <tr runat="server" id="itemPlaceholder"> </tr>
                                </table>

                                <asp:DataPager runat="server" ID="DataPager" PageSize="1" PagedControlID="rpt_all" OnPreRender="DataPager_PreRender">
                                    <Fields>
                                    <asp:NumericPagerField PreviousPageText="<--" NextPageText="-->" ButtonCount="10" NumericButtonCssClass="mslv_num" CurrentPageLabelCssClass="mslv_num_current" />
                                     </Fields>
                                 </asp:DataPager>
                            </LayoutTemplate>
                            
                            <ItemTemplate>
                                        <br />
                                        <br />
                                        <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("QuestionID") %>' />
                                        <%--  Id refering to column name --%>
                                        
                                        <asp:Label ID="Label10" runat="server" text="THIS Name" style="padding:20px;" />
                                        <asp:TextBox ID="txt_THISnameE" runat="server" Text='<%#Bind("THISname") %>' />
                                        <br />
                                        <asp:Label ID="Label11" runat="server" text="THIS Image" style="padding:20px;" />
                                        <asp:TextBox ID="txt_THISimageE" runat="server" Text='<%#Bind("THISimage") %>' />
                                        <br />
                                        <asp:Label ID="Label12" runat="server" text="THIS Calories" style="padding:20px;" />
                                        <asp:TextBox ID="txt_THIScaloriesE" runat="server" Text='<%#Bind("THIScalories") %>' />
                                        <br />                               
                                        <asp:Label ID="Label13" runat="server" text="THIS Fat" style="padding:20px;" />
                                        <asp:TextBox ID="txt_THISfatE" runat="server" Text='<%#Bind("THISfat") %>' />
                                        <br />
                                        <asp:Label ID="Label14" runat="server" text="THAT Name" style="padding:20px;" />
                                        <asp:TextBox ID="txt_THATnameE" runat="server" Text='<%#Bind("THATname") %>' />
                                        <br />
                                        <asp:Label ID="Label15" runat="server" text="THAT Image" style="padding:20px;" />
                                        <asp:TextBox ID="txt_THATimageE" runat="server" Text='<%#Bind("THATimage") %>' />
                                        <br />
                                        <asp:Label ID="Label16" runat="server" text="THAT Calories" style="padding:20px;" />
                                        <asp:TextBox ID="txt_THATcaloriesE" runat="server" Text='<%#Bind("THATcalories") %>' />
                                        <br />
                                        <asp:Label ID="Label17" runat="server" text="THAT Fat" style="padding:20px;" />
                                        <asp:TextBox ID="txt_THATfatE" runat="server" Text='<%#Bind("THATfat") %>' />
                                        <br />
                                        <asp:Label ID="Label18" runat="server" text="Answer" style="padding:20px;" />
                                        <asp:TextBox ID="txt_AnswerE" runat="server" Text='<%#Bind("Answer") %>' />
                                        <br />
                                        <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                                        <asp:Button ID="btn_cancel2" runat="server" Text="Cancel" CommandName="Cancel" />
                                        <br />
                                        <br />
                            </ItemTemplate>
                        </asp:ListView>
                    <br />


                </asp:Panel>
            </asp:Panel>
</asp:Content>