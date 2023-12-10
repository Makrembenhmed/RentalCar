package com.ali.rental.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ali.rental.models.Car;
import com.ali.rental.models.CarImage;
import com.ali.rental.models.RentalStatus;
import com.ali.rental.models.Reservation;
import com.ali.rental.models.User;
import com.ali.rental.services.CarImageService;
import com.ali.rental.services.CarService;
import com.ali.rental.services.ReservationService;
import com.ali.rental.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class MainController {
	
	@Autowired
	private CarService cars;
	@Autowired
	private ReservationService rserv;
	@Autowired
	private CarImageService carimgs;
	@Autowired
	private UserService suser;
	
	
	@GetMapping("/")
	public String index(Model model,HttpSession s) {
		
		
		Long userid = (Long) s.getAttribute("user_id");
		if (userid != null) {
		
		User user=suser.findById(userid);
		model.addAttribute("user", user);
	   
		
	    List<Car> allCars=this.cars.allCars();
    	List<CarImage> allcarimage=this.carimgs.allImg();
    	
    	model.addAttribute("allcarimage",allcarimage);
    	model.addAttribute("allCars",allCars);
    	
    	List<Reservation> confirmreserv=this.rserv.rentalStatus(RentalStatus.CONFIRMED);
    	for (Reservation reservation : confirmreserv) {
    	    Date startDate = reservation.getStartDate();
    	    Date now = new Date();

    	    if (startDate.equals(now) || startDate.after(now)) {
    	        
    	    	reservation.setStatus(RentalStatus.INPROGRESS);
    //	    	return "test.jsp";
    	    }
    	    
    	}
	    return "index.jsp";
		}
		else {
			
		    List<Car> allCars=this.cars.allCars();
	    	List<CarImage> allcarimage=this.carimgs.allImg();
	    	
	    	model.addAttribute("allcarimage",allcarimage);
	    	model.addAttribute("allCars",allCars);
	    	
	    	List<Reservation> confirmreserv=this.rserv.rentalStatus(RentalStatus.CONFIRMED);
	    	for (Reservation reservation : confirmreserv) {
	    	    Date startDate = reservation.getStartDate();
	    	    Date now = new Date();

	    	    if (startDate.equals(now) || startDate.after(now)) {
	    	        
	    	    	reservation.setStatus(RentalStatus.INPROGRESS);
	    //	    	return "test.jsp";
	    	    }
	    	    
	    	}
		    return "index.jsp";
		}
	}
	
	@GetMapping("/addCar")
	public String addCar(@ModelAttribute("car") Car car, Model model) {
		
		List<Car> allCars = cars.allCars();
		model.addAttribute("allCars", allCars);
		
		return "addCar.jsp";
		
	}
	
	 @PostMapping("/cars")
	    public String createCar(@Valid @ModelAttribute("car") Car car,BindingResult result,Model model) {

	    	if (result.hasErrors()) {
	    		List<Car> allCars = cars.allCars();
	    		model.addAttribute("allCars", allCars);
	    		return "addCar.jsp";
	    	}
	    	
	    	cars.addCar(car);
	    	
	    	return "redirect:/addCar";
	    }
	 
	 @GetMapping("/editCar/{id}")
		public String editCar(@PathVariable("id") Long id, Model model) {
			
		    Car car = cars.findCar(id);
			model.addAttribute("car", car);
			
			return "editCar.jsp";
			
		}
	 
	 @PutMapping("/editCar/{id}")
	    public String editCar(@Valid @ModelAttribute("car") Car car, BindingResult result, Model model) {
	        if (result.hasErrors()) {
	          
	            return "editCar.jsp";
	        } else {

	            cars.updateCar(car);

	            return "redirect:/addCar";
	        }

	    }
	  
	  @DeleteMapping("/car/{id}")
	    public String deleteCar(@PathVariable("id") Long id) {

            Car car=cars.findCar(id);
	        cars.deleteCar(car);
	        return "redirect:/addCar";

	    }
	  
	  // ADD IMAGES FOR EACH CAR
	    private static String UPLOAD_FOLDER="src/main/resources/static/images/";
	    
	    @GetMapping("/newimg/{id}")
	    public String Addpicture(@PathVariable("id") Long id , Model model) {
	        model.addAttribute("car",this.cars.findCar(id));
	       

	        return "addImage.jsp";

	    }
	    @PostMapping("/upload/{id}")
	    public String Upload(@RequestParam("pic") MultipartFile file,
	                       @PathVariable("id") Long id,
	                       RedirectAttributes redirectatt ) {
	        Car car=cars.findCar(id);
	        
	        // save the Uploaded file in the static folder
	        if (file.isEmpty()) {
	            redirectatt.addFlashAttribute("message",  " please upload your picture for Item  can not be empty!!!");
	            return "redirect:/newimg/{id}";
	        }
	        try {
	            //get the file throw it into the server folder
	            byte [] bytes=file.getBytes();
	            Path path=Paths.get(UPLOAD_FOLDER +file.getOriginalFilename());
	            Files.write(path, bytes);
	            // get url of the file we just uploaded 
	            String url="/images/"+file.getOriginalFilename();
	           
	            this.carimgs.uploadImg(car, url);
	        }catch(IOException e){
	            e.printStackTrace();
	        }
	        return "redirect:/newimg/{id}";


	    }
	    
	  
	
	    @GetMapping("/search/car")
	    public String caravailable (Model model) {
	    	
	    	
	    	
	    	List<Car> allCars=this.cars.allCars();
	    	List<CarImage> allcarimage=this.carimgs.allImg();
	    	
	    	model.addAttribute("allcarimage",allcarimage);
	    	model.addAttribute("allCars",allCars);
	    	
	    	
	    	
	    	return "preReservation.jsp";
	    }
	    
}
