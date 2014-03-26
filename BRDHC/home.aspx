<%@ Page Title="" Language="C#" MasterPageFile="~/homeMaster.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home"
    Theme="Theme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="styles/healthAlerts.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="scmHome" runat="server" />
    <div id="contentwrapper">
        <div id="divDesc" runat="server" class="topAlertBox"></div>
        <section id="left">
            <div id="l_top">
                <h3>Address</h3>
                <article>
                    <p>
                        525 Causley Street<br />
                        Blind River, Ontario<br />
                        POR 180
                    </p>
                </article>

                <h3>Phone</h3>
                <article>705-356-2265</article>

                <h3>Administration</h3>
                <article>705-356-1120</article>

                <h3>Information Services Fax</h3>
                <article>705-356-2574</article>

                <h3>Email</h3>
                <article>webinfo@brdhc.on.ca</article>
                <h3>Visiting hours</h3>
                <article>11 a.m. to 8 p.m.</article>

                <h3>Maps</h3>
                <a href="https://maps.google.ca/maps?q=525+Causley+Street,+Blind+River,+ON&ie=UTF-8&hq=&hnear=0x4d31427b66416a73:0xad624bcd8a021f55,525+Causley+St,+Blind+River,+ON+P0R&gl=ca&ei=UfH0UpKsFqGI2AWKnoCQCA&ved=0CCsQ8gEwAA">
                    <img src="App_Themes/Theme/images/map.png" />
                </a>

            </div>
            <div id="l_bottom">
                <h2>UPCOMING EVENTS</h2>
                <article>
                    We can have listing from the database populate this area here. Phasellus 
                 arcu quam, consectetur sed viverra sed, mattis et dui.
                </article>
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

</asp:Content>

