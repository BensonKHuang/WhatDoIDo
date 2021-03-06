<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>

<%@include file="navbar.jsp" %>


<div class="container">
    <div class="row">

        <div class="col-sm-12 heading-title text-center">
            <h3 class="text-uppercase">"What do I do?"</h3>
            <a href="https://github.com/BensonKHuang/WhatDoIDo" target="_blank"><i class="fab fa-github fa-2x"></i></a>
        </div>
        <div class="col-sm-12 text-center">
            <p>What should I do? What do I do?</p>
            <p>We’ve all been there, wondering what’s new and exciting out there.</p>
            <p>Enter WDID: your personal activities assistant.</p>
            <p>WDID’s robust recommendation system and real-time databases make finding a recommendation for any activity as simple as a click.</p>
            <p>Even if you’re indecisive, WDID is great if you’re looking for a new adventure in your life.</p>
            <p>So go ahead, and see what’s waiting ahead. <a href="landing.jsp">Surprise me.</a></p>
            <%--<p>--%>
                <%--These words have been spoken time and time again for generations.--%>
            <%--</p>--%>
            <%--<p>--%>
                <%--No longer shall people be paralyzed by deciding where to go.--%>
            <%--</p>--%>
            <%--<p>--%>
                <%--What do I do has been created to answer the largest epidemic of modern society: <strong>indecision</strong>.--%>

            <%--</p>--%>
            <%--<p>--%>
                <%--By having a robust recommendation system based on user preferences and geolocation, WDID will provide users recommendations to meet any demand.--%>
                <%--This is a useful, light-weight application that is easy to use, but has complex algorithms to give the best recommendations possible.--%>
            <%--</p>--%>
        </div>
        <div class="col-sm-12 heading-title text-center">
            <h3 class="text-uppercase">The WDID Team</h3>
        </div>

        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="/assets/benson.png" alt="team member" class="img-fluid">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <p>Benson is a junior in ECE studying Software Engineering and Data Science.
                            This past summer, Benson honed his software development skills at Amazon.
                            He is the lead front-end architect and team leader for WDID,
                            inspiring his team members with his vision for WDID.</p>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Benson Huang</h5>
                <span>frontend</span>
            </div>
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="/assets/hasan.png" alt="team member" class="img-fluid">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <p>Hasan is a junior in ECE studying Software Engineering.
                            In the past, he has developed several personal projects that have been commercially successful.
                            Hasan is our resident tech guru and lead backend developer for WDID,
                            bringing to the table his extensive software experience.</p>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Hasan Saleemi</h5>
                <span>backend</span>
            </div>
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="/assets/nick.png" alt="team member" class="img-fluid">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <p>Nicholas is a senior in ECE concentrating in Software Engineering and Data Science.
                            In the past, he has done full-stack software engineering at Uber.
                            Nick does front-end development and implements good industry-standard design patterns. </p>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Nicholas Jang</h5>
                <span>frontend</span>
            </div>
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="/assets/jerry.png" alt="team member" class="img-fluid">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <p>Jerry is a junior in ECE studying Software Engineering.
                            Over the past summer, he had significant exposure to web design at his role in HP.
                            Jerry works with the front-end team on WDID,
                            focusing on improving the WDID user experience.</p>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Jerry Yang</h5>
                <span>frontend</span>
            </div>
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="/assets/dilan.png" alt="team member" class="img-fluid">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <p>Dilan is a junior in ECE concentrating in Software Engineering.
                            He has previous internship experience in data scraping and databases.
                            Dilan works on the back-end team for WDID,
                            focusing on API integration and testing new features.</p>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Dilan Samarasuriya</h5>
                <span>backend</span>
            </div>
        </div>
        <div class="col-md-4 col-sm-4">
            <div class="team-member">
                <div class="team-img">
                    <img src="/assets/shen.png" alt="team member" class="img-fluid">
                </div>
                <div class="team-hover">
                    <div class="desk">
                        <p>Shen is a masters student in ECE at UT.
                            He is also our cheerleader and TA for 461L.
                            Shen has empowered us in spirit and intellect.
                            Thank you Shen.</p>
                    </div>
                </div>
            </div>
            <div class="team-title">
                <h5>Xiaocheng Shen</h5>
                <span>cheerleader</span>
            </div>
        </div>
    </div>

</div>

</body>
</html>
