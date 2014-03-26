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
            "<p style='margin-top:-30px'> 525 Causley St, Blind River, ON P0R</p>"
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
//function setContainerHeight() {
  //  var heightnow = $("#d_panel").height();
   // var heightfull = $("d_panel").css({ height: 'auto' }).height();

//    $("#d_panel").css({ height: heightnow }).animate({
   //     height: heightfull
 //   }, 2000, 'swing');
}

function getDirections() {
    calcRoute();
    
    $("#panelWrapper").animate({ height: '500px' }), 2000, 'swing';

}

window.onload = InitializeMap;