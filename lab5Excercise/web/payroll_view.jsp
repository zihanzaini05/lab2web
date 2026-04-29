<%-- 
    Document   : payroll_view
    Created on : 29 Apr 2026, 4:11:14 pm
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Employee Payroll List</h2>
            <table border="1" cellpadding="8">
                    <thead>
                            <tr style="background-color: lightgray;">
                                        
                                        <th>EmpID</th>
                                        <th>Name</th>
                                        <th>Department</th>
                                        <th>Basic Salary (RM)</th>
                                        <th>Status</th>
                                        
                            </tr>
                    </thead>
            <tbody>
                    <c:forEach  var="employee" items="${employeeList}">
                                <tr>
                                        
                                        <td>${employee.empID}</td>
                                        <td>${employee.name}</td>
                                        <td>${employee.department}</td>
                                        <td><fmt:formatNumber value="${employee.basicSalary}" pattern="#,##0.00"/>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${employee.basicSalary >=3000}">
                                                                <strong>Senior</strong>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <strong>Junior</strong>
                                                            </c:otherwise>
                                                        </c:choose>
                                                            
                                                    </td>
                                        
                                </tr>
                   </c:forEach>
            </tbody>
    </body>
</html>
