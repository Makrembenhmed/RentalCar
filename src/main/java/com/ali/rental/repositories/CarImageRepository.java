package com.ali.rental.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ali.rental.models.Car;
import com.ali.rental.models.CarImage;
import com.ali.rental.models.User;

@Repository
public interface CarImageRepository extends CrudRepository<CarImage, Long> {
	
	List<CarImage> findAllByCar(Car car);
	List<CarImage> findAll();


}
