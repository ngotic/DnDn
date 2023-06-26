package com.project.persistence;

import static org.junit.Assert.assertNotNull;

import java.io.FileReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {
	@Test
	public void testJDBC() {
		try {
			
			System.out.println("111");
			//src/main/resources/
			//classpath*:/
			String resource = "src/main/resources/config/jdbc.properties";
	        Properties properties = new Properties();
	        FileReader resources= new FileReader(resource);
            properties.load(resources);
            System.out.println(properties.getProperty("jdbc.driverClassName"));
            System.out.println(properties.getProperty("jdbc.url"));
            System.out.println(properties.getProperty("jdbc.username"));
            System.out.println(properties.getProperty("jdbc.password"));
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(properties.getProperty("url"), properties.getProperty("username"), properties.getProperty("password"));	
            assertNotNull(conn); log.info(conn.isClosed());
			 
            
		}catch(Exception e) {
			
		}
	}
	
}
