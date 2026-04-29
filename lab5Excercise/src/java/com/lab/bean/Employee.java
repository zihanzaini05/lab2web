/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lab.bean;

/**
 *
 * @author zynsz
 */
public class Employee {
            private String empID;
            private String name;
            private String department;
            private double basicSalary;
            
            // Empty Default Constructor (Compulsory for JavaBeans)
            public Employee() {
            }
            
            public String getEmpID() {
            return empID;
            }
            
            public void setEmpID(String empID) {
            this.empID = empID;
            }
            
            public String getName() {
            return name;
            }
            
            public void setName(String name) {
            this.name = name;
            }
            
            public String getDepartment() {
            return department;
            }
            
            public void setDepartment(String department) {
            this.department = department;
            }
            
            public double getBasicSalary() {
            return basicSalary;
            }
            
            public void setBasicSalary(double basicSalary) {
            this.basicSalary = basicSalary;
            }
    
}
