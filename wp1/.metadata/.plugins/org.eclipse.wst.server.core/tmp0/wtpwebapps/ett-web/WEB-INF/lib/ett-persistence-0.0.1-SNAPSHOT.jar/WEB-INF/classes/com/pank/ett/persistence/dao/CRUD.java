package com.pank.ett.persistence.dao;

import org.hibernate.Criteria;

public interface CRUD<BASETYPE, IDTYPE> {
	public BASETYPE getEntityById(IDTYPE id);
	public BASETYPE update(BASETYPE data);
	public BASETYPE create(BASETYPE data);
	public BASETYPE delete(BASETYPE data);
}
