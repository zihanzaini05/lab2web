<%-- 
    Document   : registerSubject
    Created on : 19 May 2026, 4:40:23 pm
    Author     : Ainaa Nadhirah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%
    StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Add New Academic Subject</h4>
            </div>
            <div class="card-body">
                <form action="<%= request.getContextPath() %>/SubjectServlet" method="POST">
                    <input type="hidden" name="action" value="add">
                    
                    <div class="mb-3">
                        <label class="form-label">Subject Code</label>
                        <input type="text" name="subjectCode" class="form-url form-control" placeholder="e.g., CSE3023" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Subject Name</label>
                        <input type="text" name="subjectName" class="form-control" placeholder="e.g., Web-Based Application Development" required>
                    </div>
                    
                    <div class="d-flex justify-content-end gap-2">
                        <a href="viewSubjects.jsp" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-primary">Save Subject</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>