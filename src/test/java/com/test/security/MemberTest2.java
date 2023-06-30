package com.test.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTest2 {

   @Autowired
   private DataSource ds;
   
   @Autowired
   private PasswordEncoder encoder;
   
   @Test
   public void testInsertMember() {
      
      String sql = "insert into tblAuthAuth(id, auth) values (?, ?)";
      
      try {
         
         Connection conn = ds.getConnection();
         PreparedStatement stat = conn.prepareStatement(sql);
         
         stat.setString(1, "gyeong113");
         stat.setString(2, "ROLE_MEMBER");
         
         stat.executeUpdate();

         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
   
}










