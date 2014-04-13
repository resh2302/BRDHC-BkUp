<%@ Page Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="quiz.aspx.cs" Theme="HealthTools" Inherits="EducationAdmin_quiz" maintainScrollPositionOnPostBack="true"  %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<%--<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>--%>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
                
                <div class="bootContainer">

                <asp:Panel ID="Panel4" GroupingText="QUIZ - INSERT" runat="server">
                            
                    <asp:Label ID="lbl_mes" runat="server" />
                    <br />

                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label1" runat="server" text="THIS Name" CssClass="msFont11" />
                                </div>          
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISnameI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label2" runat="server" text="THIS Image" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISimageI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>


                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label3" runat="server" text="THIS Calories" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THIScaloriesI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>


                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label4" runat="server" text="THIS Fat" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISfatI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>


                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label5" runat="server" text="THAT Name" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATnameI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" /> 
                                </div>


                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label6" runat="server" text="THAT Image" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATimageI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>


                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label7" runat="server" text="THAT Calories" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATcaloriesI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>
                            
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label8" runat="server" text="THAT Fat" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATfatI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>              
                            
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label9" runat="server" text="Answer" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_AnswerI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div> 

                           
                                <div class="col-xs-12 col-sm-3 col-sm-offset-2">
                                <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert" CssClass="msMargBot10 msMargTop20" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" CssClass="msMargBot10 msMargTop20" />
                                </div>  

                

                </asp:Panel>   
                                        
                <asp:Panel ID="mspnl_ud" GroupingText="QUIZ - UPDATE and DELETE" runat="server">
                           
                        <asp:ListView ID="ltv_all" runat="server" OnItemCommand="subUpDel">

                            <LayoutTemplate>
                                <table runat="server" id="Table1">
                                    <tr runat="server" id="itemPlaceholder"> </tr>
                                </table>

                                <div class="col-sm-12 msCenter">
                                <asp:DataPager runat="server" ID="DataPager" PageSize="1" PagedControlID="ltv_all" OnPreRender="DataPager_PreRender"  >
                                    <Fields>
                                    <asp:NumericPagerField PreviousPageText="<--" NextPageText="-->" ButtonCount="10" NumericButtonCssClass="mslv_num" CurrentPageLabelCssClass="mslv_num_current" />
                                     </Fields>
                                 </asp:DataPager>
                                </div>

                            </LayoutTemplate>
                            
                            <ItemTemplate>

                                <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("QuestionID") %>' />

                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label10" runat="server" text="THIS Name" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISnameE" runat="server" Text='<%#Bind("THISname") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label11" runat="server" text="THIS Image" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISimageE" runat="server" Text='<%#Bind("THISimage") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label12" runat="server" text="THIS Calories" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THIScaloriesE" runat="server" Text='<%#Bind("THIScalories") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label13" runat="server" text="THIS Fat" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISfatE" runat="server" Text='<%#Bind("THISfat") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label14" runat="server" text="THAT Name" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATnameE" runat="server" Text='<%#Bind("THATname") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label15" runat="server" text="THAT Image" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATimageE" runat="server" Text='<%#Bind("THATimage") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>
                                        
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label16" runat="server" text="THAT Calories" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                 <asp:TextBox ID="txt_THATcaloriesE" runat="server" Text='<%#Bind("THATcalories") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>
            
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label17" runat="server" text="THAT Fat" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATfatE" runat="server" Text='<%#Bind("THATfat") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>   
                                
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="Label18" runat="server" text="Answer"  CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_AnswerE" runat="server" Text='<%#Bind("Answer") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                </div>   
                                       
                                <div class="col-xs-12 col-sm-6 col-sm-offset-2">
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CssClass="msMargBot10 msMargTop20" />
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CssClass="msMargBot10 msMargTop20" OnClientClick="return confirm('Confirm Delete?');" />
                                 <asp:Button ID="btn_cancel2" runat="server" Text="Cancel" CssClass="msMargBot10 msMargTop20" CommandName="Cancel" />
                                  </div>

                            </ItemTemplate>
                        </asp:ListView>

                <div class="col-xs-12">
                    <asp:Label runat="server" ID="lbl_photo" Text="Upload your photos below. Please note only jpgs under 700kb are accepted." CssClass="msMargTop50 msPara mainDark msMargBot10" />
                    <asp:FileUpload id="FileUploadPhoto" runat="server" />
                    <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
                    <br /><br />
                    <asp:Label runat="server" id="UploadStatusLabel" text="Upload status: " CssClass="msPara neutralLight msMargBot30" />
                </div>

                 </div>

                </asp:Panel>
            </asp:Panel>
</asp:Content>