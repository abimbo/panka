package com.pank.ett.persistence.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the pr database table.
 * 
 */
@Entity
@NamedQuery(name="Pr.findAll", query="SELECT p FROM Pr p")
public class Pr implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String data;

	public Pr() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getData() {
		return this.data;
	}

	public void setData(String data) {
		this.data = data;
	}

}