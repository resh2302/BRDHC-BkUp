﻿<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="healthToolsQuizQues.aspx.cs" Theme="HealthTools" Inherits="healthToolsQuizQues" maintainScrollPositionOnPostBack="true"  %>

<%--overriding content on the masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

         <%--needed to hold all content centre aligned--%>
         <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

          <%--container for responsiveness--%>
          <div class="bootContainer">
            
           <%--Shows the quiz questions, score is hidden--%>
           <asp:Panel ID="pnlQuiz" runat="server">

           <div class="col-sm-12 msCenter">
                <asp:Label ID="quizH2" runat="server" Text="Healthy Eating Quiz" CssClass="msHeader2 msCenter" />
                <br /><br />
           </div>

                <asp:GridView ID="grid_quiz" runat="server" AllowPaging="true" PageSize="1" AutoGenerateColumns="false" DataKeyNames="QuestionID" OnPageIndexChanging="grid_page" GridLines="None" CssClass="col-xs-12 msCenter">

                    
                    <PagerStyle HorizontalAlign="Center" Font-Size="2.7em" CssClass="msQuizNum col-xs-1 col-sm-12" />
                    <PagerSettings Position="top" Mode="Numeric" />

                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="quizH3" runat="server" Text="Which is the healthier option?" CssClass="msHeader3 msPadBot20" />
                            </HeaderTemplate>
                            <ItemTemplate>         
                                     
                                    <%--THIS image and button--%>
                                    <div class="col-xs-10 col-sm-4 col-sm-offset-2 msCenter msPadBot20">
                                        <asp:Image ID="imgTHIS" ImageUrl='<%#Eval ("THISimage") %>' runat="server" AlternateText="[image] of THIS" CssClass="quizImg" />
                                        <br /><br />
                                        <asp:Button CssClass="btn msBtnQuiz" runat="server" ID="msBtnThis" Text='<%#Eval ("THISname") %>' OnClick="btnThis_Click" CausesValidation="false" />
                                    </div>

                                     <%--THAT image and button--%>
                                     <div class="col-xs-10 col-sm-4 msCenter msPadBot20">
                                        <asp:Image ID="imgTHAT" ImageUrl='<%#Eval ("THATimage") %>' runat="server" AlternateText="[image] of THAT" CssClass="quizImg" />
                                        <br /><br />
                                        <asp:Button CssClass="btn msBtnQuiz" PostBackUrl="~/healthToolsQuizQues.aspx" runat="server" ID="msBtnThat" Text='<%#Eval ("THATname") %>' CausesValidation="false" OnClick="btnThat_Click" />
                                    </div>
                              
                                    <%--Answer panel--%>
                                    <div class="col-xs-12 col-sm-6 col-sm-offset-3 msCenter msMargBot30">       
                                        <asp:Panel ID="pnl_mpeThis" runat="server" Visible="false" CssClass="msMpe">
                                            <asp:Label ID="lbl_ans" runat="server" CssClass="msHeader3" />
                                            <asp:HiddenField ID="hdf_thisAns" runat="server" Value='<%#Eval ("QuestionID") %>' />
                                            <%#Eval ("Thisname") %> has <%#Eval ("Thiscalories") %> calories and <%#Eval ("Thisfat") %>g of fat.
                                <br /><br />
                                            <%#Eval ("Thatname") %> has <%#Eval ("Thatcalories") %> calories and <%#Eval ("Thatfat") %>g of fat.
                                <br /><br />
                                            <asp:Button ID="btnCancelThis" runat="server" Text="Cancel" CausesValidation="false" />
                                            <asp:Button ID="btnOKThis" runat="server" Text="Next question" CausesValidation="false" OnClick="btnOK_Click" />
                                        </asp:Panel>
                                    </div>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
              </asp:Panel>

            <%--Shows the score, quiz questions are hidden--%>
            <asp:Panel ID="pnlResults" runat="server" CssClass="msPadBot20 msPadTop20 msMargTop50">
                <asp:Label ID="lblResults" runat="server" CssClass="msHeader3 msImp" />
                <%--<asp:image ImageUrl="~/App_Themes/HealthTools/images/quiz/gardenSalad.png" runat="server" />--%>
            </asp:Panel>

         </div>
        </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
