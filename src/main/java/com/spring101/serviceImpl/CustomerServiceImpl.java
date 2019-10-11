package com.spring101.serviceImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring101.dao.CustomerDao;
import com.spring101.model.Customer;
import com.spring101.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDao userDao;

	@Transactional
	public List<Customer> getCustomers() {
		return userDao.getCustomers();
	}

	@Transactional
	public void saveCustomer(Customer theCustomer) {
		userDao.saveCustomer(theCustomer);
	}

	@Transactional
	public Customer getCustomer(int id) {
		return userDao.getCustomer(id);
	}

	@Transactional
	public void deleteCustomer(int id) {
		userDao.deleteCustomer(id);
	}
	@Transactional
	public void updateCustomer(Customer theCustomer) {
		userDao.updateCustomer(theCustomer);		
	}
	@Transactional
	public Customer findCustomerByName(String name) {
		// TODO Auto-generated method stub
		return userDao.findCustomerByName(name);
	}

}
