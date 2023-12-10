package com.ali.rental.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="reservations")
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	
	 
	 @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="car_id")
	    private Car car;

	  //  @Column(insertable=false, updatable=false)
	    @ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="user_id")
	    private User customer;
	    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	    private Date startDate;
	    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	    private Date endDate;
	    private double totalCost;
	    
	    @Enumerated
	    private RentalStatus status;

		public Reservation() {}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public Car getCar() {
			return car;
		}

		public void setCar(Car car) {
			this.car = car;
		}

		public User getCustomer() {
			return customer;
		}

		public void setCustomer(User customer) {
			this.customer = customer;
		}

		public Date getStartDate() {
			return startDate;
		}

		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}

		public Date getEndDate() {
			return endDate;
		}

		public void setEndDate(Date endDate) {
			this.endDate = endDate;
		}

		public double getTotalCost() {
			return totalCost;
		}

		public void setTotalCost(double totalCost) {
			this.totalCost = totalCost;
		}

		public RentalStatus getStatus() {
			return status;
		}

		public void setStatus(RentalStatus status) {
			this.status = status;
		}
		
		
	    
	    

}
