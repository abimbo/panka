package com.pank.ett.persistence.dao;

import java.util.List;

public interface Listable<BASETYPE> {
	public List<BASETYPE> getList();
}
