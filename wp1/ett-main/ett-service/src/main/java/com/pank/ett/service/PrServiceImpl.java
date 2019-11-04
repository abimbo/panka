package com.pank.ett.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pank.ett.persistence.dao.PrDAO;
import com.pank.ett.persistence.model.Pr;



@Service("prService")
public class PrServiceImpl implements PrService, Serializable {	
	Serializable serialVersionUID = 1L;	
	private static Logger logger = Logger.getLogger(PrServiceImpl.class);

	@Autowired
	private PrDAO prDao;

	@Transactional
	public List<Pr> listPr() {
		logger.debug("Listing pr");
		List<Pr> result = new ArrayList<Pr>();
		result = prDao.getList();
		return result;
	}
	
	@Transactional
	public Pr updatePr(Pr getPr){
		Pr pr = prDao.update(getPr);
		return pr;
	}
	
	@Transactional
	public void deletePr(Pr getPr){
		prDao.delete(getPr);
	}
}
