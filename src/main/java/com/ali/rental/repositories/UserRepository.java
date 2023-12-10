package com.ali.rental.repositories;

import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.ali.rental.models.User;



@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	
	Optional <User> findByEmail(String email);
	User findByIdIs(Long id);
	List<User> findAll();
	

}
