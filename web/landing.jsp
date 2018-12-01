<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<script>
    navigator.geolocation.getCurrentPosition(function(location) {
        document.getElementById("latFood").value = location.coords.latitude;
        document.getElementById("longFood").value = location.coords.longitude;

        document.getElementById("latMovie").value = location.coords.latitude;
        document.getElementById("longMovie").value = location.coords.longitude;
    });
</script>

<%@include file="navbar.jsp" %>

<div id="landing-button">

    <div class="heading-title text-center">
        <h2>What do I do?</h2>
    </div>

    <form action="/foodRec" method="GET">
        <input id="latFood" name="lat" type="hidden" value=""/>
        <input id="longFood" name="long" type="hidden" value=""/>
        <input class="btn btn-lg btn-primary button-width" type="submit" value="Food"/>
    </form>
    <form action="/movieRec" method="GET">
        <input id="latMovie" name="lat" type="hidden" value=""/>
        <input id="longMovie" name="long" type="hidden" value=""/>
        <input class="btn btn-lg btn-primary button-width" type="submit" value="Movie"/>
    </form>
</div>

</body>
</html>
