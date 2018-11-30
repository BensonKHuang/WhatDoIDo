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

<div id="landing-button" class="text-center">
    <form action="/foodRec" method="GET">
        <input id="latFood" name="lat" type="hidden" value=""/>
        <input id="longFood" name="long" type="hidden" value=""/>
        <input class="btn btn-lg btn-primary" type="submit" value="Food"/>
    </form>
    <div class="divider"></div>
    <form action="/movieRec" method="GET">
        <input id="latMovie" name="lat" type="hidden" value=""/>
        <input id="longMovie" name="long" type="hidden" value=""/>
        <input class="btn btn-lg btn-primary" type="submit" value="Movie"/>
    </form>
</div>

</body>
</html>
