package com.ali.rental.repositories;


import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.ali.rental.models.Admin;


public interface AdminRepository extends CrudRepository<Admin, Long>{
	
	Optional<Admin> findByPseudo(String pseudo);
	Admin findByIdIs(Long id);

}
