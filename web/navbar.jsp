<%--
  Created by IntelliJ IDEA.
  User: Nicholas
  Date: 11/29/2018
  Time: 12:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
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
</body>
</html>
