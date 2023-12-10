package com.ali.rental.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ali.rental.models.Car;


public interface CarRepository extends CrudRepository<Car, Long> {

	List<Car>findAll();
	List<Car>findByModel(String model);
	List<Car>findByBrand(String brand);
	Car findByIdIs(Long id);
	//List<Car>findCarBetween();
	 @Query("SELECT DISTINCT brand FROM Car ")
	    List<String> findDistinctFieldNames();

	
}
