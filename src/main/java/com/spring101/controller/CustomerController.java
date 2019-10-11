package com.spring101.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring101.model.Customer;
import com.spring101.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		List<Customer> theCustomers = customerService.getCustomers();
		theModel.addAttribute("customers", theCustomers);
		return "list-customers";
	}

	@GetMapping("/showForm")
	public String showFormForAdd(Model theModel) {
		Customer theCustomer = new Customer();
		theModel.addAttribute("customer", theCustomer);
		return "customer-form";
	}

	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
		customerService.saveCustomer(theCustomer);
		return "redirect:/customer/list";
	}

	@PostMapping("/updateCustomer")
	public String updateCustomer(@RequestParam("customerId") int id, @ModelAttribute("customer") Customer theCustomer) {
		theCustomer.setId(id);
		customerService.updateCustomer(theCustomer);
		return "redirect:/customer/list";
	}

	@GetMapping("/updateForm")
	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {
		Customer theCustomer = customerService.getCustomer(theId);
		theModel.addAttribute("customer", theCustomer);
		return "customer-form";
	}

	@GetMapping("/delete")
	public String deleteCustomer(int theId) {
		customerService.deleteCustomer(theId);
		return "redirect:/customer/list";
	}

	@GetMapping(value = "/checkName")
	@ResponseBody
	public boolean checkName(String name) {
		System.out.println(name);
		Customer theCustomer = customerService.findCustomerByName(name);
		if (theCustomer.getFirstname() != null) {
			return true;
		} else {
			return false;
		}
	}
}
