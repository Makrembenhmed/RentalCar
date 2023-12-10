package com.ali.rental.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.rental.models.Car;
import com.ali.rental.models.RentalStatus;
import com.ali.rental.models.Reservation;
import com.ali.rental.models.User;
import com.ali.rental.repositories.ReservationRepository;

@Service
public class ReservationService {
  

	 
	 @Autowired
		private ReservationRepository reservationRepo;
		
		public List<Reservation> allReservations(){
			return reservationRepo.findAll();
		}
		
		public List<Reservation> rentalStatus(RentalStatus status){
			return reservationRepo.findByStatus(status);
		}
		
		public Reservation updateReservation(Reservation reservation) {
			return reservationRepo.save(reservation);
		}

		
		public List<Reservation> reservationCustomer(User customer){
			return reservationRepo.findByCustomer(customer);
		}
		
		public List<Reservation>findByCar(Car car){
			return reservationRepo.findByCar(car);
		}
		
		
		public Reservation addReservation(Reservation reservation) {
			return reservationRepo.save(reservation);
		}
		
		public void deleteReservation(Reservation reservation) {
			reservationRepo.delete(reservation);
		}
		
		public Reservation  findById(Long id){
			return reservationRepo.findByIdIs(id);
		}

		
}
