<%-- 
    Document   : processRegisteration
    Created on : 27 Apr 2026, 12:43:15 am
    Author     : zynsz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Confirmation</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        
        <div class="main-content">
            <h2>Registration Confirmation</h2>
            
            <%
                // Get form data
                String name = request.getParameter("studentName");
                String matric = request.getParameter("matricNo");
                String club = request.getParameter("selectedClub");
                
                if (name == null || name.trim().isEmpty()) {
                    name = "Not provided";
                }
                if (matric == null || matric.trim().isEmpty()) {
                    matric = "Not provided";
                }
                if (club == null || club.trim().isEmpty()) {
                    club = "Not selected";
                }
                
                // Get or create the member list from session
                ArrayList<String[]> memberList = (ArrayList<String[]>) session.getAttribute("memberList");
                if (memberList == null) {
                    memberList = new ArrayList<String[]>();
                }
                
                // Add current registration to the list
                String[] newMember = {name, matric, club};
                memberList.add(newMember);
                
                // Save back to session
                session.setAttribute("memberList", memberList);
                
                // Registration count
                Integer regCount = (Integer) session.getAttribute("regCount");
                if (regCount == null) {
                    regCount = 0;
                }
                regCount++;
                session.setAttribute("regCount", regCount);
            %>
            
            <div class="success-message">
                <strong>Registration Successful!</strong>
            </div>
            
            <div class="info-card">
                <h3>Your Registration Details:</h3>
                <p><strong>Name:</strong> <%= name %></p>
                <p><strong>Matric No:</strong> <%= matric %></p>
                <p><strong>Club:</strong> <%= club %></p>
            </div>
            
            <p>Total registered students: <strong><%= regCount %></strong></p>
            
            <div style="margin-top: 20px;">
                <a href="registerClub.jsp" class="btn btn-primary">Register Another</a>
                <a href="feeCalculator.jsp" class="btn btn-secondary">Calculate Fee</a>
                <a href="memberDirectory.jsp" class="btn btn-secondary">View Member Directory</a>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>