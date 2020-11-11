package com.example.demo.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.AuthoritiesDao;
import com.example.demo.model.Authorities;
import com.example.demo.service.AuthoritiesService;

@Service

public class AuthoritiesServiceImpl implements AuthoritiesService{

	@Autowired
	private AuthoritiesDao authoritiesDao;
	
	@Transactional()
	@Override
	public void addAuthorities(Authorities authorities) {
		
		authoritiesDao.save(authorities);
	}
	@Transactional(readOnly = true)
	@Override
	public Authorities findAuthoritiesByusername(String username) {
		
		return authoritiesDao.findAuthoritiesByusername(username);
	}

}
