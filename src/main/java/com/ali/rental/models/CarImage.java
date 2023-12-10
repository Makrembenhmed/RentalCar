package com.ali.rental.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="images")
public class CarImage {
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long imageId;
	    private String imageUrl;

	    @ManyToOne
	    @JoinColumn(name = "car_id")
	    private Car car;

	    
	    
		public CarImage() {
			
		}

		public CarImage(String imageUrl, Car car) {
			this.imageUrl=imageUrl;
			this.car=car;
		}

		public Long getImageId() {
			return imageId;
		}

		public void setImageId(Long imageId) {
			this.imageId = imageId;
		}

		public String getImageUrl() {
			return imageUrl;
		}

		public void setImageUrl(String imageUrl) {
			this.imageUrl = imageUrl;
		}

		public Car getCar() {
			return car;
		}

		public void setCar(Car car) {
			this.car = car;
		}
		
		
	    
	    

}
