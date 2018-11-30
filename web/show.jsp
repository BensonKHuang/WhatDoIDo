<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="wdid.Recommendations.RecommendationIterator" %>
<%@ page import="wdid.Recommendations.Recommendation" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<%@include file="navbar.jsp" %>

<div class="card w-25" style="width: 18rem;">
    <div class="card-body">
        <h3 id="intro" ><span><span><%=request.getAttribute("msg")%></span></span></h3>
        <h1 id="recommendation">
            <span><span id="theTitle"> ... </span></span>
        </h1>
        <h3 id="location" class="card-text mb-auto">
            <span><span id="theDesc"> ... </span></span>
        </h3>
    </div>

    <div id="next_rec" >
        <button class="btn btn-primary" onclick="cycle()">Give me another choice.</button>
    </div>
</div>


<div id="map"></div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCSL3VeLZviw2aVMVD5e01d0dUKN7lNHdA&callback=initMap" defer></script>

<%
    RecommendationIterator recItr = (RecommendationIterator)request.getAttribute("rec");
%>

<script>
    var nameList = [];
    var descList = [];
    var lng = [];
    var lat = [];
    var current = 0;
    var marker;

    <%while(recItr.hasNext()) {
        Recommendation f = recItr.next();
        %>nameList.push("<%= f.getName() %>");
    descList.push("<%= f.getDescription() %>");
    lng.push("<%= f.getLocation().getLongitude() %>");
    lat.push("<%= f.getLocation().getLatitude() %>");
    <%}%>

    function updateMap(lng, lat){
        var panPoint = new google.maps.LatLng(lat, lng);
        map.panTo(panPoint);
        marker.setPosition(panPoint);
    }

    function cycle(){
        document.getElementById("theTitle").innerText = nameList[current];
        document.getElementById("theDesc").innerText = descList[current];
        updateMap(lng[current], lat[current]);
        current++;
        if(current === nameList.length)
            current = 0;
    }

</script>
<script>

    var map;
    var latlng = {lat: 30.2849 , lng: -97.7341};

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: latlng,
            zoom: 18,
            disableDefaultUI: true,
            // gestureHandling: 'cooperative',
            // zoomControl: false,
            mapTypeId: 'roadmap'
            // styles: [
            //     {elementType: 'geometry', stylers: [{color: '#242f3e'}]},
            //     {elementType: 'labels.text.stroke', stylers: [{color: '#242f3e'}]},
            //     {elementType: 'labels.text.fill', stylers: [{color: '#746855'}]},
            //     {
            //         featureType: 'administrative.locality',
            //         elementType: 'labels.text.fill',
            //         stylers: [{color: '#d59563'}]
            //     },
            //     {
            //         featureType: 'poi',
            //         elementType: 'labels.text.fill',
            //         stylers: [{color: '#d59563'}]
            //     },
            //     {
            //         featureType: 'poi.park',
            //         elementType: 'geometry',
            //         stylers: [{color: '#263c3f'}]
            //     },
            //     {
            //         featureType: 'poi.park',
            //         elementType: 'labels.text.fill',
            //         stylers: [{color: '#6b9a76'}]
            //     },
            //     {
            //         featureType: 'road',
            //         elementType: 'geometry',
            //         stylers: [{color: '#38414e'}]
            //     },
            //     {
            //         featureType: 'road',
            //         elementType: 'geometry.stroke',
            //         stylers: [{color: '#212a37'}]
            //     },
            //     {
            //         featureType: 'road',
            //         elementType: 'labels.text.fill',
            //         stylers: [{color: '#9ca5b3'}]
            //     },
            //     {
            //         featureType: 'road.highway',
            //         elementType: 'geometry',
            //         stylers: [{color: '#746855'}]
            //     },
            //     {
            //         featureType: 'road.highway',
            //         elementType: 'geometry.stroke',
            //         stylers: [{color: '#1f2835'}]
            //     },
            //     {
            //         featureType: 'road.highway',
            //         elementType: 'labels.text.fill',
            //         stylers: [{color: '#f3d19c'}]
            //     },
            //     {
            //         featureType: 'transit',
            //         elementType: 'geometry',
            //         stylers: [{color: '#2f3948'}]
            //     },
            //     {
            //         featureType: 'transit.station',
            //         elementType: 'labels.text.fill',
            //         stylers: [{color: '#d59563'}]
            //     },
            //     {
            //         featureType: 'water',
            //         elementType: 'geometry',
            //         stylers: [{color: '#17263c'}]
            //     },
            //     {
            //         featureType: 'water',
            //         elementType: 'labels.text.fill',
            //         stylers: [{color: '#515c6d'}]
            //     },
            //     {
            //         featureType: 'water',
            //         elementType: 'labels.text.stroke',
            //         stylers: [{color: '#17263c'}]
            //     }
            // ]
        });

        marker = new google.maps.Marker({
            position: latlng,
            title: "Marker"
        });

        marker.setMap(map);
    }
    cycle();
</script>

</body>
</html>

