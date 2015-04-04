package org.yavuz.repository;

import org.yavuz.domain.User;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<User, String> {
	
	User findByUsername(String username);
}
