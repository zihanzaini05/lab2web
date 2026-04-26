<%-- 
    Document   : bmiCalculator
    Created on : 27 Apr 2026, 1:11:18 am
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
    <title>BMI Calculator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        
        <div class="card">
            <h1 class="form-title">BMI Calculator</h1>
            <p>Enter your weight (kg) and height (m) to calculate your Body Mass Index.</p>
            <p style="color: red; font-size: 12px;"><strong>Note:</strong> Height must be in METERS (e.g., 1.75 for 175cm). Do not enter in cm!</p>
            
            <%
                // Declare variables
                double weight = 0;
                double height = 0;
                double bmi = 0;
                String category = "";
                String errorMessage = null;
                boolean formSubmitted = false;
                
                // Get form data if submitted
                String weightStr = request.getParameter("weight");
                String heightStr = request.getParameter("height");
                
                if (weightStr != null && heightStr != null && !weightStr.isEmpty() && !heightStr.isEmpty()) {
                    formSubmitted = true;
                    
                    try {
                        weight = Double.parseDouble(weightStr);
                        height = Double.parseDouble(heightStr);
                        
                        // Validation: weight and height must be positive
                        if (weight <= 0) {
                            errorMessage = "Weight must be greater than 0.";
                        } else if (height <= 0) {
                            errorMessage = "Height cannot be zero or negative. Please enter a valid height in METERS.";
                        } else if (height > 10) {
                            errorMessage = "Height seems too high! Did you enter in cm? Please use METERS (e.g., 1.75 for 175cm).";
                        } else {
                            // Calculate BMI: weight / (height^2)
                            bmi = weight / (height * height);
                            
                            // Determine BMI category
                            if (bmi < 18.5) {
                                category = "Underweight";
                            } else if (bmi >= 18.5 && bmi <= 25) {
                                category = "Normal";
                            } else {
                                category = "Overweight";
                            }
                        }
                    } catch (NumberFormatException e) {
                        errorMessage = "Invalid input. Please enter numeric values for weight and height.";
                    }
                }
                
                DecimalFormat df = new DecimalFormat("0.00");
            %>
            
            <!-- BMI Input Form -->
            <form action="bmiCalculator.jsp" method="post">
                <div class="form-group">
                    <label for="weight">Weight (kg):</label>
                    <input type="number" id="weight" name="weight" step="0.1" required 
                           value="<%= formSubmitted && errorMessage == null ? weightStr : "" %>"
                           placeholder="e.g., 70">
                </div>
                
                <div class="form-group">
                    <label for="height">Height (m):</label>
                    <input type="number" id="height" name="height" step="0.01" required 
                           value="<%= formSubmitted && errorMessage == null ? heightStr : "" %>"
                           placeholder="e.g., 1.75 for 175cm">
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-submit">Calculate BMI</button>
                    <button type="reset" class="btn btn-cancel">Reset</button>
                </div>
            </form>
            
            <!-- Display Result if form submitted and no error -->
            <%
                if (formSubmitted) {
                    if (errorMessage != null) {
            %>
                <div class="info-card" style="background: #f8d7da; border-left-color: #dc3545;">
                    <p style="color: #721c24;"><strong>Error:</strong> <%= errorMessage %></p>
                </div>
            <%
                    } else {
                        // Prepare formatted values for forwarding
                        String formattedWeight = df.format(weight);
                        String formattedHeight = df.format(height);
                        String formattedBMI = df.format(bmi);
            %>
                        <!-- Forward using jsp:forward with jsp:param -->
                        <jsp:forward page="resultBMI.jsp">
                            <jsp:param name="weight" value="<%= formattedWeight %>" />
                            <jsp:param name="height" value="<%= formattedHeight %>" />
                            <jsp:param name="bmi" value="<%= formattedBMI %>" />
                            <jsp:param name="category" value="<%= category %>" />
                        </jsp:forward>
            <%
                    }
                }
            %>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
