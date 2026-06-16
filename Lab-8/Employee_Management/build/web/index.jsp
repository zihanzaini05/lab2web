
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management Application</title>
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
    </head>
    <body>
        <h1>Application MVC system for Employee Management</h1>
        
        <ul>
            <li><a href="<%=request.getContextPath()%>/?action=list">All Employee List</a></li>
            <li><a href="<%=request.getContextPath()%>/?action=new">Add a New Employee</a></li>
            <li><a href="<%=request.getContextPath()%>/?action=list">Edit Employee</a></li>
        </ul>
        
    </body>
</html>