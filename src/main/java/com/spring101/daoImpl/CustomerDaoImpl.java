package com.spring101.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring101.dao.CustomerDao;
import com.spring101.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Customer> getCustomers() {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Customer> cq = cb.createQuery(Customer.class);
		Root<Customer> root = cq.from(Customer.class);
		cq.select(root);
		Query query = session.createQuery(cq);
		
		List<Customer> list = new ArrayList<Customer>();
		list.addAll(query.getResultList());
		
		return list;
	}

	public void saveCustomer(Customer theCustomer) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(theCustomer);

	}

	public Customer getCustomer(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Customer theCustomer = currentSession.get(Customer.class, id);
		return theCustomer;
	}

	public void deleteCustomer(int id) {
		Session session = sessionFactory.getCurrentSession();
		Customer customer = session.byId(Customer.class).load(id);
		session.delete(customer);

	}

	public void updateCustomer(Customer theCustomer) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(theCustomer);		
	}

	public Customer findCustomerByName(String name) {
		Session currentSession = sessionFactory.getCurrentSession();
		String hql = "from Customer c where c.firstname = '" + name + "'";
		List result = currentSession.createQuery(hql).list();	
		Customer theCustomer = new Customer();
		if(result.size() > 0) {
			theCustomer = (Customer) result.get(0);
		}
		return theCustomer;
		
	}

}
