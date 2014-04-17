<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="contactUs.aspx.cs" Inherits="contactUs" Theme="HealthTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDr1FaTphJdx4IHRCbOcts4k46ayhsKw70&sensor=false"></script>
<script src="<%# Page.ResolveClientUrl("~/js/googleMapD.js") %>"></script>
<link rel="stylesheet" href="App_Themes/Theme/contactUs.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">

<div class="bootContainer">
<asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">
<div class="addPadding">
    
    <div class="col-xs-12 col-sm-6">
    <section id="cHeader">Contact Us</section>
        <h2>Leave Us a Message</h2>
        <asp:Label ID="lbl_message" CssClass="message" runat="server" /> 
        <br />
        <br />
        <asp:Label ID="Lbl_sub" Text="Subject:" runat="server" CssClass="infoLabel " />
        <asp:TextBox ID="txt_sub" runat="server" CssClass="textContact" />
        <asp:RequiredFieldValidator ID="rfv_sub" runat="server" Text="*Required" ValidationGroup="Contact" ControlToValidate="txt_sub" />
        <br />     
        <asp:Label ID="lbl_fname" Text="First Name:" runat="server" CssClass="infoLabel" />
        <asp:TextBox ID="txt_fname" runat="server" CssClass="textContact" />
        <asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="*Required" ValidationGroup="Contact" ControlToValidate="txt_fname" />
        <br />
        <asp:Label ID="lbl_lname" Text="Last Name:" runat="server" CssClass="infoLabel" />
        <asp:TextBox ID="txt_lname" runat="server" CssClass="textContact" />
        <asp:RequiredFieldValidator ID="rfv_lname" runat="server" Text="*Required" ValidationGroup="Contact" ControlToValidate="txt_lname" />
        <br />
        <asp:Label ID="lblEmail" Text="Email:" runat="server" CssClass="infoLabel" />
        <asp:TextBox ID="txt_email" runat="server" CssClass="textContact" />
        <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*Required" ValidationGroup="Contact" ControlToValidate="txt_email"  />
        <br />
        <asp:Label ID="lbl_phone" Text="Phone:" runat="server" CssClass="infoLabel" />
        <asp:TextBox ID="txt_phone" runat="server" CssClass="textContact" />
        <asp:RequiredFieldValidator ID="rfv_phone" runat="server" Text="*Required" ValidationGroup="Contact" ControlToValidate="txt_phone" />
        <br />
        <asp:Label ID="lbl_msg" runat="server" Text="Message" CssClass="infoLabel" />
        <br />
        <asp:TextBox id="txt_msg" TextMode="multiline" Columns="45" Rows="15" runat="server" CssClass="textArea"/>
        <asp:RequiredFieldValidator ID="rfv_msg" runat="server" Text="*Required" ValidationGroup="Contact" ControlToValidate="txt_msg" />
        <br />
        <asp:Button ID="btn_msg" Text="Send" runat="server" CommandName="Insert" OnClientClick="return confirm('Are you sure you would like to send a Message?')" OnCommand="subMessage" ValidationGroup="Contact" CausesValidation="true" />
        <br />
    </div>



    <section class="col-xs-12 col-sm-6">
    <script>
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var myCenter = new google.maps.LatLng(46.187363, -82.924063);

        function InitializeMap() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var Hospital =
            {
                zoom: 15,
                center: myCenter,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var map = new google.maps.Map(document.getElementById("googleMap"), Hospital);

            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('d_panel'));

            var marker = new google.maps.Marker({
                position: myCenter,
            });

            marker.setMap(map);

            var infowindow = new google.maps.InfoWindow({
                content: "<h3>Blind River District Health Center</h3>" + "<br/>" +
                    "<article style='margin-top:-30px'> 525 Causley St, Blind River, ON P0R</article>"
            });

            infowindow.open(map, marker);

        }
        function calcRoute() {

            var start = document.getElementById('txt_from2').value;
            var end = document.getElementById('txt_to2').value;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });

        }

        function getDirections() {
            calcRoute();
    
            $("#panelWrapper").animate({ height: '500px' }), 2000, 'swing';

        }

        window.onload = InitializeMap;
    </script>
    <div id="mapWrapper">
    <h1>Find Us</h1>
    <div id="googleMap"></div>

    <div id="panelWrapper">
    <div id="d_panel"></div>
    </div>

    </div>
        <%-- Wouldn't work with ASP controls
        <asp:Label ID="lbl_from" runat="server" CssClass="infoLabel">From:</asp:Label>
        <asp:TextBox ID="txt_from" runat="server" CssClass="textContact" AutoPostBack="false"></asp:TextBox>
        <br />
        
        <asp:Label ID="lbl_to" runat="server" CssClass="infoLabel">To:</asp:Label>
        <asp:TextBox ID="txt_to" runat="server" CssClass="textContact" AutoPostBack="false" AutoCompleteType="HomeStreetAddress"></asp:TextBox>
        <br />
        <asp:Button ID="btn_sub" runat="server" Text="Submit" OnClientClick="javascript: Button1_onclick()" />
        --%>
        
        <br />
        <label for="txt_from2" class="infoLabel">From</label>
        <input type="text" class="textContact" id="txt_from2" />
        <br />
        <label for="txt_to2" class="infoLabel">To</label>
        <input type="text" class="textContact" id="txt_to2" value="525 Causley St, Blind River, ON P0R" />
        <br />
        <input type="button" name="Go" value="Get Directions" onclick="getDirections()" />
    </section>


</div>
</asp:Panel>
</div>
</asp:Content>