/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SubjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SubjectDAO subjectDAO = new SubjectDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }
        
        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            SubjectBean sb = new SubjectBean();
            sb.setMatricNo(loggedUser.getMatricNo());
            sb.setSubjectCode(request.getParameter("subjectCode"));
            sb.setSubjectName(request.getParameter("subjectName"));
            
            subjectDAO.addSubject(sb);
            response.sendRedirect(request.getContextPath() + "/subject/viewSubject.jsp");

        } else if ("update".equals(action)) {
            SubjectBean sb = new SubjectBean();
            sb.setId(Integer.parseInt(request.getParameter("id")));
            sb.setMatricNo(loggedUser.getMatricNo());
            sb.setSubjectCode(request.getParameter("subjectCode"));
            sb.setSubjectName(request.getParameter("subjectName"));
            
            subjectDAO.updateSubject(sb);
            response.sendRedirect(request.getContextPath() + "/subject/viewSubject.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }
        
        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            subjectDAO.deleteSubject(id, loggedUser.getMatricNo());
            response.sendRedirect(request.getContextPath() + "/subject/viewSubject.jsp");
        }
    }
}