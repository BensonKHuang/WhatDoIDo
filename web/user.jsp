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
                    request.setAttribute("user", user); %>
            <li><a href="/user.jsp"><span class="glyphicon glyphicon-user"></span>${fn:escapeXml(user.nickname)}</a></li>
            <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Sign Out</a></li>
            <% } else {%>
            <li><a href="<%= userService.createLoginURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            <%}%>
        </ul>
    </div>
</nav>

<div class="container">
    <h1>User Preferences</h1>

    <form action="/userUpdate" method="post">
        <h3>Gender</h3>
        <div class="form-group">
            <select class="form-control" id="gender" >
                <option>Male</option>
                <option>Female</option>
                <option selected>Non-Binary</option>
            </select>
        </div>

        <h3>Age</h3>
        <div class="form-group">
            <select class="form-control" id="age">
                <option selected>Choose your age range</option>
                <option>under 18</option>
                <option>18-29</option>
                <option>30-39</option>
                <option>40-49</option>
                <option>50-59</option>
                <option>60+</option>
            </select>
        </div>

        <h3>Dietary</h3>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="vegetarian">
            <label class="form-check-label" for="vegetarian">Vegetarian</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="vegan">
            <label class="form-check-label" for="vegan">Vegan</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="gluten">
            <label class="form-check-label" for="gluten">Gluten Free</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="lactose">
            <label class="form-check-label" for="lactose">Lactose Free</label>
        </div>

        <h3>Entertainment</h3>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="adventure">
            <label class="form-check-label" for="adventure">Adventure</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="action">
            <label class="form-check-label" for="action">Action</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="drama">
            <label class="form-check-label" for="drama">Drama</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="comedy">
            <label class="form-check-label" for="comedy">Comedy</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="horror">
            <label class="form-check-label" for="horror">Horror</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="romantic">
            <label class="form-check-label" for="romantic">Romance</label>
        </div>

        <button type="submit" class="btn">Save</button>
    </form>
</div>

</body>
</html>
