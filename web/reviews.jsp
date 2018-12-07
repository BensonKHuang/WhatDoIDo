<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<%@include file="navbar.jsp" %>

<div class="container">

    <div class="heading-title text-center">
        <h2>What users are saying about WDID</h2>
    </div>

    <div id="forward-blog">
        <%
            List<Review> reviews = ObjectifyService.ofy().load().type(Review.class).list();
            Collections.sort(reviews);
            for (Review review: reviews){
                pageContext.setAttribute("review_author", review.getUser().getEmail());
                pageContext.setAttribute("review_date", review.getDateString());
                pageContext.setAttribute("review_content", review.getContent());
        %>
                <div class="container">
                    <div class="card bg-light mb-3">
                        <div class="card-body">
                            <blockquote class="blockquote mb-0">
                                ${fn:escapeXml(review_content)}
                                <footer class="blockquote-footer"><cite>${fn:escapeXml(review_author)} on ${fn:escapeXml(review_date)}</cite></footer>
                            </blockquote>
                        </div>
                    </div>
                </div>
        <%
            }
        %>
    </div>

</div>

</body>
</html>
