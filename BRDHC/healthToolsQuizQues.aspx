<%@ Page Language="C#" MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="healthToolsQuizQues.aspx.cs" Theme="HealthTools" Inherits="healthToolsQuizQues" maintainScrollPositionOnPostBack="true"  %>


<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        
        <ContentTemplate>

            <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

          <div class="bootContainer">
            <div class="col-sm-12 msCenter">
            

                <asp:Panel ID="pnlQuiz" runat="server">

                <asp:Label ID="quizH2" runat="server" Text="Healthy Eating Quiz" CssClass="msHeader2 msCenter" />
                <br />
                <br />
                <asp:Label runat="server" ID="lblO" />
                </div>

                <asp:GridView ID="grid_quiz" runat="server" AllowPaging="true" PageSize="1" AutoGenerateColumns="false" DataKeyNames="QuestionID" OnPageIndexChanging="grid_page" GridLines="None" CssClass="col-sm-12 msCenter">

                    
                    <PagerStyle HorizontalAlign="Center" Font-Size="2.7em" CssClass="msQuizNum col-xs-1 col-sm-12" />
                    <PagerSettings Position="top" Mode="Numeric" />

                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="quizH3" runat="server" Text="Which is the healthier option?" CssClass="msHeader3 msPadBot20" />
                            </HeaderTemplate>

                            <ItemTemplate>
             
                                     <div class="col-sm-12 col-md-4 col-md-offset-2 msCenter msPadBot20">
                                        <asp:Image ID="imgTHIS" ImageUrl='<%#Eval ("THISimage") %>' runat="server" AlternateText="[image] of THIS" CssClass="quizImg" />
                                        <br />
                                        <br />
                                        <asp:Button CssClass="btn msBtnQuiz" runat="server" ID="msBtnThis" Text='<%#Eval ("THISname") %>' OnClick="btnThis_Click" CausesValidation="false" />
                                    </div>

                                     <div class="col-sm-12 col-md-4 msCenter msPadBot20">
                                        <asp:Image ID="imgTHAT" ImageUrl='<%#Eval ("THATimage") %>' runat="server" AlternateText="[image] of THAT" CssClass="quizImg" />
                                        <br />
                                        <br />
                                        <asp:Button CssClass="btn msBtnQuiz" PostBackUrl="~/healthToolsQuizQues.aspx" runat="server" ID="msBtnThat" Text='<%#Eval ("THATname") %>' CausesValidation="false" OnClick="btnThat_Click" />
                                    </div>
                              
<div class="col-sm-6 col-sm-offset-3 msCenter">
                                        <asp:Panel ID="pnl_mpeThis" runat="server" Visible="false" CssClass="msMpe">

                                            <asp:Label ID="lbl_ans" runat="server" CssClass="msHeader3" />

                                            <asp:HiddenField ID="hdf_thisAns" runat="server" Value='<%#Eval ("QuestionID") %>' />
                                            <%#Eval ("Thisname") %> has <%#Eval ("Thiscalories") %> calories and <%#Eval ("Thisfat") %>g of fat.
                                <br />
                                            <br />
                                            <%#Eval ("Thatname") %> has <%#Eval ("Thatcalories") %> calories and <%#Eval ("Thatfat") %>g of fat.
                                <br />
                                            <br />
                                            <asp:Button ID="btnCancelThis" runat="server" Text="Cancel" CausesValidation="false" />
                                            <asp:Button ID="btnOKThis" runat="server" Text="Next question" CausesValidation="false" OnClick="btnOK_Click" />
                                        </asp:Panel>

                                </div>

                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

              </asp:Panel>

            </div>

            <asp:Panel ID="pnlResults" runat="server">
                <div class="msPadBot10 msPadTop60">
                <asp:Label ID="lblResults" runat="server" CssClass="msHeader3 msImp" />
                </div>
                <%--<asp:image ImageUrl="~/App_Themes/HealthTools/images/quiz/gardenSalad.png" runat="server" />--%>
            </asp:Panel>

            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
