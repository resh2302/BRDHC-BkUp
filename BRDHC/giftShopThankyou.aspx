<%@ Page Language="C#"  MasterPageFile="~/healthTools.master" AutoEventWireup="true" CodeFile="giftShopThankyou.aspx.cs" Inherits="giftShopThankyou" Theme="HealthTools" %>

<%--overriding content on the masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <%--needed to hold all content centre aligned--%>
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

     <%--container for responsiveness--%>
    <div class="bootContainer">

    <%--panel holding content pre-send--%>
    <asp:Panel ID="pnlMsMsg" runat="server">

     <%--thank you message after flowers have been sent--%>
    <div class="col-xs-12 col-sm-8 col-sm-offset-2">
     <asp:Label runat="server" ID="lbl_thk" CssClass="msHeader4 msImp msPadTop30" />
    </div>

        <div class="col-xs-12">

       <div class="col-xs-12">
                <asp:Label ID="quizH2" runat="server" Text="Send a handwritten card to a loved one" CssClass="msHeader2" />
        </div>

        <div class="col-xs-12 col-sm-6 msPadBot40 msPadTop10">
                <asp:Label ID="quizP" runat="server" Text="Send a handwritten card to a loved one is a FREE service provided by the BRDHC auxilary gift shop volunteers. They do their very best to deliver your card within 24 hours of recieving your message. They will send an email notifying you of delivery once it has bee given to the patient. If you have any questions or would like to follow up please call the gift shop at 111-222-3333." CssClass="msPara msPadR10" />
        </div>
                 
        <div class="col-xs-12 col-sm-6 msPadTop40">
           <%--Your name label and textbox--%>               
           <div class="col-xs-12"> 
               <div class="col-xs-12 col-sm-6">
                    <asp:Label ID="mslbl_sName" runat="server" Text="Your name" CssClass="msFont11" AssociatedControlID="msSACYourName" />
                </div>
                <div class="col-xs-12 col-sm-6">
                    <asp:TextBox ID="msSACYourName" runat="server" CssClass="msPadAll2" Width="100%" />
                    <asp:RequiredFieldValidator ID="rfv_sName" runat="server" Text="*Required" ControlToValidate="msSACYourName" ValidationGroup="insert" />
                </div>
            </div>

            <%--Your email label and textbox--%>
            <div class="col-xs-12"> 
               <div class="col-xs-12 col-sm-6">
                    <asp:Label ID="mslbl_sEmail" runat="server" Text="Your email" CssClass="msFont11" AssociatedControlID="msSACYourEmail" />
                </div>
                <div class="col-xs-12 col-sm-6">
                    <asp:TextBox ID="msSACYourEmail" runat="server" CssClass="msPadAll2" Width="100%" />
                    <asp:RequiredFieldValidator ID="rfv_sEmail" runat="server" Text="*Required" ControlToValidate="msSACYourEmail" ValidationGroup="insert" />
                </div>
            </div>

            <%--Patient's name label and textbox--%>
            <div class="col-xs-12"> 
               <div class="col-xs-12 col-sm-6">
                    <asp:Label ID="mslbl_pName" runat="server" Text="Patient's name" CssClass="msFont11" AssociatedControlID="msSACPname" />
                </div>
                <div class="col-xs-12 col-sm-6">
                    <asp:TextBox ID="msSACPname" runat="server" CssClass="msPadAll2" Width="100%" />
                    <asp:RequiredFieldValidator ID="rfv_pName" runat="server" Text="*Required" ControlToValidate="msSACPname" ValidationGroup="insert" />
                </div>
             </div>

            <%--Patient's Room Number label and textbox--%>
             <div class="col-xs-12"> 
               <div class="col-xs-12 col-sm-6">
                    <asp:Label ID="mslbl_pRoomNum" runat="server" Text="Patient's Room Number"  CssClass="msFont11" AssociatedControlID="msSACPrn" />
                </div>
                <div class="col-xs-12 col-sm-6">
                    <asp:TextBox ID="msSACPrn" runat="server" CssClass="msPadAll2" Width="100%" />
                <asp:RequiredFieldValidator ID="rfv_pRoomNum" runat="server" Text="*Required" ControlToValidate="msSACPrn" ValidationGroup="insert" />
                </div>  
           </div>

        </div>

       </div>


       <div class="col-xs-12">

        <div class="col-xs-12 col-sm-4">
            <%--To label and textbox--%>
             <div class="col-xs-12"> 
               <div class="col-xs-12 col-sm-3">
                    <asp:Label ID="mslbl_to" runat="server" Text="To:" CssClass="msFont11" AssociatedControlID="msSACTo" />
                </div>
                <div class="col-xs-12 col-sm-9">
                    <asp:TextBox ID="msSACTo" runat="server" CssClass="msPadAll2" Width="100%" />
                    <asp:RequiredFieldValidator ID="rfv_To" runat="server" Text="*Required" ControlToValidate="msSACTo" ValidationGroup="insert" />
                </div>
             </div>

            <%--From label and textbox--%>
             <div class="col-xs-12"> 
               <div class="col-xs-12 col-sm-3">
                    <asp:Label ID="mslbl_from" runat="server" Text="From:"  CssClass="msFont11" AssociatedControlID="msSACFrom" />
                </div>
                <div class="col-xs-12 col-sm-9">
                    <asp:TextBox ID="msSACFrom" runat="server" CssClass="msPadAll2" Width="100%" />
                    <asp:RequiredFieldValidator ID="rfv_From" runat="server" Text="*Required" ControlToValidate="msSACFrom" ValidationGroup="insert" />
                </div>
             </div>
            </div>

            <%--Your message label and textbox--%>
            <div class="col-xs-12 col-sm-7 col-sm-offset-1">
                 <div class="col-xs-12"> 
                   <div class="col-xs-12 col-sm-3">
                        <asp:Label ID="mslbl_yourMsg" runat="server" Text="Your message: " CssClass="msFont11" AssociatedControlID="msSACYourMessage" />
                    </div>
                    <div class="col-xs-12 col-sm-9">
                        <asp:TextBox ID="msSACYourMessage" runat="server" Textmode="Multiline" Width="100%"  Rows="8" CssClass="msPadAll2" />
                    <asp:RequiredFieldValidator ID="rfv_yourMsg" runat="server" Text="*Required" ControlToValidate="msSACFrom" ValidationGroup="insert" />
                    </div>
                 </div>
             </div>     
               
            <%--Send now button--%>
            <div class="col-xs-12  msMargBot30">
                <asp:Button CssClass="btn msRight" runat="server" ID="btnSendFlowers" Text="Send now" OnCommand="btnSendFlowers_Command" CommandName="Insert" ValidationGroup="insert"  />
            </div>

       </div>             
      
      </asp:Panel>


      <asp:Panel ID="pnlMsSent" runat="server" Visible="false">

        <div class="msAll90 msOH msPadBot30 msPadTop30">
          <asp:Label ID="mSlblTks" runat="server" CssClass="msHeader3 msImp" />
        </div>

      </asp:Panel>

    </div>

    </asp:Panel>

</asp:Content>
