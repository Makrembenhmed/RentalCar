package com.ali.rental.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;


@Entity
@Table(name="cars")
public class Car {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="brand is required!")
    @Size(min=3, max=30, message="brand must be between 3 and 30 characters")
	private String brand;
    
    @NotBlank(message="model is required!")
    @Size(min=3, max=30, message="model must be between 3 and 30 characters")
    private String model;
    @NotBlank(message="state is required!")
    private String state;
    
    @NotBlank(message="color is required!")
    @Size(min=3, max=128, message="color must be between 8 and 128 characters")
    private String color;
    
    private int year;
    
    @NotNull
	@Min(0)
	private Double price;
    
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
     private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    @OneToMany(mappedBy="car", fetch = FetchType.LAZY)
    private List<Reservation> reservations;
    
    @OneToMany(mappedBy = "car", cascade = CascadeType.ALL)
    private List<CarImage> carImages;

	public Car() {}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public List<Reservation> getReservations() {
		return reservations;
	}
	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}
	public List<CarImage> getCarImages() {
		return carImages;
	}
	public void setCarImages(List<CarImage> carImages) {
		this.carImages = carImages;
	}
	
	
	
	
    
    

}
