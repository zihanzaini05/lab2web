<%-- 
    Document   : feeCalculator
    Created on : 27 Apr 2026, 1:03:40 am
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>  <%-- JSP Page Directive to import Java API --%>
<!DOCTYPE html>
<html>
<head>
    <title>Member Directory</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        
        <div class="main-content">
            <h2>Club Member Directory</h2>
            <p>List of students who have registered for clubs</p>
            
            <%
                // Retrieve member list from session
                ArrayList<String[]> memberList = (ArrayList<String[]>) session.getAttribute("memberList");
                
                if (memberList == null || memberList.isEmpty()) {
            %>
                <div class="info-card">
                    <p><strong>No members registered yet.</strong></p>
                    <p>Be the first to <a href="registerClub.jsp">register here</a>.</p>
                </div>
            <%
                } else {
            %>
                <div class="info-card">
                    <p><strong>Total Registered Members:</strong> <%= memberList.size() %></p>
                </div>
                
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Student Name</th>
                            <th>Matric Number</th>
                            <th>Club</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Dynamically display all registered members
                            for (int i = 0; i < memberList.size(); i++) {
                                String[] member = memberList.get(i);
                        %>
                        <tr>
                            <td><%= i + 1 %></td>
                            <td><%= member[0] %></td>   <%-- Name --%>
                            <td><%= member[1] %></td>   <%-- Matric --%>
                            <td><%= member[2] %></td>   <%-- Club --%>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            <%
                }
            %>
            
            <div style="margin-top: 20px;">
                <a href="registerClub.jsp" class="btn btn-primary">Register New Member</a>
                <a href="feeCalculator.jsp" class="btn btn-secondary">Calculate Fee</a>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>