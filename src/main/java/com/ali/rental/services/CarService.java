package com.ali.rental.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ali.rental.models.Car;
import com.ali.rental.repositories.CarRepository;

@Service
public class CarService {
	
	@Autowired
	private CarRepository carRepo;
	
	public List<Car> allCars(){
		return carRepo.findAll();
	}
	
	public Car updateCar(Car car) {
		return carRepo.save(car);
	}

	
	public List<Car> findByModel(String model){
		return carRepo.findByModel( model);
	}
	
	public List<Car>findByBrand(String brand){
		return carRepo.findByBrand(brand);
	}

	public List<String>findDistinctBrand(){
		return carRepo.findDistinctFieldNames();
	}
	
	
	public Car addCar(Car car) {
		return carRepo.save(car);
	}
	
	public void deleteCar(Car car) {
		carRepo.delete(car);
	}
	
	public Car findCar(Long id) {
		return carRepo.findByIdIs(id);
	}

}
