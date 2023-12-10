package com.ali.rental.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ali.rental.models.Admin;
import com.ali.rental.models.LoginAdmin;
import com.ali.rental.repositories.AdminRepository;

@Service
public class AdminService {

	@Autowired
	private AdminRepository adminRepo;

	public Admin register(Admin newAdmin, BindingResult result) {

		Optional<Admin> currentAdmin = adminRepo.findByPseudo(newAdmin.getPseudo());

		// Reject if email is taken (present in database)
		if (currentAdmin.isPresent()) {
			result.rejectValue("pseudo", "Matches", "An Admin account with that pseudo already exists!");
		}

		// Reject if password doesn't match confirmation
		if (!newAdmin.getPassword().equals(newAdmin.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}

		// Return null if result has errors
		if (result.hasErrors()) {
			return null;
		}

		// Hash and set password, save user to database
		String hashed = BCrypt.hashpw(newAdmin.getPassword(), BCrypt.gensalt());
		newAdmin.setPassword(hashed);
		return adminRepo.save(newAdmin);

	}

	public Admin login(LoginAdmin newLogin, BindingResult result) {

		Optional<Admin> currentAdmin = adminRepo.findByPseudo(newLogin.getPseudo());

		// Find user in the DB by email
		// Reject if NOT present
		if (!currentAdmin.isPresent()) {
			result.rejectValue("pseudo", "Matches", "Admin not found!");
			return null;
		}

		// User exists, retrieve user from DB
		Admin admin = currentAdmin.get();

		// Reject if BCrypt password match fails
		if (!BCrypt.checkpw(newLogin.getPassword(), admin.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password!");
		}

		// Return null if result has errors
		if (result.hasErrors()) {
			return null;
		}

		// Otherwise, return the user object
		return admin;

	}

}
