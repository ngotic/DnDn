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
public class MemberTest {

   @Autowired
   private DataSource ds;
   
   @Autowired
   private PasswordEncoder encoder;
   
   
   @Test
   public void testInsertMember() {
      
      String sql = "insert into tblAuthMember(id,name,pw,tel,email,gender,address,regdate,enabled,point) values ('gyeong113','김경민',?,'01083991502','gyeong112@gmail.com','M','서울시 송파구 성내천로21길 12',default,'1',default)";
      
      try {
         
         Connection conn = ds.getConnection();
         PreparedStatement stat = conn.prepareStatement(sql);
         stat.setString(1, encoder.encode("1111"));

         stat.executeUpdate();
     
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
   }
   
}










