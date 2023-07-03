package com.project.dndn.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.dndn.auth.domain.CustomUser;
import com.project.dndn.auth.domain.MemberDTO;
import com.project.dndn.auth.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		log.info("load User by UserName:"+id);
		MemberDTO dto = mapper.read(id);
		
		log.info("Queried by member: " + dto);
		return dto !=null ? new CustomUser(dto) : null;
	}

}