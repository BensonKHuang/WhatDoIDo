<%--
  Created by IntelliJ IDEA.
  User: Nicholas
  Date: 11/29/2018
  Time: 12:38 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="wdid.Users.*" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="static com.googlecode.objectify.ObjectifyService.ofy" %>
<%@ page import="java.util.Enumeration" %>

<%
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();

    ObjectifyService.begin();
    ObjectifyService.register(WDIDUser.class);
    ObjectifyService.register(Review.class);
    WDIDUser userObj = new WDIDUser();
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>What do I do?</title>
    <link rel="shortcut icon"  type="image/x-icon" href="/assets/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="stylesheets/style.css"/>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

    <a class="navbar-brand" href="/landing.jsp">
        <img src="assets/white_small.png" width="32" height="32" class="d-inline-block align-top" alt="">
        <%--<span>DID</span>--%>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02"
            aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor02">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link active" href="/team.jsp">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/reviews.jsp">Reviews</a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <%  if (user != null) {
                userObj = ofy().load().type(WDIDUser.class).id(user.getEmail()).now();
                if (userObj == null) {
                    userObj = new WDIDUser(user.getEmail(), user.getNickname());
                    ofy().save().entity(userObj).now();
                }
            %>
            <li class="nav-item active">
                <a class="nav-link" href="/user.jsp">Settings
                </a>
            </li>
            <li class="nav-item active"><a class="btn btn-danger"
                                           href="<%= userService.createLogoutURL((String) request.getAttribute("javax.servlet.forward.request_uri") == null ?
                                           request.getRequestURI() : (String) request.getAttribute("javax.servlet.forward.request_uri")
                                           ) %>">Logout</a>
            </li>
            <% } else {%>
            <li class="nav-item active"><a class="btn btn-success"
                                           href="<%= userService.createLoginURL((String) request.getAttribute("javax.servlet.forward.request_uri") == null ?
                                           request.getRequestURI() : (String) request.getAttribute("javax.servlet.forward.request_uri")
                                           ) %>">Login</a>
            </li>
            <%}%>
        </ul>
    </div>
</nav>

</body>
</html>
