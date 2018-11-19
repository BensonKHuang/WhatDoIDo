<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="static com.googlecode.objectify.ObjectifyService.ofy" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
%>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand active" href="/landing.jsp">What Do I Do?</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/team.jsp">Meet the Team</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <%  if(user != null){
                pageContext.setAttribute("user", user); %>
            <li><a href="/user.jsp"><span class="glyphicon glyphicon-user"></span>${fn:escapeXml(user.nickname)}</a></li>
            <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Sign Out</a></li>
            <% } else {%>
            <li><a href="<%= userService.createLoginURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            <%}%>
        </ul>
    </div>
</nav>

<form>
    <div class="row">
        <div class="span6">
            <div class="nonboxy-widget">
                <div class="widget-head">
                    <h5>Details</h5>
                </div>
                <div class="widget-content">
                    <div class="widget-box">
                        <div class = 'form-horizontal well'>
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label">Sale Type</label>
                                    <div class="controls">

</body>
</html>
