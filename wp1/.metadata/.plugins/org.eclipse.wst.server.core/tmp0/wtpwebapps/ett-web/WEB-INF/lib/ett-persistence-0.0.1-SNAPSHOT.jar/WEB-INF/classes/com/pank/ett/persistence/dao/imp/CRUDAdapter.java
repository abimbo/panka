package com.pank.ett.persistence.dao.imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.pank.ett.persistence.dao.CRUD;

public abstract class CRUDAdapter<BASETYPE, IDTYPE> implements CRUD<BASETYPE, IDTYPE> {
    @Autowired
    protected SessionFactory sessionFactory;

    public BASETYPE getEntityById(IDTYPE id) {
	Criteria cr = createCriteria();
	cr.add(Restrictions.eq(getIdField(), id));
	return (BASETYPE) cr.uniqueResult();
    }

    public BASETYPE update(BASETYPE data) {
	sessionFactory.getCurrentSession().persist(data);
	return data;
    }

    public BASETYPE create(BASETYPE data) {
	sessionFactory.getCurrentSession().persist(data);
	return data;
    }

    public BASETYPE delete(BASETYPE data) {
	sessionFactory.getCurrentSession().delete(data);
	return null;
    }

    public List<BASETYPE> getList() {
	Criteria cr = createCriteria();
	return cr.list();
    }

    public abstract Criteria createCriteria();

    public abstract String getIdField();
}