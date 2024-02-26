package com.model;

/**
 * Protype entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Protype implements java.io.Serializable {

	// Fields

	private Integer id;
	private String typename;
	private String delstatus;
	private String fatherid;

	// Constructors

	/** default constructor */
	public Protype() {
	}

	/** full constructor */
	public Protype(String typename, String delstatus, String fatherid) {
		this.typename = typename;
		this.delstatus = delstatus;
		this.fatherid = fatherid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypename() {
		return this.typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getFatherid() {
		return this.fatherid;
	}

	public void setFatherid(String fatherid) {
		this.fatherid = fatherid;
	}

}