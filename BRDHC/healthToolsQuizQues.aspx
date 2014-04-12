﻿<%@ Page Language="C#" MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="healthToolsQuizQues.aspx.cs" Theme="HealthTools" Inherits="healthToolsQuizQues" %>


<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        
        <ContentTemplate>

            <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">
            
            <asp:Panel ID="pnlResults" runat="server">
                <asp:Label ID="lblResults" runat="server" CssClass="msHeader3 msImp" />
            </asp:Panel>

                <asp:Label ID="quizH2" runat="server" Text="Healthy Eating Quiz" CssClass="msHeader2 msCenter" />
                <br />
                <br />
                <asp:Label runat="server" ID="lblO" />

                <div class="msAll70">

                <asp:GridView ID="grid_quiz" runat="server" AllowPaging="true" PageSize="1" AutoGenerateColumns="false" DataKeyNames="QuestionID" OnPageIndexChanging="grid_page" GridLines="None">

                    <PagerStyle HorizontalAlign="Center" Font-Size="2.7em" CssClass="msQuizNum" />
                    <PagerSettings Position="top" Mode="Numeric" />

                    <Columns>

                        <asp:TemplateField>

                            <HeaderTemplate>
                                <asp:Label ID="quizH3" runat="server" Text="Which is the healthier option?" CssClass="msHeader3 msPadBot20" />
                            </HeaderTemplate>

                            <ItemTemplate>

                                

                                    <div class="msLeft50 msCenter msPadBot30">

                                        <asp:Image ID="imgTHIS" ImageUrl='<%#Eval ("THISimage") %>' runat="server" AlternateText="[image] of THIS" CssClass="quizImg" />
                                        <br />
                                        <br />

                                        <asp:Button CssClass="btn msBtnQuiz" runat="server" ID="msBtnThis" Text='<%#Eval ("THISname") %>' OnClick="btnThis_Click" CausesValidation="false" />

                                    </div>

                                    <div class="msRight50 msCenter msPadBot30">

                                        <asp:Image ID="imgTHAT" ImageUrl='<%#Eval ("THATimage") %>' runat="server" AlternateText="[image] of THAT" CssClass="quizImg" />
                                        <br />
                                        <br />

                                        <asp:Button CssClass="btn msBtnQuiz" PostBackUrl="~/healthToolsQuizQues.aspx" runat="server" ID="msBtnThat" Text='<%#Eval ("THATname") %>' CausesValidation="false" OnClick="btnThat_Click" />

                                    </div>
                                
                                </div>

                                <div class="msAll60 msCenter msOH msPadBot30">

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

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
