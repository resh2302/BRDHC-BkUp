<%@ Page Language="C#" MasterPageFile="~/msHomeMaster.master" AutoEventWireup="true" CodeFile="msHomeNoMaster.aspx.cs" Theme="HealthTools" Inherits="msHomeNoMaster" %>

<%@ Register Src="HeaderMenu.ascx" TagName="HeaderMenu" TagPrefix="uc1" %>

<%--overriding content on the masterpage--%>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
     <%--needed to hold all content centre aligned--%>
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

    <%--container for responsiveness--%>
    <div class="masterContainer">   
    <div class="col-xs-12">
                
        <div class="row msimg_header">        
                 <div class="col-xs-3 col-sm-2 attnBkgd msCenter">
                    <asp:Image ID="msimg_logo" runat="server" ImageUrl="~/App_Themes/HealthTools/images/logoBRDHC_Text.png" Width="105px" CssClass="msPadBot10 msPadTop10" />
                 </div>

                <div class="col-xs-9 col-sm-10 mainLightTrans msPadTop20 msPadBot10">
                    <div class="col-xs-9">   
                        <asp:Label ID="mslbl_h1" runat="server" CssClass="msHeader1 msPadL10">Blind River District Health Centre</asp:Label>
                    </div>
            
                    <div class="col-xs-3 msPadTop10 msCenter">
                        <asp:Button ID="btn_loginTab" runat="server" CssClass="btn" Text="Login" />
                    </div>
                </div>
        </div>

        <div class="row caption">
             <div class="col-xs-12 mainBkgd msCenter msPadTop10">
                <asp:Label runat="server" ID="lbl_caption" CssClass="msphome mainDark" Text="A Helping Hand: Students &amp; Clubs Support the Within Reach Campaign" />
            </div>
        </div>

        <div class="row">
                <div class="col-xs-12 neutralLightBkgd">     
                            <uc1:HeaderMenu ID="HeaderMenu1" runat="server" />
                </div>
        </div>

    </div>

    <div class="subMasterContainer">
  
            <div class="col-xs-12 attnImpBkgd mainBkgd msMargTop10 msPadTop20 msOH">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="lbl_alert" Text="Alerts" CssClass="msh2home" />
                    <asp:Label runat="server" ID="lbl_alertTxt" CssClass="msphome">Wafer muffin marzipan topping unerdwear.com marzipan soufflé wafer. Apple pie biscuit marzipan tootsie roll oat cake bear claw halvah. Lollipop ice cream bonbon dessert...</asp:Label>
                    <asp:LinkButton runat="server" ID="lkb_alert" Text="READ MORE &gt;" CssClass="msphome mainBkgd lnkbtn msRight" />
                </div>
            </div>
      
            <div class="col-xs-12 col-sm-6 col-md-4 mainDarkBkgd mainBkgd msMargTop10 msPadTop20">
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

                    <asp:Image runat="server" ID="img_map" ImageUrl="~/App_Themes/HealthTools/images/map.png" Width="270px" />

                    <asp:LinkButton runat="server" ID="lnk_map" Text="Click to open in Google Maps" CssClass="msphome msCenter msItal" />
                </div>
            </div>

                <div class="col-xs-12 col-sm-6 col-md-4 neutralDark msMargTop10 msPadTop20 msPadBot10 msLineBot">
                    <div class="msPadRL20">
                        <asp:Label runat="server" ID="lbl_mis" Text="Mission" CssClass="msh2home" />
                        <asp:Label runat="server" ID="lbl_misTxt" CssClass="msphome">To work with our various partners and the community to provide safe, progressive and compassionate health care.</asp:Label>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 neutralDark msMargTop10 msPadTop20 msPadBot10 msLineBot">
                    <div class="msPadRL20">
                        <asp:Label runat="server" ID="lbl_vis" Text="Vision" CssClass="msh2home" />
                        <asp:Label runat="server" ID="lbl_visTxt" CssClass="msphome">To be recognized for excellence in the provision of rural health care and service delivery in an integrated model.</asp:Label>
                    </div>
                </div>

            <div class="col-xs-12 col-sm-6 col-md-4 attnImp msMargTop10 msPadTop20 msPadBot10 msLineBot">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="lbl_ewt" Text="Emergency Wait Time" CssClass="msh2home" />
                    <asp:Label runat="server" ID="lbl_ewtTxt" CssClass="msphome">The current wait time is: </asp:Label>
                    <asp:Label runat="server" ID="lbl_ewtTime" CssClass="msh2home msPadBot40" Text="3h 15m" />
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 neutralDark msMargTop10 msPadTop20 msPadBot10 msOH msLineBot">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="lbl_doc" Text="Find a Doctor" CssClass="msh2home" />
                    <asp:Label runat="server" ID="lbl_docTxt" CssClass="msphome">Chocolate bar wafer toffee wafer danish. Pie chocolate bar tootsie roll ice. Chocolate bar wafer toffee wafer danish.</asp:Label>
                    <asp:LinkButton runat="server" ID="lkn_doc" Text="SEARCH &gt;" CssClass="mslink neutralDark lnkbtn msRight" />
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 neutralDark msMargTop10 msPadTop20 msPadBot10 msLineBot">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="Label1" Text="News" CssClass="msh2home" />
                    <asp:Label runat="server" ID="Label3" CssClass="msphome">Blind River District Health Centre's Report to the Community is now available!</asp:Label>
                    <asp:LinkButton runat="server" ID="lnk_news" Text="READ MORE &gt;" CssClass="msphome neutralDark lnkbtn msRight" />
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 mainDark msMargTop10 msPadTop20 msPadBot10 msLineBot">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="Label5" Text="Upcoming Events" CssClass="msh2home" />
                    <asp:Label runat="server" ID="Label6" CssClass="msphome">Board of Trustees - Open Meeting<br />Place: Algoma Manor<br />Time: Tuesday, November 26th 2013 @ 7:00PM</asp:Label>
                    <asp:LinkButton runat="server" ID="LinkButton1" Text="LISTINGS &gt;" CssClass="msphome mainDark lnkbtn msRight" />
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 neutralDark msMargTop10 msPadTop20 msPadBot10">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="lbl_news" Text="Health Tools" CssClass="msh2home" />
                    <asp:Label runat="server" ID="lbl_newsTxt" CssClass="msphome">Take the healthy eating quiz and find out if you are making healthy choices.</asp:Label>
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 neutralDark msMargTop10 msPadTop20 msPadBot10">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="lbl_upe" Text="Volunteering" CssClass="msh2home" />
                    <asp:Label runat="server" ID="lbl_upeTxt" CssClass="msphome">We are looking for Medical Transportation and Meals on Wheels Drivers, Income Tax Clinic ...</asp:Label>
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-4 attnImp msMargTop10 msPadTop20 msPadBot10">
                <div class="msPadRL20">
                    <asp:Label runat="server" ID="lbl_" Text="Donate" CssClass="msh2home" />
                    <asp:Label runat="server" ID="Label2" CssClass="msphome">The Within Reach campaign was launched April 1, 2012 with the goal of funding a "wish list" of items...</asp:Label>
                </div>
            </div>

    </div>
    </div>

    </asp:Panel>

</asp:Content>