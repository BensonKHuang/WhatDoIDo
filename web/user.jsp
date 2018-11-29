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

<div class="container">
    <h1>User Preferences</h1>

    <form action="/userUpdate" method="post">
        <h3>Gender</h3>
        <div class="form-group">
            <select class="form-control" name="gender" >
                <option value="0" selected>Male</option>
                <option value="1">Female</option>
                <option value="2">Non-Binary</option>
            </select>
        </div>

        <h3>Age</h3>
        <div class="form-group">
            <select class="form-control" name="age">
                <option value="13" selected>under 18</option>
                <option value="18">18-29</option>
                <option value="30">30-39</option>
                <option value="40">40-49</option>
                <option value="50">50-59</option>
                <option value="60">60+</option>
            </select>
        </div>
        <%--TODO: Update this page to reflect the "UserObj".--%>
        <h3>Dietary</h3>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="vegetarian" name="d0" value=true>
            <label class="form-check-label" for="vegan">Vegetarian</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="vegan" name="d1" value=true>
            <label class="form-check-label" for="vegan">Vegan</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="gluten" name="d2" value="true">
            <label class="form-check-label" for="gluten">Gluten Free</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="lactose" name="d3" value="true">
            <label class="form-check-label" for="lactose">Lactose Free</label>
        </div>

        <h3>Entertainment</h3>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="adventure" name="e0" value=true>
            <label class="form-check-label" for="adventure">Adventure</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="action" name="e1" value=true>
            <label class="form-check-label" for="action">Action</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="drama" name="e2" value=true>
            <label class="form-check-label" for="drama">Drama</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="comedy" name="e3" value=true>
            <label class="form-check-label" for="comedy">Comedy</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="horror" name="e4" value=true>
            <label class="form-check-label" for="horror">Horror</label>
        </div>
        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="romantic" name="e5" value=true>
            <label class="form-check-label" for="romantic">Romance</label>
        </div>

        <button type="submit" class="btn">Save</button>
    </form>
</div>

</body>
</html>
