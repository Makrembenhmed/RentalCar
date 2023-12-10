package com.ali.rental.models;


import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class LoginAdmin {
	
	
	@NotEmpty(message="Pseudo is required!")
    
    private String pseudo;
	
	
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    public LoginAdmin() {}

	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPseudo() {
	return pseudo;
	}

	public void setPseudo(String pseudo) {
	this.pseudo = pseudo;
	}
	
	

}
