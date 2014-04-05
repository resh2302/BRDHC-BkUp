﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="msHomeNoMaster.aspx.cs" Inherits="msHomeNoMaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <%--stylesheets--%>
    <link rel="stylesheet" href="App_Themes/HealthTools/responsiveGrid.css" />
    <link rel="stylesheet" href="App_Themes/HealthTools/healthTools.css" />
    <link rel="stylesheet" href="App_Themes/HealthTools/normalize.css" />
    <%--google fonts--%>
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'/>

</head>

<body>

 <form id="form1" runat="server">
            
  <div class="container">
    
   <div class="mainBkgdBkgd">
    
    <div class="msimg_header">    
            
        <div class="row">        
                 <div class="col-xs-3 col-sm-2 col-lg-1 attnBkgd msCenter">
                    <asp:Image ID="msimg_logo" runat="server" ImageUrl="~/App_Themes/HealthTools/images/logoBRDHC_Text.png" Width="100px" CssClass="msPadTop10 msPadBot10" />
                 </div>

                 <div class="col-xs-7 col-sm-7 col-lg-8 mainLightTrans msPadTop30 msPadBot10">
                    <asp:Label ID="mslbl_h1" runat="server" CssClass="msHeader1 msPadL10">Blind River District Health Centre</asp:Label>
                </div>
            
                <div class="col-xs-2 col-sm-3 msPadTop20 msCenter">
                    <asp:Button ID="btn_loginTab" runat="server" CssClass="btn" Text="Login" />
                </div>        
        </div>

        <div class="row">
            <div class="col-xs-12 mainBkgdTrans neutralLight msPadTop10 msCenter msMargTop300">
                <asp:Label runat="server" ID="lbl_caption" CssClass="msphome" Text="A Helping Hand: Students &amp; Clubs Support the Within Reach Campaign" />
            </div>
        </div>

    </div>

    <div class="row">
            <div class="col-xs-12 neutralLightBkgd mainBkgd msPadTop10 msPadBOt">
                <asp:Label runat="server" ID="Label7" CssClass="msphome" Text="Navigation Goes here" />
            </div>
    </div>
  
    <div class="row">
        <div class="col-sm-12 attnImpBkgd mainBkgd msMargTop10 msPadTop20 msOH">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="lbl_alert" Text="Alerts" CssClass="msh2home" />
                <asp:Label runat="server" ID="lbl_alertTxt" CssClass="msphome">Wafer muffin marzipan topping unerdwear.com marzipan soufflé wafer. Apple pie biscuit marzipan tootsie roll oat cake bear claw halvah. Lollipop ice cream bonbon dessert...</asp:Label>
                <asp:LinkButton runat="server" ID="lkb_alert" Text="READ MORE &gt;" CssClass="msphome mainBkgd lnkbtn msRight" />
            </div>
        </div>
    </div>
      
    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4 mainDarkBkgd mainBkgd msMargTop10 msPadTop20">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="lbl_adrs" Text="Address" CssClass="msh3home" />
                <asp:Label runat="server" ID="lbl_adrsTxt" CssClass="msphome msPadL10 msItal">525 Causley Street<br />Blind River,<br /> Ontario POR 180</asp:Label>

                <asp:Label runat="server" ID="lbl_phn" Text="Phone" CssClass="msh3home" />
                <asp:Label runat="server" ID="lit_phn" CssClass="msphome msPadL10 msItal" class="msPadRL5">123-123-1234</></asp:Label>

                <asp:Label runat="server" ID="lbl_admfax" Text="Adminstration Fax" CssClass="msh3home" />
                <asp:Label runat="server" ID="lbl_admfaxTxt" CssClass="msphome msPadL10 msItal">123-123-1234</asp:Label>

                <asp:Label runat="server" ID="lbl_infofax" Text="Information Services Fax" CssClass="msh3home" />
                <asp:Label runat="server" ID="lbl_infofaxTxt" CssClass="msphome msPadL10 msItal">123-123-1234</asp:Label>

                <asp:Label runat="server" ID="lbl_email" Text="Email" CssClass="msh3home" />
                <asp:Label runat="server" ID="lbl_emailTxt" CssClass="msphome msPadL10 msItal">fakewebsite@email.com</asp:Label>

                <asp:Label runat="server" ID="lbl_vhrs" Text="Visiting Hours" CssClass="msh3home" />
                <asp:Label runat="server" ID="lbl_vhrstxt" CssClass="msphome msPadL10 msItal">11 a.m to 8 p.m</asp:Label>

                <asp:Image runat="server" ID="img_map" ImageUrl="~/App_Themes/HealthTools/images/map.png" Width="330px" />

                <asp:LinkButton runat="server" ID="lnk_map" Text="Click to open in Google Maps" CssClass="msphome msCenter msItal" />
            </div>
        </div>

            <div class="col-sm-12 col-md-6 col-lg-4 neutralDark msMargTop10 msPadTop20 msPadBot10">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="lbl_mis" Text="Mission" CssClass="msh2home" />
                    <asp:Label runat="server" ID="lbl_misTxt" CssClass="msphome">To work with our various partners and the community to provide safe, progressive and compassionate health care.</asp:Label>
                </div>
            </div>

            <div class="col-sm-12 col-md-6 col-lg-4 neutralDark msMargTop10 msPadTop20 msPadBot10">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="lbl_vis" Text="Vision" CssClass="msh2home" />
                    <asp:Label runat="server" ID="lbl_visTxt" CssClass="msphome">To be recognized for excellence in the provision of rural health care and service delivery in an integrated model.</asp:Label>
                </div>
            </div>

    </div>
     
    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4 attnImp msMargTop10 msPadTop20 msPadBot10">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="lbl_ewt" Text="Emergency Wait Time" CssClass="msh2home" />
                <asp:Label runat="server" ID="lbl_ewtTxt" CssClass="msphome">The current wait time is: </asp:Label>
                <asp:Label runat="server" ID="lbl_ewtTime" CssClass="msh2home" Text="3h 15m" />
            </div>
        </div>

        <div class="col-sm-12 col-md-6 col-lg-4 neutralDark msMargTop10 msPadTop20 msPadBot10 msOH">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="lbl_doc" Text="Find a Doctor" CssClass="msh2home" />
                <asp:Label runat="server" ID="lbl_docTxt" CssClass="msphome">Chocolate bar wafer toffee wafer danish. Pie chocolate bar tootsie roll ice. Chocolate bar wafer toffee wafer danish.</asp:Label>
                <asp:LinkButton runat="server" ID="lkn_doc" Text="SEARCH &gt;" CssClass="msphome neutralDark lnkbtn msRight" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4 neutralDark msMargTop10 msPadTop20 msPadBot10 msOH">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="Label1" Text="News" CssClass="msh2home" />
                <asp:Label runat="server" ID="Label3" CssClass="msphome">Blind River District Health Centre's Report to the Community is now available!</asp:Label>
                <asp:LinkButton runat="server" ID="lnk_news" Text="READ MORE &gt;" CssClass="msphome neutralDark lnkbtn msRight" />
            </div>
        </div>

        <div class="col-sm-12 col-md-6 col-lg-4 mainDark msMargTop10 msPadTop20 msPadBot10 msOH">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="Label5" Text="Upcoming Events" CssClass="msh2home" />
                <asp:Label runat="server" ID="Label6" CssClass="msphome">Board of Trustees - Open Meeting<br />Place: Algoma Manor in Thessalon<br />Time: Tuesday, November 26th 2013 @ 7:00PM</asp:Label>
                <asp:LinkButton runat="server" ID="LinkButton1" Text="LISTINGS &gt;" CssClass="msphome mainDark lnkbtn msRight" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4 neutralDark msMargTop10 msPadTop20 msPadBot10">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="lbl_news" Text="Health Tools" CssClass="msh2home" />
                <asp:Label runat="server" ID="lbl_newsTxt" CssClass="msphome">Take the healthy eating quiz and find out if you are making healthy choices.</asp:Label>
            </div>
        </div>

        <div class="col-sm-12 col-md-6 col-lg-4 neutralDark msMargTop10 msPadTop20 msPadBot10">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="lbl_upe" Text="Volunteering" CssClass="msh2home" />
                <asp:Label runat="server" ID="lbl_upeTxt" CssClass="msphome">We are looking for Medical Transportation and Meals on Wheels Drivers, Income Tax Clinic ...</asp:Label>
            </div>
        </div>

        <div class="col-sm-12 col-md-6 col-lg-4 attnImp msMargTop10 msPadTop20 msPadBot10">
            <div class="msPadRL20">
                <asp:Label runat="server" ID="lbl_" Text="Donate" CssClass="msh2home" />
                <asp:Label runat="server" ID="Label2" CssClass="msphome">The Within Reach campaign was launched April 1, 2012 with the goal of funding a "wish list" of items...</asp:Label>
            </div>
        </div>
    </div>

    </div>

   </div>

  </form>
</body>
</html>