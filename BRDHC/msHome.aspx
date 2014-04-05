<%@ Page Language="C#" MasterPageFile="~/msHomeMaster.master" AutoEventWireup="true" CodeFile="msHome.aspx.cs" Inherits="msHome" Theme="HealthTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<link href="styles/healthAlerts.css" rel="stylesheet" />--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <%--<asp:ScriptManager ID="scmHome" runat="server" />--%>
 

<div class="container">
    
    <div class="row">
         <div class="col-xs-3">
            <asp:Image ID="msimg_logo" runat="server" ImageUrl="~/App_Themes/HealthTools/images/logo.png" />
         </div>

         <div class="col-xs-9 mainLightBkgd">
            <asp:Label ID="mslbl_h1" runat="server" CssClass="msHeader1">Blind River District Health Centre</asp:Label>
            <asp:Button ID="btn_login" runat="server" CssClass="btn" Text="Loginnn" />
         </div>
   </div>
	 
    <div class="row">
        <div class="col-sm-12 attnImpBkgd msMargTop10 msPadTop10">
            <asp:Label runat="server" ID="lbl_alert" Text="Alertsss" CssClass="msh2home mainBkgd" />
            <asp:Literal runat="server" ID="lit_alert" Mode="Transform"><p>Wafer muffin marzipan topping unerdwear.com marzipan soufflé wafer. Apple pie biscuit marzipan tootsie roll oat cake bear claw halvah. Lollipop ice cream bonbon dessert. Fruitcake danish tootsie roll bonbon cake cookie cake brownie.</p></asp:Literal>
        </div>
    </div>
      
    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4 mainDarkBkgd mainBkgd msMargTop10 msPadTop10">
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
        </div>

        <div class="col-sm-12 col-md-6 col-lg-4 neutralDark msMargTop10">
            <asp:Label runat="server" ID="lbl_mis" Text="Mission" CssClass="msh2home" />
            <asp:Label runat="server" ID="lbl_misTxt" CssClass="msphome">To work with our various partners and the community to provide safe, progressive and compassionate health care.</asp:Label>
        </div>

        <div class="col-sm-12 col-md-6 col-lg-4 neutralDark msMargTop10">
            <asp:Label runat="server" ID="lbl_vis" Text="Vision" CssClass="msh2home" />
            <asp:Label runat="server" ID="lbl_visTxt" CssClass="msphome">To be recognized for excellence in the provision of rural health care and service delivery in an integrated model.</asp:Label>
        </div>
    </div>
     
    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-4 col-md-offset-4 attnImp msMargTop10">
            <asp:Label runat="server" ID="lbl_ewt" Text="Emergency Wait Time" CssClass="msh2home" />
            <asp:Label runat="server" ID="lbl_ewtTxt" CssClass="msphome">The current wait time is: </asp:Label>
            <asp:Label runat="server" ID="lbl_ewtTime" CssClass="msh2home" Text="3h 15m" />
        </div>

    </div>

    </div>

</asp:Content>
                        
               <%-- 


                <h3>Visiting hours</h3>
                <article>11 a.m. to 8 p.m.</article>

                <h3>Maps</h3>
                <a href="https://maps.google.ca/maps?q=525+Causley+Street,+Blind+River,+ON&ie=UTF-8&hq=&hnear=0x4d31427b66416a73:0xad624bcd8a021f55,525+Causley+St,+Blind+River,+ON+P0R&gl=ca&ei=UfH0UpKsFqGI2AWKnoCQCA&ved=0CCsQ8gEwAA">
                    <img src="App_Themes/Theme/images/map.png" />
                </a>

                <h2>UPCOMING EVENTS</h2>

                    We can have listing from the database populate this area here. Phasellus 
                 arcu quam, consectetur sed viverra sed, mattis et dui.

                <a class="rm_red" href="#">READ MORE></a>
                
    
                <h2>CAREERS</h2>
                <article>
                    We can have listing from the database populate this area here. Phasellus 
                 arcu quam, consectetur sed viverra sed, mattis et dui.
                </article>
                <a class="rm_red" href="#">CURRENT OPENINGS></a>
            </div>
            <div id="social_media">
                <a href="#">
                    <asp:Image ID="sm_twit" class="sm_img" runat="server" ImageUrl="~/App_Themes/Theme/images/twitter.png" /></a>
                <a href="#">
                    <asp:Image ID="sm_fb" class="sm_img" runat="server" ImageUrl="~/App_Themes/Theme/images/fb.png" /></a>
            </div>
        </section>
        <section id="right">
            Blind River District Health Centre
        </section>


        <section id="top_1">
            <div id="b_mission">
                <h2>MISSION</h2>
                <article>
                    To work with our various partners 
                        and the community to provide safe,
                        progressive and compassionate health care.
                </article>
            </div>
            <div id="b_vision">
                <h2>VISION</h2>
                <article>
                    To be recognized for excellence in 
                        the provision of rural health care 
                        and service delivery in an integrated
                        model.
                </article>

            </div>
        </section>

        <section id="alert_box">
            <div id="alert">
                <h2><asp:Label ID="lblAlertTitle" runat="server"></asp:Label> </h2>
                 <h2>Emergency Wait Time</h2>
                <article>
                    <asp:UpdatePanel ID="upEmergency" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlView" runat="server" CssClass="pnlEmergencyCurrent">
                                <asp:Repeater ID="rptCurrent" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCurrentTime" Text='<%#Eval("WaitTime") %>' CssClass="lblWaitTime" runat="server" />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </asp:Panel>
                            <asp:Timer ID="tmr_main" runat="server" Interval="5000" OnTick="subTick" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </article>
            </div>
        </section>

        <section id="news_box">
            <div id="news">
                <h2>NEWS</h2>
                <article>
                    We can have listing from the database populate this area here. Phasellus 
                        arcu quam, consectetur sed viverra sed, mattis et dui.Phasellus 
                        arcu quam, consectetur sed viverra sed, mattis et dui.Phasellus 
                        arcu quam, consectetur sed viverra sed, mattis et dui.
                </article>
                <a class="rm_green" href="#">READ MORE></a>
            </div>
        </section>


        <section id="btm_1">
            <div id="b_topleft">
                <h2>VOLUNTEERING</h2>
                <article>
                    We can have listing from the database populate this area here. Phasellus 
                        arcu quam, consectetur sed viverra sed, mattis et dui.
                </article>
                <a class="rm_green" href="#">READ MORE></a>

            </div>
            <div id="b_topright">
                <h2>DONATE</h2>
                <article>
                    We can Put a Button here! Phasellus 
                        arcu quam, consectetur sed viverra sed, mattis et dui. Vivamus
                        arcu quam, consectetur sed viverra sed...
                </article>
                <a class="rm_green" href="#">READ MORE></a>
            </div>
        </section>
        <section id="btm_2">
            <div id="b_left">
                <div id="mbox1">
                    <p class="mtitle">HEALTH SERVICES</p>
                    <ul class="mlist">
                        <li>> List Item #1</li>
                        <li>> List Item #2</li>
                        <li>> List Item #3</li>
                        <li>> List Item #4</li>
                        <li>> List Item #5</li>
                        <li>> List Item #6</li>
                        <li>> List Item #7</li>
                        <li>> List Item #8</li>
                        <li>> List Item #9</li>
                    </ul>
                </div>
                <div class="more_btn">
                    <img class="mimg" src="App_Themes/Theme/images/more.png" />
                </div>
            </div>
            <div id="b_right">
                <div id="mbox2">
                    <p class="mtitle">OUT-PATIENTS</p>
                    <ul class="mlist">
                        <li>> List Item #1</li>
                        <li>> List Item #2</li>
                        <li>> List Item #3</li>
                        <li>> List Item #4</li>
                        <li>> List Item #5</li>
                        <li>> List Item #6</li>
                        <li>> List Item #7</li>
                        <li>> List Item #8</li>
                        <li>> List Item #9</li>
                    </ul>
                </div>
                <div class="more_btn2">
                    <img class="mimg2" src="App_Themes/Theme/images/more2.png" />
                </div>
            </div>
        </section>
    </div>

</asp:Content>--%>


