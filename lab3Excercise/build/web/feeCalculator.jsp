<%-- 
    Document   : feeCalculator
    Created on : 27 Apr 2026, 12:43:52 am
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Membership Fee Calculator</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        
        <div class="main-content">
            <h2>💰 Membership Fee Calculator</h2>
            <p>Each activity joined costs <strong>RM10</strong>. Calculate your total membership fee.</p>
            
            <div class="form-container">
                <form action="feeCalculator.jsp" method="post">
                    <div class="form-group">
                        <label for="numActivities">Number of Activities Joined:</label>
                        <input type="number" id="numActivities" name="numActivities" min="0" max="50" 
                               value="<%= request.getParameter("numActivities") != null ? request.getParameter("numActivities") : "0" %>"
                               required>
                    </div>
                    <button type="submit" class="btn btn-primary">Calculate Fee</button>
                    <a href="registerClub.jsp" class="btn btn-secondary">Register for Club</a>
                </form>
                
                <%
                    String numActivitiesParam = request.getParameter("numActivities");
                    if (numActivitiesParam != null && !numActivitiesParam.trim().isEmpty()) {
                        try {
                            int numActivities = Integer.parseInt(numActivitiesParam);
                            int costPerActivity = 10;
                            double totalFee = numActivities * costPerActivity;
                            java.text.DecimalFormat df = new java.text.DecimalFormat("0.00");
                %>
                
                <div class="info-card" style="margin-top: 30px;">
                    <h3>📊 Fee Calculation Result:</h3>
                    <p><strong>Number of Activities:</strong> <%= numActivities %></p>
                    <p><strong>Cost per Activity:</strong> RM <%= costPerActivity %>.00</p>
                    <hr>
                    <div class="fee-display">
                        Total Membership Fee: RM <%= df.format(totalFee) %>
                    </div>
                    <p style="font-size: 12px; color: #666; margin-top: 10px;">* Payment can be made at the faculty office counter.</p>
                </div>
                
                <%
                        } catch (NumberFormatException e) {
                %>
                <div class="success-message" style="background: #f8d7da; color: #721c24;">
                    Please enter a valid number of activities.
                </div>
                <%
                        }
                    } else if (request.getMethod().equalsIgnoreCase("POST")) {
                %>
                <div class="success-message" style="background: #f8d7da; color: #721c24;">
                    Please enter the number of activities.
                </div>
                <%
                    }
                %>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
