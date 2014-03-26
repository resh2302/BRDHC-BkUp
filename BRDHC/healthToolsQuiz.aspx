<%@ Page Language="C#" MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="healthToolsQuiz.aspx.cs" Theme="HealthTools" Inherits="healthToolsQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

            <asp:Label ID="quizH2" runat="server" Text="Take the Healthy Eating Quiz" CssClass="msHeader2" />
            <br />
            <asp:Label ID="quizP" runat="server" Text="Think you're making healthy food choices? Take the Healthy Eating Quiz to test your knowleged." CssClass="msPara" />
            <br />
            <asp:Label ID="quizH3" runat="server" Text="Which is the healthier option?" CssClass="msHeader3" />
            <br />
        
        <div class="msAll50 msPadBot30">

            <div class="msLeft50 msCenter msPadBot20">

                        <asp:Image ID="imgTHIS" ImageUrl="~/App_Themes/HealthTools/images/quiz/bacon.png" runat="server" AlternateText="[image] of THIS" CssClass="quizImg" />
                         <asp:Label ID="lblBacon" runat="server" Text="Bacon" CssClass="msPara" />
                
            </div>
        
            <div class="msRight50 msCenter msPadBot20">  
                         
                        <asp:Image ID="imgTHAT" ImageUrl='~/App_Themes/HealthTools/images/quiz/sausage.png' runat="server" AlternateText="[image] of THAT" CssClass="quizImg" />       
                        <asp:Label ID="lblSausage" runat="server" Text="Sausage" CssClass="msPara" />  

            </div>

            <div class="msCenter msPadBot30"> 

            <asp:LinkButton CssClass="btn msBtnStartQuiz" PostBackUrl="~/healthToolsQuizQues.aspx" runat="server" ID="btnStartQuiz" Text="Start the Quiz" />

            </div>


        </div>
            
        
    </asp:Panel>

</asp:Content>