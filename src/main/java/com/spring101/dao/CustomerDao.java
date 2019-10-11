package com.spring101.dao;

import java.util.List;

import com.spring101.model.Customer;

public interface CustomerDao {

	public List<Customer> getCustomers();

	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int id);

	public void deleteCustomer(int id);
	
	public void updateCustomer(Customer theCustomer);
	
	public Customer findCustomerByName(String name);
}
