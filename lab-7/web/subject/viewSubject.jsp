<%-- 
    Document   : viewSubject
    Created on : 19 May 2026, 4:42:53 pm
    Author     : Ainaa Nadhirah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%@page import="com.lab.bean.SubjectBean"%>
<%@page import="com.lab.dao.SubjectDAO"%>
<%@page import="java.util.List"%>
<%
    StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
    SubjectDAO dao = new SubjectDAO();
    List<SubjectBean> subjectList = dao.getSubjectsByStudent(loggedUser.getMatricNo());
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Registered Subjects</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Academic Subjects for <%= loggedUser.getFullname() %></h2>
            <div>
                <a href="<%= request.getContextPath() %>/dashboard.jsp" class="btn btn-secondary me-2">Back to Dashboard</a>
                <a href="registerSubject.jsp" class="btn btn-primary">Register New Subject</a>
            </div>
        </div>
        
        <div class="card shadow-sm">
            <div class="card-body">
                <table class="table table-striped table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>Subject Code</th>
                            <th>Subject Name</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if(subjectList.isEmpty()) { %>
                            <tr>
                                <td colspan="4" class="text-center text-muted py-4">No subjects registered yet.</td>
                            </tr>
                        <% } else { 
                            int count = 1;
                            for(SubjectBean sb : subjectList) { 
                        %>
                            <tr>
                                <td><%= count++ %></td>
                                <td><strong><%= sb.getSubjectCode() %></strong></td>
                                <td><%= sb.getSubjectName() %></td>
                                <td class="text-center">
                                    <a href="updateSubject.jsp?id=<%= sb.getId() %>" class="btn btn-warning btn-sm me-2">Edit</a>
                                    <a href="<%= request.getContextPath() %>/SubjectServlet?action=delete&id=<%= sb.getId() %>" 
                                       class="btn btn-danger btn-sm" 
                                       onclick="return confirm('Remove this subject registration?');">Delete</a>
                                </td>
                            </tr>
                        <%     }
                           } 
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>