

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Car Shop Management</title>
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
    </head>
    <body>
        <header>
           <nav class="navbar navbar-expand-md navbar-dark"
                style="background-color: tomato">
               <div>
                   <a href="" class="navbar-brand"> Car Shop Management App </a>
               </div>
               
               <ul class="navbar-nav">
                   <li><a href="<%=request.getContextPath()%>/?action=list"
                          class="nav-link">Cars</a></li>
               </ul>
           </nav>   
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${car != null}">
                        <form action="<%=request.getContextPath()%>/?action=update" method="post">
                    </c:if>
                    <c:if test="${car == null}">
                        <form action="<%=request.getContextPath()%>/?action=insert" method="post">
                    </c:if>
                        
                        <h2>
                            <c:if test="${car != null}">
                                Edit Car
                            </c:if>
                            <c:if test="${car == null}">
                                Add New Car
                            </c:if>
                        </h2>
                        
                        <c:if test="${car != null}">
                            <input type="hidden" name="id" value="<c:out value='${car.carId}' default='0' />" />
                        </c:if>
                        
                        <fieldset class="form-group">
                            <label>Car Brand</label>
                            <input type="text" value="<c:out value='${car.brand}' />"
                                   class="form-control" name="brand"
                                   required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Car Model</label>
                            <input type="text" value="<c:out value='${car.model}' />"
                                   class="form-control" name="model"
                                   required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Engine Cylinder (CC)</label>
                            <input type="number" value="<c:out value='${car.cylinder}' />"
                                   class="form-control" name="cylinder"
                                   required="required">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Price (RM)</label>
                            <input type="number" step="0.01" value="<c:out value='${car.price}' />"
                                   class="form-control" name="price"
                                   required="required">
                        </fieldset>
                        
                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>