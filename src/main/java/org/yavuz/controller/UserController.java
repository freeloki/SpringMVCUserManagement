package org.yavuz.controller;


import org.yavuz.domain.User;
import org.yavuz.dto.UserListDto;
import org.yavuz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping
	public String getUsersPage() {
		return "users";
	}
	
	@RequestMapping(value="/records")
	public @ResponseBody UserListDto getUsers() {
		
		UserListDto userListDto = new UserListDto();
		userListDto.setUsers(service.readAll());
		return userListDto;
	}
	
	@RequestMapping(value="/get")
	public @ResponseBody User get(@RequestBody User user) {
		return service.read(user);
	}

	@RequestMapping(value="/create", method=RequestMethod.POST)
	public @ResponseBody User create(
                        @RequestParam String username,
			@RequestParam String firstName,
			@RequestParam String lastName,
                        @RequestParam String phone
        ){

		
		User newUser = new User();
		newUser.setUsername(username);
		newUser.setFirstName(firstName);
		newUser.setLastName(lastName);
                newUser.setPhone(phone);
		
		
		return service.create(newUser);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody User update(
			@RequestParam String username,
			@RequestParam String firstName,
			@RequestParam String lastName,
                        @RequestParam String phone
        ) {

		
		User existingUser = new User();
		existingUser.setUsername(username);
		existingUser.setFirstName(firstName);
		existingUser.setLastName(lastName);
                existingUser.setPhone(phone);
		
		
		return service.update(existingUser);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody Boolean delete(
			@RequestParam String username) {

		User existingUser = new User();
		existingUser.setUsername(username);
		
		return service.delete(existingUser);
	}
}
