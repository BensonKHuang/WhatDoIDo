<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="wdid.Users.*"%>
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

    ObjectifyService.begin();
    ObjectifyService.register(WDIDUser.class);
    WDIDUser userObj;
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
            <%  if(user != null) {
                    userObj = ObjectifyService.ofy().load().type(WDIDUser.class).id(user.getEmail()).now();
                    if(userObj == null) {
                        userObj = new WDIDUser(user.getEmail(), user.getNickname());
                        ObjectifyService.ofy().save().entity(userObj).now();
                    }
            %>
            <li><a href="/user.jsp"><span class="glyphicon glyphicon-user"></span><%=user.getNickname()%></a></li>
            <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Sign Out</a></li>
            <% } else {%>
            <li><a href="<%= userService.createLoginURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            <%}%>
        </ul>
    </div>
</nav>

<div id="landing-button" class="text-center">
    <a href="/foodRec" class="btn btn-lg btn-primary">Food</a>
    <div class="divider"></div>
    <a href="/movieRec" class="btn btn-lg btn-primary">Movies</a>
</div>

</body>
</html>
