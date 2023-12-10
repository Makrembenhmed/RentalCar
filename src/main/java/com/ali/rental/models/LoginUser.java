package com.ali.rental.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class LoginUser {
	
	
	@NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
	
	//@NotEmpty(message="First Name is required!")
    //@Size(min=3, max=30, message="First Name must be between 3 and 30 characters")
    //private String pseudo;
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    public LoginUser() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	//public String getPseudo() {
		//return pseudo;
	//}

	//public void setPseudo(String pseudo) {
		//this.pseudo = pseudo;
	//}
	
	

}
