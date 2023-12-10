package com.ali.rental.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ali.rental.models.Car;
import com.ali.rental.models.RentalStatus;
import com.ali.rental.models.Reservation;
import com.ali.rental.models.User;
import com.ali.rental.services.CarService;
import com.ali.rental.services.ReservationService;
import com.ali.rental.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class RentalController {

	@Autowired
	private CarService cars;

	@Autowired
	private ReservationService rserv;
	@Autowired
	private UserService userv;

	@GetMapping("/new/rental/{id}")
	public String rentalCar(@PathVariable("id") Long id, @ModelAttribute("rental") Reservation rental, Model model,
			RedirectAttributes redirectatt, HttpSession s) {
		Long userid = (Long) s.getAttribute("user_id");
		if (userid == null) {

			return "redirect:/login";
		}

		else {
			// update status car

			User user = this.userv.findById(userid);
			Car car = cars.findCar(id);

			List<Reservation> Rescar = car.getReservations();

			/*
			 * for (Reservation reservation : Rescar) { // Date startDate =
			 * reservation.getStartDate(); //Date now = new Date();
			 * 
			 * if (reservation.getStatus()== RentalStatus.INPROGRESS ) {
			 * 
			 * Long idr=reservation.getId();
			 * 
			 * model.addAttribute("idr", idr);
			 * 
			 * }
			 * 
			 * 
			 * 
			 * }
			 */

			model.addAttribute("Rescar", Rescar);
			model.addAttribute("car", car);
			model.addAttribute("user", user);

			return "rental.jsp";
		}

	}

	@GetMapping("/all/reservation")
	public String allrentalUser(Model model, HttpSession s) {
		Long userid = (Long) s.getAttribute("user_id");

		if (userid == null) {

			return "redirect:/login";
		}

		else {
			User user = this.userv.findById(userid);
			List<Reservation> reserbyuser = this.rserv.reservationCustomer(user);

			model.addAttribute("user", user);
			model.addAttribute("reserbyuser", reserbyuser);

			List<Reservation> confirmreserv = this.rserv.rentalStatus(RentalStatus.CONFIRMED);
			model.addAttribute("confirmed", confirmreserv);
			for (Reservation reservation : confirmreserv) {
				Date startDate = reservation.getStartDate();
				
				Date now = new Date();

				if (startDate.equals(now) || startDate.before(now)) {

					reservation.setStatus(RentalStatus.INPROGRESS);

					this.rserv.updateReservation(reservation);

				}
				
			}

			List<Reservation> progresreserv = this.rserv.rentalStatus(RentalStatus.INPROGRESS);
			//model.addAttribute("confirmed", confirmreserv);
			for (Reservation reservation : progresreserv) {
				
			Date endDate = reservation.getEndDate();
			Date now = new Date();
			if (endDate.equals(now) || endDate.before(now)) {

				reservation.setStatus(RentalStatus.COMPLETED);

				this.rserv.updateReservation(reservation);

			}

			}
			return "reservationuser.jsp";
		}

	}

	@PostMapping("/new/reservation/{idc}/{idu}/{idres}")
	public String newRental(@Valid @ModelAttribute("rental") Reservation rental, BindingResult result, Model model,
			@RequestParam("startDate") String sdate, @RequestParam("endDate") String edate,
			@PathVariable("idres") Long idres,

			@PathVariable("idc") Long idc, @PathVariable("idu") Long idu, RedirectAttributes redirectatt, HttpSession s)
			throws ParseException {

		model.addAttribute("rental", new Reservation());
		// check if user loged?
		Long userid = (Long) s.getAttribute("user_id");

		if (userid == null) {

			return "redirect:/login";
		}

		// if errors

		if (result.hasErrors()) {
			User user = this.userv.findById(idu);
			Car car = cars.findCar(idc);
			model.addAttribute("car", car);
			model.addAttribute("user", user);
			return "rental.jsp";
		} else {

			// save reservation

			//
			if (idres == 0) {

				String dateString = sdate;
				String pattern = "yyyy-MM-dd'T'HH:mm";
				String dateStringend = edate;
				String patternend = "yyyy-MM-dd'T'HH:mm";

				try {
					if (sdate == "" || sdate == "null") {
						redirectatt.addFlashAttribute("message", " please depart date of your Rental is required!");
						return "redirect:/new/rental/{idc}";

					}

					SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
					Date departDate = dateFormat.parse(dateString);
					SimpleDateFormat dateFormat3 = new SimpleDateFormat(patternend);
					Date endDate = dateFormat3.parse(dateStringend);
					if (endDate.before(departDate)) {
						redirectatt.addFlashAttribute("message", " please depart date must be before end date!");
						return "redirect:/new/rental/{idc}";

					}
					rental.setEndDate(endDate);
					rental.setStartDate(departDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}

				// convert date end: string to date

				// Time difference in minutes:
				String dateString1 = sdate;
				String dateString2 = edate;

				String patternd = "yyyy-MM-dd'T'HH:mm";

				try {
					SimpleDateFormat dateFormatd = new SimpleDateFormat(patternd);

					// Parse the date strings into Date objects
					Date date1 = dateFormatd.parse(dateString1);
					Date date2 = dateFormatd.parse(dateString2);

					// Calculate the time difference
					long timeDifferenceInMillis = date2.getTime() - date1.getTime();

					// Convert milliseconds to minutes (or other time units as needed)
					// long minutesDifference =
					// TimeUnit.MILLISECONDS.toMinutes(timeDifferenceInMillis);

					// Convert milliseconds to hours
					long hoursDifference = TimeUnit.MILLISECONDS.toHours(timeDifferenceInMillis);
					Car selectcar = this.cars.findCar(idc);
					float pricehours = (float) (selectcar.getPrice() / 24);
					rental.setTotalCost(pricehours * hoursDifference);
				} catch (ParseException e) {
					e.printStackTrace();
				}

				User currentuser = this.userv.findById(userid);
				Car selectcar = this.cars.findCar(idc);

				rental.setCar(selectcar);
				rental.setCustomer(currentuser);

				rental.setStatus(RentalStatus.CONFIRMED);

				// After adding the reservation
				Reservation reservat = rserv.addReservation(rental);
				model.addAttribute("rental", reservat);
				model.addAttribute("car", selectcar);
				model.addAttribute("user", currentuser);

				return "redirect:/detaills/reservation/" + reservat.getId();

			}

			Reservation oldres = rserv.findById(idres);
			Date olddate = oldres.getEndDate();
			String dateString3 = sdate;

			String patternn = "yyyy-MM-dd'T'HH:mm";
			SimpleDateFormat dateFormat1 = new SimpleDateFormat(patternn);
			Date departDate1 = dateFormat1.parse(dateString3);
			// SimpleDateFormat dateFormat2 = new SimpleDateFormat(patternn);

			if (departDate1.before(olddate)) {

				redirectatt.addFlashAttribute("message1", " change the depart date !");
				return "redirect:/new/rental/{idc}";
			}

			String dateString = sdate;
			String pattern = "yyyy-MM-dd'T'HH:mm";
			String dateStringend = edate;
			String patternend = "yyyy-MM-dd'T'HH:mm";

			try {
				if (sdate == "" || sdate == "null") {
					redirectatt.addFlashAttribute("message", " please depart date of your Rental is required!");
					return "redirect:/new/rental/{idc}";

				}

				SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
				Date departDate = dateFormat.parse(dateString);
				SimpleDateFormat dateFormat3 = new SimpleDateFormat(patternend);
				Date endDate = dateFormat3.parse(dateStringend);
				if (endDate.before(departDate)) {
					redirectatt.addFlashAttribute("message", " please depart date must be before end date!");
					return "redirect:/new/rental/{idc}";

				}
				rental.setEndDate(endDate);
				rental.setStartDate(departDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			// convert date end: string to date

			// Time difference in minutes:
			String dateString1 = sdate;
			String dateString2 = edate;

			String patternd = "yyyy-MM-dd'T'HH:mm";

			try {
				SimpleDateFormat dateFormatd = new SimpleDateFormat(patternd);

				// Parse the date strings into Date objects
				Date date1 = dateFormatd.parse(dateString1);
				Date date2 = dateFormatd.parse(dateString2);

				// Calculate the time difference
				long timeDifferenceInMillis = date2.getTime() - date1.getTime();

				// Convert milliseconds to minutes (or other time units as needed)
				// long minutesDifference =
				// TimeUnit.MILLISECONDS.toMinutes(timeDifferenceInMillis);

				// Convert milliseconds to hours
				long hoursDifference = TimeUnit.MILLISECONDS.toHours(timeDifferenceInMillis);
				Car selectcar = this.cars.findCar(idc);
				float pricehours = (float) (selectcar.getPrice() / 24);
				rental.setTotalCost(pricehours * hoursDifference);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			User currentuser = this.userv.findById(userid);
			Car selectcar = this.cars.findCar(idc);

			rental.setCar(selectcar);
			rental.setCustomer(currentuser);

			rental.setStatus(RentalStatus.CONFIRMED);

			// After adding the reservation
			Reservation reservat = rserv.addReservation(rental);
			model.addAttribute("rental", reservat);
			model.addAttribute("car", selectcar);
			model.addAttribute("user", currentuser);

			return "redirect:/detaills/reservation/" + reservat.getId();

		}

	}

	@GetMapping("/detaills/reservation/{id}")
	public String detaiRental(@PathVariable("id") Long id, @ModelAttribute("rental") Reservation rental, Model model,
			HttpSession s) {
		Long userid = (Long) s.getAttribute("user_id");
		if (userid == null) {

			return "redirect:/login";
		}
		Reservation curentrental = rserv.findById(id);
		model.addAttribute("curentrental", curentrental);

		User user = this.userv.findById(userid);
		model.addAttribute("user", user);
		Car car = curentrental.getCar();
		model.addAttribute("car", car);

		return "confirmrental.jsp";

	}

	@GetMapping("/editreservation/{id}")
	public String editRental(@PathVariable("id") Long id, @ModelAttribute("rental") Reservation rental, Model model,
			HttpSession s) {
		Long userid = (Long) s.getAttribute("user_id");
		if (userid == null) {

			return "redirect:/login";
		}

		Reservation curentrental = rserv.findById(id);
		model.addAttribute("curentrental", curentrental);

		User user = this.userv.findById(userid);
		model.addAttribute("user", user);
		Car car = curentrental.getCar();
		model.addAttribute("car", car);

		return "confirmrental.jsp";

	}

	@PutMapping("/editrental/{id}")
	public String updateRental(@Valid @ModelAttribute("rental") Reservation rental, BindingResult result,
			@PathVariable("id") Long id, @RequestParam("startDate") String sdate, @RequestParam("endDate") String edate,
			Model model, RedirectAttributes redirectatt, HttpSession s) throws ParseException {

		Long userid = (Long) s.getAttribute("user_id");
		if (userid == null) {

			return "redirect:/login";
		}
		// if errors
		Reservation rent = rserv.findById(id);
		User user = this.userv.findById(userid);
		Car car = rent.getCar();
		if (result.hasErrors()) {

			model.addAttribute("rental", rent);

			model.addAttribute("user", user);

			model.addAttribute("car", car);

			return "confirmrental.jsp";
		} else {
			// if no errors

			if (sdate == "" || sdate == "null") {
				redirectatt.addFlashAttribute("message", " please depart date of your Rental is required!");
				return "redirect:/editreservation/{id}";

			}
			if (edate == "" || edate == "null") {
				redirectatt.addFlashAttribute("message", " please depart date of your Rental is required!");
				return "redirect:/editreservation/{id}";

			}
			String dateString = sdate;
			String pattern = "yyyy-MM-dd'T'HH:mm";
			String dateStringend = edate;
			String patternend = "yyyy-MM-dd'T'HH:mm";
			SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
			Date departDate = dateFormat.parse(dateString);
			SimpleDateFormat dateFormat1 = new SimpleDateFormat(patternend);
			Date endDate = dateFormat1.parse(dateStringend);
			if (endDate.before(departDate)) {
				redirectatt.addFlashAttribute("message", " please depart date must be before end date!");
				return "redirect:/editreservation/{id}";

			}

			// Time difference in minutes:
			String dateString1 = sdate;
			String dateString2 = edate;

			String patternd = "yyyy-MM-dd'T'HH:mm";

			try {
				SimpleDateFormat dateFormatd = new SimpleDateFormat(patternd);

				// Parse the date strings into Date objects
				Date date1 = dateFormatd.parse(dateString1);
				Date date2 = dateFormatd.parse(dateString2);

				// Calculate the time difference
				long timeDifferenceInMillis = date2.getTime() - date1.getTime();

				// Convert milliseconds to minutes (or other time units as needed)
				// long minutesDifference =
				// TimeUnit.MILLISECONDS.toMinutes(timeDifferenceInMillis);

				// Convert milliseconds to hours
				long hoursDifference = TimeUnit.MILLISECONDS.toHours(timeDifferenceInMillis);
				// Car car=this.cars.findCar(rent.getId());
				double pricehours = (car.getPrice() / 24);
				rental.setTotalCost(pricehours * hoursDifference);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			rental.setCar(car);
			rental.setCustomer(user);
			rental.setStatus(RentalStatus.CONFIRMED);

			rserv.updateReservation(rental);

			return "redirect:/all/reservation";

		}
	}

	@DeleteMapping("/reservation/{id}")
	public String deleteReservation(@PathVariable("id") Long id, Model model, HttpSession s) {

		Long userid = (Long) s.getAttribute("user_id");
		if (userid == null) {

			return "redirect:/login";
		}
		Reservation reservation = this.rserv.findById(id);
		rserv.deleteReservation(reservation);

		return "redirect:/all/reservation";

	}

}
