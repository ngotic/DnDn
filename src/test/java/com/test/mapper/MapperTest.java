package com.test.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.dndn.auth.domain.MemberDTO;
import com.project.dndn.auth.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MapperTest {
	
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void read() {
		
		MemberDTO dto = mapper.read("dog");	
		log.info(dto);
	}
	
	
	
	
}
