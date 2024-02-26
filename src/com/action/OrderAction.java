package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Kcrecord;
import com.model.Order;
import com.model.Product;
import com.model.Sales;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;

public class OrderAction extends ActionSupport
{
	private Integer id;
	private String orderid;
	private String proinfo;
	private String memberid;
	private String price;
	private String savetime;
	private String fkstatus;
	private String carids;
	private String fhstatus;
	private String shstatus;
	private String tel;
	private String addr;
	private String type;
	private String isgq;
	private String oldpid;
	private String newpid;
	private String pnum;
	String suc1;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	public String getOldpid() {
		return oldpid;
	}
	public void setOldpid(String oldpid) {
		this.oldpid = oldpid;
	}
	public String getNewpid() {
		return newpid;
	}
	public void setNewpid(String newpid) {
		this.newpid = newpid;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getIsgq() {
		return isgq;
	}
	public void setIsgq(String isgq) {
		this.isgq = isgq;
	}
	public String getShstatus() {
		return shstatus;
	}
	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFhstatus() {
		return fhstatus;
	}
	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCarids() {
		return carids;
	}
	public void setCarids(String carids) {
		this.carids = carids;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getProinfo() {
		return proinfo;
	}
	public void setProinfo(String proinfo) {
		this.proinfo = proinfo;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getFkstatus() {
		return fkstatus;
	}
	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
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
	
	//新增订单
	public String orderAdd()
	{
			Order order=new Order();
			order.setOrderid(Info.getAutoId());
			order.setMemberid(memberid);
			order.setPrice(price);
			order.setFkstatus("未付款");
			order.setProinfo(proinfo);
			order.setSavetime(Info.getDateStr());
			order.setFhstatus("未发货");
			order.setShstatus("未确认");
			order.setTel(tel);
			order.setAddr(addr);
			order.setType("0"); //0：订单 1：退货
			order.setIsgq("no");//yes :改签订单  no :非改签订单
			commonDAO.save(order);
			commonDAO.delete(carids, "Car");
			suc="";
			return "success";
	}
	
	//删除订单
	public String orderDel(){
		commonDAO.delete(id, "Order");
		suc="";
		return "success";
	}
	//管理员删除订单
	public String adminDelOrder(){
		commonDAO.delete(id, "Order");
		suc="";
		return "success";
	}
	//会员付款
	public String orderFk(){
		Order o = (Order)commonDAO.findById(id, "Order");
		String is = "yes";
		String b[] = o.getProinfo().split(",");
		Kcrecord kc = new Kcrecord();
		kc.setProductid(b[0]);         //车票ID
		kc.setNum(b[1]);				//数量
		ArrayList<Kcrecord> inlist = (ArrayList<Kcrecord>)commonDAO.findByHql("  from Kcrecord where productid='"+b[0]+"' and type='in' ");
		ArrayList<Kcrecord> outlist = (ArrayList<Kcrecord>)commonDAO.findByHql("  from Kcrecord where productid='"+b[0]+"' and type='out' ");
		int k=0;
		if(inlist.size()!=0){
		int innum = 0;
		int outnum = 0;
		for(Kcrecord in:inlist){
			innum+=Integer.parseInt(in.getNum());
		}
		for(Kcrecord kout:outlist){
			outnum+=Integer.parseInt(kout.getNum());
		}
		k = innum-outnum;
		}else{
			k = 0;
		}
		System.out.println("kkkkkkkkk=="+k);
		System.out.println("Integer.parseInt(b[1]=="+b[1]);
		if(Integer.parseInt(b[1])<=k){
			System.out.println("yyyyyyyyyy");
			kc.setType("out");
			kc.setSavetime(Info.getDateStr());
			commonDAO.save(kc);
			Sales sales = new Sales();
			sales.setProductid(b[0].toString());  //车票ID
			sales.setNum(b[1].toString());  //数量
			sales.setSavetime(Info.getDateStr()); 
			commonDAO.save(sales);
		}else{
			System.out.println("wwwwwwwwwwwwww");
			is = "no";
		}
		
		if(is != "no"){
			o.setFhstatus("已发货");
			o.setFkstatus("已付款");
			commonDAO.update(o);
			suc="";
			return "success";
		}else{
			no="";
			return "erro";
		}
	}
	//货到付款
	public String orderHdFk(){
		Order o = (Order)commonDAO.findById(id, "Order");
		String is = "yes";
		String b[] = o.getProinfo().split(",");
		Kcrecord kc = new Kcrecord();
		kc.setProductid(b[0]);         //车票ID
		kc.setNum(b[1]);				//数量
		ArrayList<Kcrecord> inlist = (ArrayList<Kcrecord>)commonDAO.findByHql("  from Kcrecord where productid='"+b[0]+"' and type='in' ");
		ArrayList<Kcrecord> outlist = (ArrayList<Kcrecord>)commonDAO.findByHql("  from Kcrecord where productid='"+b[0]+"' and type='out' ");
		int k=0;
		if(inlist.size()!=0){
		int innum = 0;
		int outnum = 0;
		for(Kcrecord in:inlist){
			innum+=Integer.parseInt(in.getNum());
		}
		for(Kcrecord kout:outlist){
			outnum+=Integer.parseInt(kout.getNum());
		}
		k = innum-outnum;
		}else{
			k = 0;
		}
		
		if(Integer.parseInt(b[1])<k){
			kc.setType("out");
			kc.setSavetime(Info.getDateStr());
			commonDAO.update(kc);
			Sales sales = new Sales();
			sales.setProductid(b[0].toString());  //车票ID
			sales.setNum(b[1].toString());  //数量
			sales.setSavetime(Info.getDateStr()); 
			commonDAO.save(sales);
		}else{
			is = "no";
		}
		
		if(is != "no"){
			o.setFhstatus("已发货");
			commonDAO.update(o);
			suc="";
			return "success";
		}else{
			no="";
			return "erro";
		}
		//o = (Order)commonDAO.findById(id, "Order");
		//o.setFkstatus("货到付款");
		//commonDAO.update(o);
		//suc="";
		//return "success";
	}
	//管理员发货
	public String orderFh(){
		Order o = new Order();
		o = (Order)commonDAO.findById(id, "Order");
		String pinfo = o.getProinfo();
		String a[] = pinfo.split("-");
		String is = "yes";
		for(int i=0;i<a.length;i++){
			String b[] = a[i].split(",");
			Kcrecord kc = new Kcrecord();
			kc.setProductid(b[0]);         //车票ID
			kc.setNum(b[1]);				//数量
			ArrayList<Kcrecord> inlist = (ArrayList<Kcrecord>)commonDAO.findByHql("  from Kcrecord where productid='"+b[0]+"' and type='in' ");
			ArrayList<Kcrecord> outlist = (ArrayList<Kcrecord>)commonDAO.findByHql("  from Kcrecord where productid='"+b[0]+"' and type='out' ");
			int k=0;
			if(inlist.size()!=0){
			int innum = 0;
			int outnum = 0;
			for(Kcrecord in:inlist){
				innum+=Integer.parseInt(in.getNum());
			}
			for(Kcrecord kout:outlist){
				outnum+=Integer.parseInt(kout.getNum());
			}
			k = innum-outnum;
			}else{
				k = 0;
			}
			
			if(Integer.parseInt(b[1])<k){
				kc.setType("out");
				kc.setSavetime(Info.getDateStr());
				commonDAO.update(kc);
				Sales sales = new Sales();
				sales.setProductid(b[0].toString());  //车票ID
				sales.setNum(b[1].toString());  //数量
				sales.setSavetime(Info.getDateStr()); 
				commonDAO.save(sales);
			}else{
				is = "no";
			}
		}
		System.out.println("aaaaa=="+is);
		if(is != "no"){
			o.setFhstatus("已发货");
			commonDAO.update(o);
			suc="";
			return "success";
		}else{
			no="";
			return "erro";
		}
		
	}
	//会员订单退票
	public String orderTh(){
		Order o = new Order();
		o = (Order)commonDAO.findById(id, "Order");
		String pinfo = o.getProinfo();
		//返库
			String b[] = pinfo.split(",");
			Kcrecord kc = new Kcrecord();
			kc.setProductid(b[0]);
			kc.setNum(b[1]);
			kc.setType("in");
			kc.setSavetime(Info.getDateStr());
			commonDAO.update(kc);
		//变更退票状态
			o.setType("1");
		o.setFhstatus("退票成功");
		//这里加退票返金额至会员帐户
		
		
		Sysuser sysuser  = (Sysuser)commonDAO.findById(o.getMemberid(), "Sysuser");
		String fh = o.getPrice();//返还金额
		
		sysuser.setMoney(String.valueOf(Double.valueOf(sysuser.getMoney())+Double.valueOf(fh)-Double.valueOf(fh)*0.05)); 
		commonDAO.update(sysuser);
		commonDAO.update(o);
		suc="";
		return "success";
	}
	
	//会员取消订单退货
	public String orderThQx(){
		Order o = (Order)commonDAO.findById(id, "Order");
		o.setFhstatus("已发货");
		o.setType("0");
		commonDAO.update(o);
		suc="";
		return "success";
	}
	//管理员同意退货
	public String adminOrderTh(){
		Order o = new Order();
		o = (Order)commonDAO.findById(id, "Order");
		String pinfo = o.getProinfo();
		String a[] = pinfo.split("-");
		for(int i=0;i<a.length;i++){
			String b[] = a[i].split(",");
			Kcrecord kc = new Kcrecord();
			kc.setProductid(b[0]);
			kc.setNum(b[1]);
			kc.setType("in");
			kc.setSavetime(Info.getDateStr());
			commonDAO.update(kc);
		}
		o.setFhstatus("退货成功");
		commonDAO.update(o);
		suc="";
		return "success";
	}
	//会员确认收货
	public String orderSh(){
		Order o = (Order)commonDAO.findById(id, "Order");
		o.setShstatus("已确认");
		commonDAO.update(o);
		suc="";
		return "success";
	}
	//改签
	public String orderGq(){
		String is = "yes";
		Order o = (Order)commonDAO.findById(id, "Order");
		String pinfo[] = o.getProinfo().split(",");
		String oldpid = pinfo[0];
		String oldnum = pinfo[1];
		String newnum = oldnum;
		o.setProinfo(newpid+","+newnum);
		o.setIsgq("yes");
		//检查目标车票库存
		Kcrecord kc = new Kcrecord();
		kc.setProductid(newpid);         //车票ID
		kc.setNum(newnum);				//数量
		ArrayList<Kcrecord> inlist = (ArrayList<Kcrecord>)commonDAO.findByHql("  from Kcrecord where productid='"+newpid+"' and type='in' ");
		ArrayList<Kcrecord> outlist = (ArrayList<Kcrecord>)commonDAO.findByHql("  from Kcrecord where productid='"+newpid+"' and type='out' ");
		int k=0;//总库存
		if(inlist.size()!=0){
		int innum = 0;
		int outnum = 0;
		for(Kcrecord in:inlist){
			innum+=Integer.parseInt(in.getNum());
		}
		for(Kcrecord kout:outlist){
			outnum+=Integer.parseInt(kout.getNum());
		}
		k = innum-outnum;
		}else{
			k = 0;
		}
		//如果目标车票数量小于总库存则可以改签
		if(Integer.parseInt(newnum)<=k){
			//目标车票出库
			kc.setType("out");
			kc.setSavetime(Info.getDateStr());
			
			//Sales sales = new Sales();
			//sales.setProductid(newpid);  //车票ID
			//sales.setNum(newnum);  //数量
			//sales.setSavetime(Info.getDateStr());
			Kcrecord oldProductkc = new Kcrecord();
			//旧车票入库
			oldProductkc.setProductid(oldpid);
			oldProductkc.setNum(oldnum);
			oldProductkc.setType("in");
			oldProductkc.setSavetime(Info.getDateStr());
			commonDAO.save(oldProductkc);
			commonDAO.save(kc);
			//commonDAO.save(sales);
			commonDAO.update(o);
		}else{
			System.out.println("wwwwwwwwwwwwww");
			is = "no";
		}
		if(is != "no"){
			suc1="";
			return "success";
		}else{
			no="";
			return "erro";
		}
	}
}
