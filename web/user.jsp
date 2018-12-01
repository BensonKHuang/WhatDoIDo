<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<%@include file="navbar.jsp" %>

<div class="container">

    <div class="heading-title text-center">
        <h3>User Preferences</h3>
    </div>

    <form action="/userUpdate" method="post">
        <h5>Gender</h5>
        <div class="form-group">
            <select class="form-control" name="gender" >
                <option value="0" selected>Male</option>
                <option value="1">Female</option>
                <option value="2">Non-Binary</option>
            </select>
        </div>

        <h5>Age</h5>
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
        <h5>Dietary</h5>
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

        <h5>Entertainment</h5>
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
