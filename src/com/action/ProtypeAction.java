package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Product;
import com.model.Protype;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class ProtypeAction extends ActionSupport
{
	private Integer id;
	private String typename;
	private String delstatus;
	private String fatherid;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	public String getFatherid() {
		return fatherid;
	}
	public void setFatherid(String fatherid) {
		this.fatherid = fatherid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getSuc() {
		return suc;
	}
	public void setSuc(String suc) {
		this.suc = suc;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public CommonDAO getCommonDAO() {
		return commonDAO;
	}
	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	
	//新增线路
	public String typeAdd()
	{
			Protype protype=new Protype();
			protype.setTypename(typename);
			protype.setFatherid(fatherid);
			protype.setDelstatus("0"); //0：正常；1:删除
			commonDAO.save(protype);
			suc="";
			return "success";
	}
	//编辑线路
	public String typeEdit(){
		Protype protype = (Protype)commonDAO.findById(id, "Protype");
		protype.setTypename(typename);
		commonDAO.update(protype);
		suc="";
		return "success";
	}
	
	//删除线路
	public String typeDel(){
		List<Product> productlist = commonDAO.findByHql(" from Product where protype='"+id+"'");
		if(productlist.size()==0){
			Protype protype = (Protype)commonDAO.findById(id, "Protype");
			protype.setDelstatus("1");
			commonDAO.update(protype);
			suc="";
			return "success";
		}else{
			no = "";
			return "erro";
		}
		
		
	}
}
