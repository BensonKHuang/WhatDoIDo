<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="static com.googlecode.objectify.ObjectifyService.ofy" %>
<%@ page import="wdid.*" %>
<%@ page import="wdid.Recommendations.RecommendationIterator" %>
<%@ page import="wdid.Recommendations.Recommendation" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<jsp:include page="/foodRec" />--%>

<head>
    <title>What Do I Do</title>
    <link rel="shortcut icon" type="image/x-icon" href="/assets/favicon.ico" />
    <link type="text/css" rel="stylesheet" href="/stylesheets/landing.css" />
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>

<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand active" href="/landing.jsp">What Do I Do?</a>
        </div>
        <ul class="nav navbar-nav navbar-right">

            <li><a href="/user.jsp">Your Name</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Sign Out</a></li>
        </ul>
    </div>
</nav>

<div id="landing-button" class="text-center">
    
	<%
   		RecommendationIterator food = (RecommendationIterator) request.getAttribute("food");
   		if (food != null && food.hasNext()){
            Recommendation f = food.next();

   	%>
		<h1> <%= f.getName()%> </h1>
        <h3> <%= f.getLocation() %></h3>
	<%
	}else{
	%>
    	<h1>SHOW RECOMMENDATION!</h1>
   <%}%>
   
</div>

</body>
</html>
