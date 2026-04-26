<%-- 
    Document   : index
    Created on : 27 Apr 2026, 12:36:31 am
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Student Club Registration</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        
        <div class="main-content">
            <h2>🎉 Welcome to Student Club Recruitment Week 2026! 🎉</h2>
            
            <div class="info-card">
                <p>The Faculty of Computer Science and Mathematics proudly presents 
                <strong>Student Club Recruitment Week 2026</strong>. This is your opportunity 
                to join various exciting clubs and activities!</p>
            </div>
            
            <h3>📌 Why Join a Club?</h3>
            <ul style="margin-left: 30px; margin-top: 10px;">
                <li>Develop soft skills</li>
                <li>Make new friends</li>
                <li>Enhance your resume</li>
                <li>Learn new things outside the classroom</li>
            </ul>
            
            <div style="margin-top: 30px;">
                <a href="registerClub.jsp" class="btn btn-primary">Register Now →</a>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
