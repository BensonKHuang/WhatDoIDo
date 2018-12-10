<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<%@include file="navbar.jsp" %>

<div id="landing-button">

    <div class="heading-title text-center">
        <h2>What do I do?</h2>
    </div>

    <form action="/placeRec" method="GET">
        <input id="latFood" name="lat" type="hidden" value=""/>
        <input id="longFood" name="long" type="hidden" value=""/>
        <input name="param" type="hidden" value="restaurant"/>
        <input class="btn btn-lg btn-primary btn-width" type="submit" value="Food"/>
    </form>
    <form action="/placeRec" method="GET">
        <input id="latClub" name="lat" type="hidden" value=""/>
        <input id="longClub" name="long" type="hidden" value=""/>
        <input name="param" type="hidden" value="night_club"/>
        <input class="btn btn-lg btn-primary btn-width" type="submit" value="Club"/>
    </form>
    <form action="/placeRec" method="GET">
        <input id="latPark" name="lat" type="hidden" value=""/>
        <input id="longPark" name="long" type="hidden" value=""/>
        <input name="param" type="hidden" value="park"/>
        <input class="btn btn-lg btn-primary btn-width" type="submit" value="Park"/>
    </form>
    <form action="/movieRec" method="GET">
        <input id="latMovie" name="lat" type="hidden" value=""/>
        <input id="longMovie" name="long" type="hidden" value=""/>
        <input class="btn btn-lg btn-primary btn-width" type="submit" value="Movie"/>
    </form>
    <br>
    <br>
    <br>
    <form action="/placeRec" method="GET">
        <input id="latSur" name="lat" type="hidden" value=""/>
        <input id="longSur" name="long" type="hidden" value=""/>
        <input name="param" type="hidden" value="_surprise_"/>
        <input class="btn btn-lg btn-success" type="submit" value="Surprise Me"/>
    </form>

</div>

<script>
    navigator.geolocation.getCurrentPosition(function(location) {
        var lat = location.coords.latitude;
        var lng = location.coords.longitude;

        document.getElementById("latFood").value = lat;
        document.getElementById("longFood").value = lng;

        document.getElementById("latClub").value = lat;
        document.getElementById("longClub").value = lng;

        document.getElementById("latPark").value = lat;
        document.getElementById("longPark").value = lng;

        document.getElementById("latSur").value = lat;
        document.getElementById("longSur").value = lng;

        document.getElementById("latMovie").value = lat;
        document.getElementById("longMovie").value = lng;
    });
</script>

</body>
</html>
