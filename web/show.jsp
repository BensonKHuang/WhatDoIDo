<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="wdid.Recommendations.RecommendationIterator" %>
<%@ page import="wdid.Recommendations.Recommendation" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<%@include file="navbar.jsp" %>

<% if (request.getAttribute("rec") != null) {%>

<div class="card w-25" style="width: 18rem;">
    <div class="card-body">
        <h3 id="intro"><span><span><%=request.getAttribute("msg")%></span></span></h3>
        <h1 id="recommendation">
            <span><span id="theTitle"> ... </span></span>
        </h1>
        <h3 id="location" class="card-text mb-auto">
            <span><span id="theDesc"> ... </span></span>
        </h3>
    </div>

    <div id="next_rec">
        <button class="btn btn-primary" onclick="cycle()">Give me another choice.</button>
    </div>
</div>


<div id="map"></div>

<%
    RecommendationIterator recItr = (RecommendationIterator) request.getAttribute("rec");
%>
<script>

    var map;
    var nameList = [];
    var descList = [];
    var ratingList = [];
    var lng = [];
    var lat = [];
    var current = -2;
    var marker;

    <%while(recItr.hasNext()) {
        Recommendation f = recItr.next();
        %>nameList.push("<%= f.getName() %>");
    descList.push("<%= f.getDescription() %>");
    lng.push("<%= f.getLocation().getLongitude() %>");
    lat.push("<%= f.getLocation().getLatitude() %>");
    ratingList.push("<%= f.getRating()%>");
    <%}%>

    <% if (request.getParameter("lat") != null && !request.getParameter("lat").isEmpty() &&
    request.getParameter("long") != null && !request.getParameter("long").isEmpty()) { %>
    var latlng = {
        lat: parseFloat(<%=request.getParameter("lat")%>),
        lng: parseFloat(<%=request.getParameter("long")%>)
    };
    <% } else { %>
    var latlng = {lat: 30.2849, lng: -97.7341};
    <% } %>

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: latlng,
            zoom: 18,
            disableDefaultUI: true,
            mapTypeId: 'roadmap'
        });

        marker = new google.maps.Marker({
            position: latlng,
            title: "Marker"
        });

        marker.setMap(map);

        cycle();
    }

    function updateMap(lat, lng) {
        var panPoint = new google.maps.LatLng(lat, lng);
        map.panTo(panPoint);
        marker.setPosition(panPoint);
    }

    function cycle() {
        current++;
        if (current < 0 || current === nameList.length)
            current = 0;
        document.getElementById("theTitle").innerText = nameList[current];
        document.getElementById("theDesc").innerText = descList[current];
        updateMap(lat[current], lng[current]);
    }

</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCSL3VeLZviw2aVMVD5e01d0dUKN7lNHdA&callback=initMap"></script>

<% } else { %>
<div class="text-center">

    <div class="heading-title text-center">
        <h2>Sorry, can you specify a location?</h2>
    </div>

    <form id="place-form" onkeypress="return event.keyCode != 13;" action="/placeRec" method="GET">

        <div id="place-input" class="input-group mb-3">
            <input type="text" class="form-control" id="place" name="place" placeholder="Enter a place">
            <input class="form-control" name="param" type="hidden" value="<%=request.getParameter("param")%>"/>

            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Go</button>
            </div>
        </div>
    </form>
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCSL3VeLZviw2aVMVD5e01d0dUKN7lNHdA&libraries=places"></script>

<script>
    var input = document.getElementById('place');
    var autocomplete = new google.maps.places.Autocomplete(input);
    console.error(autocomplete);

    // Set the data fields to return when the user selects a place.
    autocomplete.setFields(
        ['address_components', 'geometry', 'icon', 'name']);

    autocomplete.addListener('place_changed', function () {
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
        } else {
            document.getElementById('place-form').submit();
        }
    });
</script>
<% }%>

</body>
</html>

