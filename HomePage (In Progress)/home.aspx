<%@ Page Title="" Language="C#" MasterPageFile="~/Footer.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="contentwrapper">
        <section id="left">
            <div id="l_bottom">
                <h1>UPCOMING EVENTS</h1>
                <article>
                 We can have listing from the database populate this area here. Phasellus 
                 arcu quam, consectetur sed viverra sed, mattis et dui.
                </article>
                <a class="rm_red" href="#">READ MORE></a>
                <h1>CAREERS</h1>
                <article>
                 We can have listing from the database populate this area here. Phasellus 
                 arcu quam, consectetur sed viverra sed, mattis et dui.
                </article>
                <a class="rm_red" href="#">CURRENT OPENINGS></a>
            </div>
            <div id="social_media">
                <a href="#"><asp:Image ID="sm_twit" class="sm_img" runat="server" ImageUrl="~/img/twitter.png" /></a>
                <a href="#"><asp:Image ID="sm_fb" class="sm_img" runat="server" ImageUrl="~/img/fb.png" /></a>
            </div>
        </section>
        <section id="right">
            <div class="box">

            </div>
        </section>
        <section id="btm_1">
                <div id="b_topleft">
                    <h1>VOLUNTEERING</h1>
                    <article>
                        We can have listing from the database populate this area here. Phasellus 
                        arcu quam, consectetur sed viverra sed, mattis et dui.
                    </article>
                    <a class="rm_green" href="#">READ MORE></a>
                   
                </div>
                <div id="b_topright">
                    <h1>Donate</h1>
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
                    <div class="more_btn"><img class="mimg" src="img/more.png"/></div>
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
                    <div class="more_btn2"><img class="mimg2" src="img/more2.png"/></div>
                </div>
        </section>
    </div>
            
</asp:Content>

