package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.CustomerContact;

@Repository
public interface CustomerContactDao extends JpaRepository<CustomerContact, Long>,PagingAndSortingRepository<CustomerContact, Long>{

}
