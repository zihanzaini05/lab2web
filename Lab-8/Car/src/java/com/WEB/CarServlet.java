/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.WEB;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CarDAO;
import com.Model.Car;

public class CarServlet extends HttpServlet {
    private CarDAO carDAO;
    
    public void init(){
       carDAO = new CarDAO(); 
    }
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        // Default to list action if no action parameter is provided
        if (action == null) {
            action = "list";
        }
        
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertCar(request, response);
                    break;
                case "delete":
                    deleteCar(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateCar(request, response);
                    break;
                default:
                    listCar(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void listCar(HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List <Car> listCar = carDAO.selectAllCars();
        request.setAttribute("listCar", listCar);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarList.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showNewForm(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarForm.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Car existingCar = carDAO.selectCar(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarForm.jsp");
        request.setAttribute("car", existingCar);
        dispatcher.forward(request, response);
    } 
    
    private void insertCar(HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, IOException {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cylinder = Integer.parseInt(request.getParameter("cylinder"));
        double price = Double.parseDouble(request.getParameter("price"));
        Car newCar = new Car(brand, model, cylinder, price);
        carDAO.insertCar(newCar);
        response.sendRedirect(request.getContextPath() + "/?action=list");
    }
    
    private void updateCar(HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cylinder = Integer.parseInt(request.getParameter("cylinder"));
        double price = Double.parseDouble(request.getParameter("price"));
        Car car = new Car(id, brand, model, cylinder, price);
        carDAO.updateCar(car);
        response.sendRedirect(request.getContextPath() + "/?action=list");
    }
    
    private void deleteCar(HttpServletRequest request,
            HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        carDAO.deleteCar(id);
        response.sendRedirect(request.getContextPath() + "/?action=list");
    }
}