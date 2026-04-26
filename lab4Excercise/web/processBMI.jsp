<%-- 
    Document   : processBMI
    Created on : 27 Apr 2026, 1:11:44 am
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Processing BMI</title>
</head>
<body>
    <%
        // Retrieve form data using request.getParameter()
        String weightStr = request.getParameter("weight");
        String heightStr = request.getParameter("height");
        
        double weight = 0;
        double height = 0;
        double bmi = 0;
        String category = "";
        String errorMessage = null;
        
        // Validation - check if inputs are numeric
        try {
            weight = Double.parseDouble(weightStr);
            height = Double.parseDouble(heightStr);
            
            // Check if height is not zero
            if (height <= 0) {
                errorMessage = "Height cannot be zero or negative. Please enter a valid height.";
            } else {
                // Calculate BMI using Scriptlet: BMI = weight / (height^2)
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
        
        // Use JSP Standard Action <jsp:forward> with <jsp:param>
        if (errorMessage != null) {
    %>
            <jsp:forward page="bmiCalculator.jsp">
                <jsp:param name="error" value="<%= errorMessage %>" />
            </jsp:forward>
    <%
        } else {
    %>
            <jsp:forward page="resultBMI.jsp">
                <jsp:param name="weight" value="<%= weight %>" />
                <jsp:param name="height" value="<%= height %>" />
                <jsp:param name="bmi" value="<%= bmi %>" />
                <jsp:param name="category" value="<%= category %>" />
            </jsp:forward>
    <%
        }
    %>
</body>
</html>
