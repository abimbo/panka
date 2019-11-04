package com.pank.ett.persistence.dao.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.pank.ett.persistence.dao.PrDAO;
import com.pank.ett.persistence.model.Pr;

@Repository("prDao")
public class PrDaoImpl extends CRUDAdapter<Pr, Integer> implements PrDAO{

    private static final String FIELD_ID = "id";

    @Override
    public Criteria createCriteria() {
	return sessionFactory.getCurrentSession().createCriteria(Pr.class);
    }

    @Override
    public String getIdField() {
	return FIELD_ID;
    }
    
    @Override
    public List<Pr> getList() {
	Query resultQuery = sessionFactory.getCurrentSession().getNamedQuery("Pr.findAll");
	return (List<Pr>) resultQuery.list();
    }
	
}
