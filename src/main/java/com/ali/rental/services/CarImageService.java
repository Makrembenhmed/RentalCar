package com.ali.rental.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.rental.models.Car;
import com.ali.rental.models.CarImage;
import com.ali.rental.repositories.CarImageRepository;

@Service
public class CarImageService {
	
	 @Autowired
	    private CarImageRepository imgRepo;

	    public CarImage uploadImg(Car car , String imageUrl ) {

	        CarImage img = new CarImage(imageUrl,car);
	        return imgRepo.save(img);
	    }

	    public List<CarImage> carImg(Car car){

	        return imgRepo.findAllByCar(car);
	    }

	    
	    public List<CarImage> allImg(){

	        return imgRepo.findAll();
	    }

}
