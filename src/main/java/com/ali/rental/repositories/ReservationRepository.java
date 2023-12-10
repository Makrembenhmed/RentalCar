package com.ali.rental.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.ali.rental.models.Car;
import com.ali.rental.models.RentalStatus;
import com.ali.rental.models.Reservation;
import com.ali.rental.models.User;

public interface ReservationRepository extends CrudRepository<Reservation, Long> {
	
	Reservation findByIdIs(Long id);
	List<Reservation>findAll();
	List<Reservation>findByCustomer(User customer);
	List<Reservation>findByCar(Car car);
	List<Reservation>findByStatus(RentalStatus status );

}
