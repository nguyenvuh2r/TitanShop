package com.example.demo.serviceimpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.CustomerContactDao;
import com.example.demo.model.CustomerContact;
import com.example.demo.service.CustomerContactService;

import net.bytebuddy.asm.Advice.OffsetMapping.Sort;

@Service

public class CustomerContactServiceImpl implements CustomerContactService {

	private static final int PAGE_ELEMENT_SIZE=10;
	
	@Autowired
	private CustomerContactDao customerContactDao;
	@Transactional()
	@Override
	public void addNewMessage(CustomerContact customerContact) {
		
		customerContactDao.save(customerContact);
		
	}
	@Transactional()
	@Override
	public void deleteMessageById(long customerContactId) {
		
		customerContactDao.getOne(customerContactId);
	}
	@Transactional(readOnly = true)
	@Override
	public List<CustomerContact> getAllCustomerContact() {
		
		return (List<CustomerContact>) customerContactDao.findAll();
	}
	@Transactional(readOnly = true)
	@Override
	public Page<CustomerContact> getAllCustomerMessage(Integer pageNumber) {	
		PageRequest pageRequest= PageRequest.of(pageNumber-1, PAGE_ELEMENT_SIZE);
		return customerContactDao.findAll(pageRequest);
	}

	

	



}
