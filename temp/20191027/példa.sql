
81408871

81408818

ActivityDAO.java
package com.kuz.nfp.persistence.dao;

import com.kuz.nfp.persistence.entities.CtActivity;

public interface ActivityDAO extends CRUD<CtActivity, Integer>, Listable<CtActivity> {

}

ActivityDaoImpl.java
package com.kuz.nfp.persistence.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.kuz.nfp.persistence.dao.ActivityDAO;
import com.kuz.nfp.persistence.entities.CtActivity;

@Repository("activityDao")
public class ActivityDaoImpl extends CRUDAdapter<CtActivity, Integer> implements ActivityDAO {

    private static final String FIELD_ID = "id";

    @Override
    public Criteria createCriteria() {
	return sessionFactory.getCurrentSession().createCriteria(CtActivity.class);
    }

    @Override
    public String getIdField() {
	return FIELD_ID;
    }
    
    @Override
    public CtActivity getEntityById(Integer id) {
	Criteria criteria = sessionFactory.getCurrentSession().createCriteria(CtActivity.class);
	criteria.add(Restrictions.eq(FIELD_ID, id));
	return (CtActivity) criteria.uniqueResult();
    }

    @Override
    public CtActivity update(CtActivity data) {
	sessionFactory.getCurrentSession().persist(data);
	return data;
    }

    @Override
    public CtActivity create(CtActivity data) {
	sessionFactory.getCurrentSession().persist(data);
	return data;
    }

    @Override
    public CtActivity delete(CtActivity data) {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public List<CtActivity> getList() {
	Query resultQuery = sessionFactory.getCurrentSession().getNamedQuery("CtActivity.findAll");
	return (List<CtActivity>) resultQuery.list();
    }

}

CRUDApter.java
package com.kuz.nfp.persistence.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.kuz.nfp.persistence.dao.CRUD;

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


ActivityService.java
package com.kuz.nfp.services.activity.service;

import java.util.List;

import com.kuz.nfp.services.activity.model.ActivityModel;

public interface ActivityService {
	
	public List<ActivityModel> listActivityModels();
	
	public ActivityModel createActivityModel(ActivityModel source);
	
	public ActivityModel updateActivityModel(ActivityModel source);

}



ActivityServiceImpl.java
package com.kuz.nfp.services.activity.service;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kuz.nfp.persistence.dao.ActivityDAO;
import com.kuz.nfp.persistence.entities.CtActivity;
import com.kuz.nfp.services.activity.converter.ActivityToActivityModelConverter;
import com.kuz.nfp.services.activity.model.ActivityModel;

@Service("activityService")
public class ActivityServiceImpl implements ActivityService{
	private static Logger logger = Logger.getLogger(ActivityServiceImpl.class);
	
	@Autowired
	private ActivityDAO activityDao;
	@Autowired
	private ActivityToActivityModelConverter activityConverter;

	@Transactional
	public List<ActivityModel> listActivityModels() {
		logger.debug("Listing activity");
		List<CtActivity> actitivities = activityDao.getList();
		List<ActivityModel> result = new ArrayList<ActivityModel>();
		if (actitivities != null) {
		    for (CtActivity item : actitivities) {
			result.add(activityConverter.convert(item));
		    }
		}
		return result;
	}

	@Transactional
	public ActivityModel createActivityModel(ActivityModel source) {
		logger.debug("Attempting to persist new activity");
		logger.debug(MessageFormat.format("Activity data: {0}", source));
		CtActivity activity = populateActivity(source, null);
		activity = activityDao.create(activity);
		return activityConverter.convert(activity);
	}

	@Transactional
	public ActivityModel updateActivityModel(ActivityModel source) {
		logger.debug("Attempting to update existing activity");
		logger.debug(MessageFormat.format("Activity data: {0}", source));
		CtActivity act = activityDao.getEntityById(source.getId());
		CtActivity activity = populateActivity(source, act);
		if (activity != null) {
		    activity = activityDao.update(activity);
		}
		return activityConverter.convert(activity);
	}

   private CtActivity populateActivity(ActivityModel model,CtActivity activity) {
		if (model == null) {
		    return null;
		}
		CtActivity result = activity;
		if (result == null) {
		    result = new CtActivity();
		}
		result.setId(model.getId());
		result.setActivityName(model.getActivityName());
		return result;
   } 	
}


