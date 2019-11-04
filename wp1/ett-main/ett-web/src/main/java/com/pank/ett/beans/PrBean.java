package com.pank.ett.beans;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.bean.ViewScoped;

import org.apache.log4j.Logger;

import com.pank.ett.persistence.model.Pr;
import com.pank.ett.service.PrService;


@ManagedBean(name = "prBean")
@SessionScoped
public class PrBean implements Serializable {
	Serializable serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(PrBean.class);
	
	private List<Pr> prList;

	@ManagedProperty("#{prService}")
    private PrService prService;
	
	@PostConstruct
	public void init(){
		prList = prService.listPr();
	}

	public List<Pr> getPrList() {
		return prList;
	}

	public void setPrList(List<Pr> prList) {
		this.prList = prList;
	}

	public PrService getPrService() {
		return prService;
	}

	public void setPrService(PrService prService) {
		this.prService = prService;
	}

}
