package com.spring101.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring101.model.Customer;
import com.spring101.service.CustomerService;

@Controller
public class LoginController {
	
	private static final Logger logger = Logger.getLogger(LoginController.class);

	 @Autowired
	    private CustomerService customerService;
	 
	 @GetMapping("/login")
	    public String login(Model theModel) {
		 Customer theCustomer = new Customer();
	     theModel.addAttribute("customer", theCustomer);
	     logger.info(theCustomer);
	        return "login";
	    }
	 
	 @PostMapping("/loginProcess")
	 public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("customer") Customer theCustomer) {
		 Customer customer =  customerService.findCustomerByName(theCustomer.getFirstname());
		 ModelAndView mav = null;
		 
		 if (customer.getFirstname() != null) {
			    mav = new ModelAndView("redirect:/customer/list");
			    } else {
			    mav = new ModelAndView("login");
			    mav.addObject("message", "Username or Password is wrong!!");
			    }
			    return mav;
	    }
	 
	 @RequestMapping(value = {"/","/home"})
	    public String home(Model theModel) {
	       
	        return "home";
	    }
}
