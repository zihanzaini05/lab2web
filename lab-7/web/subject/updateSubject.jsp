<%-- 
    Document   : updateServlet
    Created on : 19 May 2026, 4:42:04 pm
    Author     : Ainaa Nadhirah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.lab.bean.StudentBean"%>
<%@page import="com.lab.bean.SubjectBean"%>
<%@page import="com.lab.dao.SubjectDAO"%>
<%
    StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.html");
        return;
    }
    
    String idParam = request.getParameter("id");
    if(idParam == null || idParam.isEmpty()) {
        response.sendRedirect("viewSubjects.jsp");
        return;
    }
    
    SubjectDAO dao = new SubjectDAO();
    SubjectBean sb = dao.getSubjectById(Integer.parseInt(idParam));
    
    // Safety check: ensure subject exists and belongs to the current logged-in user
    if(sb == null || !sb.getMatricNo().equals(loggedUser.getMatricNo())) {
        response.sendRedirect("viewSubjects.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card shadow">
            <div class="card-header bg-warning text-dark">
                <h4 class="mb-0">Modify Subject Registration</h4>
            </div>
            <div class="card-body">
                <form action="<%= request.getContextPath() %>/SubjectServlet" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= sb.getId() %>">
                    
                    <div class="mb-3">
                        <label class="form-label">Subject Code</label>
                        <input type="text" name="subjectCode" class="form-control" value="<%= sb.getSubjectCode() %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Subject Name</label>
                        <input type="text" name="subjectName" class="form-control" value="<%= sb.getSubjectName() %>" required>
                    </div>
                    
                    <div class="d-flex justify-content-end gap-2">
                        <a href="viewSubjects.jsp" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-warning">Update Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>