/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.yavuz.test;

import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import java.util.UUID;
import junit.framework.Assert;
import org.yavuz.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.yavuz.repository.UserRepository;
import org.yavuz.service.UserService;
/**
 *
 * @author HakkiYavuz
 */
public class jUnitCRUDTest {
    
    @Autowired 
    private MongoTemplate mongoTemplate;
    @Autowired
	private UserService service;
    @Autowired
	private UserRepository userRepository;
    
    private User xUser;
    
    public jUnitCRUDTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void CreateAndReadTest() throws Exception {
        
        
        
        try {
          //  mongoTemplate.dropCollection("user");

		
		
		User x = new User();
		x.setId(UUID.randomUUID().toString());
                x.setUsername("deneme");
		x.setFirstName("mehmet");
		x.setLastName("ali");
                x.setPhone("(333) 444-1233");
                
                xUser=x;
              mongoTemplate.insert(x,"user");
               mongoTemplate.insert(xUser,"user");
              User test=new User();
              
              test=service.read(x);
              
              Assert.assertEquals("deneme", test.getUsername());
               Assert.assertEquals("mehmet", test.getFirstName());
                Assert.assertEquals("ali", test.getLastName());
                 Assert.assertEquals("(333) 444-1233", test.getPhone());
             
                 
               test.setUsername("test");
               test.setFirstName("firstname");
               test.setLastName("lastname");
               test.setPhone("(111) 444-1111");
                 
                
                 
                
            
            
        } catch (Exception e){
            
            
        }
      
    }
    
    
    @Test
    public void UpdateAndDeleteTest() throws Exception
    {
        try {
            
             User existingUser=new User();
      List<User> x=userRepository.findAll();
      
            
      existingUser=x.get(0);
		
		if (existingUser == null) {
			throw new NullPointerException("Hata!");
		}
		
		existingUser.setFirstName("semih");
		existingUser.setLastName("dursun");
                existingUser.setPhone("(111) 444-1111");
                
             
        
        service.update(existingUser);
        
        User test = new User();
        
        test = service.read(existingUser);
        
           Assert.assertEquals("freeloki", test.getUsername());
               Assert.assertEquals("semih", test.getFirstName());
                Assert.assertEquals("dursun", test.getLastName());
                 Assert.assertEquals("(111) 444-1111", test.getPhone());
            
        } catch (Exception e) {
        }
     
        }
    }
    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}

