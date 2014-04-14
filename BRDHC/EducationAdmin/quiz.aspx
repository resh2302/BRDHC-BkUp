<%@ Page Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="quiz.aspx.cs" Theme="HealthTools" Inherits="EducationAdmin_quiz" maintainScrollPositionOnPostBack="true"  %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<%--overriding content on the masterpage--%>
<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

      <%--needed to hold all content centre aligned--%>
      <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
                
           <%--container for responsiveness--%>
          <div class="bootContainer">

                <%--subHeader and panel--%>
                <asp:Panel ID="Panel4" GroupingText="QUIZ - INSERT" runat="server">
                     
                    <div class="col-xs-12">       
                    <asp:Label ID="lbl_mes" runat="server" />
                    </div><br />
                                <%--Insert: THIS name label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THISnameI" runat="server" text="THIS Name" CssClass="msFont11" />
                                </div>          
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISnameI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THISnameI" runat="server" Text="*Required" ControlToValidate="txt_THISnameI" ValidationGroup="insert" />
                                </div>

                                <%--Insert: THIS Image label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THISimageI" runat="server" text="THIS Image" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISimageI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THISimageI" runat="server" Text="*Required" ControlToValidate="txt_THISimageI" ValidationGroup="insert" />
                                </div>

                                <%--Insert: THIS Calories label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THIScaloriesI" runat="server" text="THIS Calories" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THIScaloriesI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THIScaloriesI" runat="server" Text="*Required" ControlToValidate="txt_THIScaloriesI" ValidationGroup="insert" />
                                </div>

                                <%--Insert: THIS Fat label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THISfatI" runat="server" text="THIS Fat" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISfatI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THISfatI" runat="server" Text="*Required" ControlToValidate="txt_THISfatI" ValidationGroup="insert" />
                                </div>

                                <%--Insert: THAT Name label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THATnameI" runat="server" text="THAT Name" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATnameI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THATnameI" runat="server" Text="*Required" ControlToValidate="txt_THATnameI" ValidationGroup="insert" />
                                </div>

                                <%--Insert: THAT Image label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THATimageI" runat="server" text="THAT Image" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATimageI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THATimageI" runat="server" Text="*Required" ControlToValidate="txt_THATimageI" ValidationGroup="insert" />
                                </div>

                                <%--Insert: THAT Calories label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THATcaloriesI" runat="server" text="THAT Calories" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATcaloriesI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THATcaloriesI" runat="server" Text="*Required" ControlToValidate="txt_THATcaloriesI" ValidationGroup="insert" />
                                </div>
                            
                                <%--Insert: THAT Fat label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THATfatI" runat="server" text="THAT Fat" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATfatI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THATfatI" runat="server" Text="*Required" ControlToValidate="txt_THATfatI" ValidationGroup="insert" />
                                </div>              
                            
                                <%--Insert: Answer label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_AnswerI" runat="server" text="Answer" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_AnswerI" runat="server" CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_AnswerI" runat="server" Text="*Required" ControlToValidate="txt_AnswerI" ValidationGroup="insert" />
                                </div> 

                                <%--Insert and cancel buttons--%>
                                <div class="col-xs-12 col-sm-3 col-sm-offset-2">
                                    <div class="col-xs-6">
                                    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert" CssClass="msMargBot10 msMargTop20" ValidationGroup="insert" />
                                    </div>
                                    <div class="col-xs-6">
                                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" CssClass="msMargBot10 msMargTop20" CausesValidation="false" />
                                    </div>
                                </div>  
                </asp:Panel>   
                         
                             
                <asp:Panel ID="mspnl_ud" GroupingText="QUIZ - UPDATE and DELETE" runat="server">
                           
                        <asp:ListView ID="ltv_all" runat="server" OnItemCommand="ltv_all_ItemCommand">
                            <LayoutTemplate>
                                <table runat="server" id="Table1">
                                    <tr runat="server" id="itemPlaceholder"> </tr>
                                </table>
                                <%--Datapager--%>
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

                                <%--Update and Delete: THIS name label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THISnameE" runat="server" text="THIS Name" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISnameE" runat="server" Text='<%#Bind("THISname") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THISnameE" runat="server" Text="*Required" ControlToValidate="txt_THISnameE" ValidationGroup="update" />
                                </div>

                                <%--Update and Delete: THIS image label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THISimageE" runat="server" text="THIS Image" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISimageE" runat="server" Text='<%#Bind("THISimage") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THISimageE" runat="server" Text="*Required" ControlToValidate="txt_THISimageE" ValidationGroup="update" />
                                </div>

                                <%--Update and Delete: THIS calories label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THIScaloriesE" runat="server" text="THIS Calories" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THIScaloriesE" runat="server" Text='<%#Bind("THIScalories") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THIScaloriesE" runat="server" Text="*Required" ControlToValidate="txt_THIScaloriesE" ValidationGroup="update" />
                                </div>

                                <%--Update and Delete: THIS fat label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THISfatE" runat="server" text="THIS Fat" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THISfatE" runat="server" Text='<%#Bind("THISfat") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THISfatE" runat="server" Text="*Required" ControlToValidate="txt_THISfatE" ValidationGroup="update" />
                                </div>

                                <%--Update and Delete: THAT name label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THATnameE" runat="server" text="THAT Name" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATnameE" runat="server" Text='<%#Bind("THATname") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THATnameE" runat="server" Text="*Required" ControlToValidate="txt_THATnameE" ValidationGroup="update" />
                                </div>

                                <%--Update and Delete: THAT image label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THATimageE" runat="server" text="THAT Image" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATimageE" runat="server" Text='<%#Bind("THATimage") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THATimageE" runat="server" Text="*Required" ControlToValidate="txt_THATimageE" ValidationGroup="update" />
                                </div>
                                
                                <%--Update and Delete: THAT calories label and textbox--%>        
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THATcaloriesE" runat="server" text="THAT Calories" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                 <asp:TextBox ID="txt_THATcaloriesE" runat="server" Text='<%#Bind("THATcalories") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THATcaloriesE" runat="server" Text="*Required" ControlToValidate="txt_THATcaloriesE" ValidationGroup="update" />
                                </div>
                                
                                <%--Update and Delete: THAT fat label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_THATfatE" runat="server" text="THAT Fat" CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_THATfatE" runat="server" Text='<%#Bind("THATfat") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_THATfatE" runat="server" Text="*Required" ControlToValidate="txt_THATfatE" ValidationGroup="update" />
                                </div>   
                                
                                <%--Update and Delete: Answer label and textbox--%>
                                <div class="col-xs-12 col-sm-4 col-sm-offset-1">
                                <asp:Label ID="lbl_AnswerE" runat="server" text="Answer"  CssClass="msFont11" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                <asp:TextBox ID="txt_AnswerE" runat="server" Text='<%#Bind("Answer") %>' CssClass="msPadAll2 msMargRL10" Width="100%" />
                                <asp:RequiredFieldValidator ID="rfv_AnswerE" runat="server" Text="*Required" ControlToValidate="txt_AnswerE" ValidationGroup="update" />
                                </div>   
                                       
                                <%--Update, Delete Cancel buttons--%>
                                <div class="col-xs-12 col-sm-6 col-sm-offset-2">
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CssClass="msMargBot10 msMargTop20" ValidationGroup="update" />
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CssClass="msMargBot10 msMargTop20" OnClientClick="return confirm('Confirm Delete?');" CausesValidation="false" />
                                 <asp:Button ID="btn_cancel2" runat="server" Text="Cancel" CssClass="msMargBot10 msMargTop20" CommandName="Cancel" CausesValidation="false" />
                                  </div>
                            </ItemTemplate>
                        </asp:ListView>

                <%--File upload for quiz photos--%>
                <div class="col-xs-12">
                    <asp:Label runat="server" ID="lbl_photo" Text="Upload your photos below. Please note only jpgs under 700kb are accepted." CssClass="msMargTop50 msPara mainDark msMargBot10" />
                    <asp:FileUpload id="FileUploadPhoto" runat="server" />
                    <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
                    <br /><br />
                    <asp:Label runat="server" id="UploadStatusLabel" text="Upload status: " CssClass="msPara neutralLight msMargBot30" />
                </div>              

             </asp:Panel>
         </div>
     </asp:Panel>
</asp:Content>