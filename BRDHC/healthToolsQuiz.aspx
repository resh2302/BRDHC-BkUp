<%@ Page Language="C#" MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="healthToolsQuiz.aspx.cs" Theme="HealthTools" Inherits="healthToolsQuiz" %>

<%--overriding content on the masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <%--needed to hold all content centre aligned--%>
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

        <%--container for responsiveness--%>
        <div class="bootContainer">

            <%--Welcome intro message--%>
            <div class="col-sm-12">
                <asp:Label ID="quizH2" runat="server" Text="Take the Healthy Eating Quiz" CssClass="msHeader2" />
                <br />
                <asp:Label ID="quizP" runat="server" Text="Think you're making healthy food choices? Take the Healthy Eating Quiz to test your knowleged." CssClass="msPara" />
                <br />
                <asp:Label ID="quizH3" runat="server" Text="Which is the healthier option?" CssClass="msHeader3" />
                <br />
            </div>
                 
            <%--Bacon picture and label--%>
            <div class="col-sm-12 col-md-4 col-md-offset-2 msCenter msPadBot20">
                        <asp:Image ID="imgTHIS" ImageUrl="~/App_Themes/HealthTools/images/quiz/bacon.png" runat="server" AlternateText="[image] of THIS" CssClass="quizImg" />
                         <asp:Label ID="lblBacon" runat="server" Text="Bacon" CssClass="msPara" />
            </div>
            
            <%--Sausage picture and label--%>
            <div class="col-sm-12 col-md-4 msCenter msPadBot20">                          
                        <asp:Image ID="imgTHAT" ImageUrl='~/App_Themes/HealthTools/images/quiz/sausage.png' runat="server" AlternateText="[image] of THAT" CssClass="quizImg" />       
                        <asp:Label ID="lblSausage" runat="server" Text="Sausage" CssClass="msPara" />  
            </div>

            <%--Start the quiz button--%>
            <div class="col-sm-12 msPadBot30 msCenter"> 
            <asp:LinkButton CssClass="btn msBtnStartQuiz" PostBackUrl="~/healthToolsQuizQues.aspx" runat="server" ID="btnStartQuiz" Text="Start the Quiz" />
            </div>

      </div>

  </asp:Panel>

</asp:Content>