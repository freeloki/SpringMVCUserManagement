package org.yavuz.service;

import java.util.UUID;
import org.yavuz.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

/**
 * Service for initializing MongoDB with sample data using {@link MongoTemplate}
 */
public class InitMongoService {
	
	@Autowired
	private MongoTemplate mongoTemplate;

	public void init() {
		
		mongoTemplate.dropCollection("user");

		
		
		User x = new User();
		x.setId(UUID.randomUUID().toString());
                x.setUsername("freeloki");
		x.setFirstName("Yasemin");
		x.setLastName("Senol");
                x.setPhone("(544) 542-9669");
		
		
		User y = new User();
		y.setId(UUID.randomUUID().toString());
                y.setUsername("freestyle");
		y.setFirstName("Yavuz");
		y.setLastName("Erzurumlu");
                y.setPhone("(542) 224-3785");
		
		// Insert to db
		mongoTemplate.insert(x, "user");
		mongoTemplate.insert(y, "user");
		
	}
}
