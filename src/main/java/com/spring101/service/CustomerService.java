package com.spring101.service;

import java.util.List;

import com.spring101.model.Customer;

public interface CustomerService {

	public List<Customer> getCustomers();

	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int theId);

	public void deleteCustomer(int theId);
	
	public void updateCustomer(Customer theCustomer);
	
	public Customer findCustomerByName(String name);
}
