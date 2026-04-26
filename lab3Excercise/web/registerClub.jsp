<%-- 
    Document   : registerClub
    Created on : 27 Apr 2026, 12:42:42 am
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Club Registration</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        
        <div class="main-content">
            <h2>📝 Club Registration Form</h2>
            <p>Please fill in the details below to register.</p>
            
            <div class="form-container">
                <form action="processRegistration.jsp" method="post">
                    <div class="form-group">
                        <label for="studentName">Student Name:</label>
                        <input type="text" id="studentName" name="studentName" required 
                               placeholder="Enter your full name">
                    </div>
                    
                    <div class="form-group">
                        <label for="matricNo">Matric Number:</label>
                        <input type="text" id="matricNo" name="matricNo" required 
                               placeholder="E.g., A123456">
                    </div>
                    
                    <div class="form-group">
                        <label for="selectedClub">Select Club:</label>
                        <select id="selectedClub" name="selectedClub" required>
                            <option value="">-- Please select --</option>
                            <option value="Computer Science Club">💻 Computer Science Club</option>
                            <option value="Mathematics Society">📐 Mathematics Society</option>
                            <option value="Robotics Club">🤖 Robotics Club</option>
                            <option value="Data Science Club">📊 Data Science Club</option>
                            <option value="Cybersecurity Club">🔒 Cybersecurity Club</option>
                            <option value="Multimedia & Design Club">🎨 Multimedia & Design Club</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Register</button>
                    <button type="reset" class="btn btn-secondary">Cancel</button>
                </form>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
