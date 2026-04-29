/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.Employee;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zynsz
 */
public class PayrollServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          List<Employee> employeeList = new ArrayList<>();
          
                    Employee e1 = new Employee();
                    e1.setEmpID("E001"); 
                    e1.setName("Ahmad bin Abdullah"); 
                    e1.setDepartment("IT"); 
                    e1.setBasicSalary(5500.00);

                    Employee e2 = new Employee();
                    e2.setEmpID("E002"); 
                    e2.setName("Nurul Huda binti Ismail"); 
                    e2.setDepartment("HR"); 
                    e2.setBasicSalary(4800.00);

                    Employee e3 = new Employee();
                    e3.setEmpID("E003"); 
                    e3.setName("Rajendran a/l Subramaniam"); 
                    e3.setDepartment("Finance"); 
                    e3.setBasicSalary(6200.00);

                    Employee e4 = new Employee();
                    e4.setEmpID("E004"); 
                    e4.setName("Siti Aisyah binti Mohd Ali"); 
                    e4.setDepartment("Marketing"); 
                    e4.setBasicSalary(5100.00);

                    Employee e5 = new Employee();
                    e5.setEmpID("E005"); 
                    e5.setName("Wong Wei Liang"); 
                    e5.setDepartment("IT"); 
                    e5.setBasicSalary(2900.00);

                    employeeList.add(e1);
                    employeeList.add(e2);
                    employeeList.add(e3);
                    employeeList.add(e4);
                    employeeList.add(e5);

                    request.setAttribute("employeeList",employeeList);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("payroll_view.jsp");
            rd.forward(request, response);  
        
    }

}
