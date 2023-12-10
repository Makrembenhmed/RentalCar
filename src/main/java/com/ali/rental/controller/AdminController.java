package com.ali.rental.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ali.rental.models.Admin;
import com.ali.rental.models.Car;
import com.ali.rental.models.LoginAdmin;
import com.ali.rental.models.RentalStatus;
import com.ali.rental.models.Reservation;
import com.ali.rental.services.AdminService;
import com.ali.rental.services.CarService;
import com.ali.rental.services.ReservationService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AdminController {

	@Autowired
	private ReservationService rserv;
	
	@Autowired
	private AdminService adminserv;
	
	@Autowired
	private CarService carservice;


	@GetMapping("/admin/login")
	public String loginAdmin(@ModelAttribute("newAdmin") Admin newAdmin, @ModelAttribute("newLogin") LoginAdmin newLogin,
			Model model) {
		model.addAttribute("newAdmin", new Admin());
		model.addAttribute("newLogin", new LoginAdmin());

		return "adminlogin.jsp";
	}
	

	@PostMapping("/admin/register")
	public String register(@Valid @ModelAttribute("newAdmin") Admin newAdmin, BindingResult result, Model model,
			HttpSession session) {
		adminserv.register(newAdmin, result);	
			
		// TO-DO Later -- call a register method in the service
		// to do some extra validations and create a new user!

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newLogin", new LoginAdmin());
			return "adminlogin.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
			session.setAttribute("admin_id", newAdmin.getId());
			session.setAttribute("admin_pseudo", newAdmin.getPseudo());
		return "redirect:/admin/dashboard";
	}
	
	
	// Login 
	//Action route
	@PostMapping("/admin/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginAdmin newLogin, 
            BindingResult result, Model model, HttpSession session) {
         
        // Add once service is implemented:
		Admin admin = adminserv.login(newLogin, result);
		
        if(result.hasErrors()) {
            model.addAttribute("newAdmin", new Admin());
            return "adminlogin.jsp";
        }
    
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("admin_id", admin.getId());
		session.setAttribute("admin_pseudo", admin.getPseudo());
		return "redirect:/admin/dashboard";
        
    }
    
	@GetMapping("/admin/dashboard")
	public String dashboard (Model model, HttpSession s) {
		List<Reservation> rentals = this.rserv.allReservations();
		
		List<String> brands = this.carservice.findDistinctBrand();
		
		model.addAttribute("brands", brands);
		model.addAttribute("rentals", rentals);
		
		return "dashboard.jsp";
	}
	

	/*@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/login";
	}*/	

	
	

	@GetMapping("/management/reservations/")
	public String allrental(Model model, HttpSession s) {

		List<Reservation> rentals = this.rserv.allReservations();

		model.addAttribute("rentals", rentals);
		
		RentalStatus[] status=RentalStatus.values();
		model.addAttribute("status",status);

		List<Reservation> confirmreserv = this.rserv.rentalStatus(RentalStatus.CONFIRMED);
		model.addAttribute("confirmed", confirmreserv);
		for (Reservation reservation : confirmreserv) {
			Date startDate = reservation.getStartDate();
			Date now = new Date();

			if (startDate.equals(now) || startDate.before(now)) {

				reservation.setStatus(RentalStatus.INPROGRESS);

			}

		}

		return "managerreservation.jsp";
	}

	@GetMapping("/editreservation/admin/{id}")
	public String editconcel(@PathVariable("id") Long id, Model model, HttpSession s) {
		
		Reservation selectres=this.rserv.findById(id);
		selectres.setStatus(RentalStatus.CANCELED);
    	
    	this.rserv.updateReservation(selectres);
    	
		
		return "redirect:/admin/dashboard";
	}
	
	//List<Reservation> filterrental;
	
	@PostMapping("/editreservation/admin/{id}")
	public String searchRentals(@RequestParam("status") String status, Model model,RedirectAttributes redirectAttributes, HttpSession s) {
		
		 RentalStatus rentalStatus = RentalStatus.valueOf(status);

         List<Reservation> rentals = rserv.rentalStatus(rentalStatus);	
		
         model.addAttribute("rentals", rentals);
        // System.out.println("Rentals in searchRentals: " + rentals);
         
		
		return "redirect:/admin/dashboard/search/"+status;
	}
	

	@GetMapping("/admin/dashboard/search/{stat}")
	public String filter (@PathVariable("stat") String stat, RedirectAttributes redirectAttributes, Model model, HttpSession session) {
		  try {
		        RentalStatus rentalStatus = RentalStatus.valueOf(stat);
		        List<Reservation> rentals = rserv.rentalStatus(rentalStatus);
		        List<String> brands = this.carservice.findDistinctBrand();
				
				model.addAttribute("brands", brands);
				
		        model.addAttribute("rentals", rentals);
		        
		    } catch (IllegalArgumentException e) {
		        // Gérer le cas où la chaîne n'est pas un statut de location valide
		        redirectAttributes.addFlashAttribute("error", "Statut de location non valide");
		        return "redirect:/admin/dashboard"; // ou tout autre chemin approprié
		    }

		    return "dashboard.jsp";
		}
	


	@GetMapping("/admin/dashboard/brand/{brand}")
	public String filterbrand (@PathVariable("brand") String brand,Model model, HttpSession session) {
		  try {
		       
		        List<String> brands = this.carservice.findDistinctBrand();
				List<Car> bcars =this.carservice.findByBrand(brand);
				
				List<Reservation> rentals=new ArrayList<>();
				
				for (Car car : bcars) {
					
					List<Reservation> creserv=this.rserv.findByCar(car);
					for (Reservation reservation : creserv) {
						
						rentals.add(reservation);
					}
				}
				
				model.addAttribute("brands", brands);
				
				
				
		       model.addAttribute("rentals", rentals);
		        
		    } catch (IllegalArgumentException e) {
		        // Gérer le cas où la chaîne n'est pas un statut de location valide
		       // redirectAttributes.addFlashAttribute("error", "Statut de location non valide");
		        return "redirect:/admin/dashboard"; // ou tout autre chemin approprié
		    }

		    return "dashboard.jsp";
		}

	
}
