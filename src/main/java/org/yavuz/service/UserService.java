package org.yavuz.service;

import java.util.List;
import java.util.UUID;

import org.yavuz.domain.User;

import org.yavuz.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	
	
	public User create(User user) {
		user.setId(UUID.randomUUID().toString());
		
		
		
		
		return userRepository.save(user);
	}
	
	public User read(User user) {
		return user;
	}
	
	public List<User> readAll() {
		return userRepository.findAll();
	}
	
	public User update(User user) {
		User existingUser = userRepository.findByUsername(user.getUsername());
		
		if (existingUser == null) {
			return null;
		}
		
		existingUser.setFirstName(user.getFirstName());
		existingUser.setLastName(user.getLastName());
                existingUser.setPhone(user.getPhone());
		
		
		
		return userRepository.save(existingUser);
	}
	
	public Boolean delete(User user) {
		User existingUser = userRepository.findByUsername(user.getUsername());
		
		if (existingUser == null) {
			return false;
		}
		
		
		
		userRepository.delete(existingUser);
		return true;
	}
}
