package com.Model;

public class Car {
    private int carId;
    private String brand;
    private String model;
    private int cylinder;
    private double price;
    
    // Default constructor
    public Car() {}
    
    // Constructor without ID (for insert)
    public Car(String brand, String model, int cylinder, double price) {
        this.brand = brand;
        this.model = model;
        this.cylinder = cylinder;
        this.price = price;
    }
    
    // Constructor with ID (for update/select)
    public Car(int carId, String brand, String model, int cylinder, double price) {
        this.carId = carId;
        this.brand = brand;
        this.model = model;
        this.cylinder = cylinder;
        this.price = price;
    }
    
    // Getters and Setters
    public int getCarId() {
        return carId;
    }
    
    public void setCarId(int carId) {
        this.carId = carId;
    }
    
    public String getBrand() {
        return brand;
    }
    
    public void setBrand(String brand) {
        this.brand = brand;
    }
    
    public String getModel() {
        return model;
    }
    
    public void setModel(String model) {
        this.model = model;
    }
    
    public int getCylinder() {
        return cylinder;
    }
    
    public void setCylinder(int cylinder) {
        this.cylinder = cylinder;
    }
    
    public double getPrice() {
        return price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
}