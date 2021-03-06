package entity;

import java.io.Serializable;

public class Contract implements Serializable{

	private Integer id;
	private String name;
	private Integer userid;
	private String username;
	private String approvalname;
	private Integer customerid;
	private String customername;
	private double amount;
	private String signtime;
	private String begintime;
	private String endtime;
	private Integer goodsid;
	private String goodsname;
	private Integer uploadstatus=0;//0δ�ϴ���1�ɹ���2ʧ��
	
	
	public Integer getUploadstatus() {
		return uploadstatus;
	}

	public void setUploadstatus(Integer uploadstatus) {
		this.uploadstatus = uploadstatus;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getApprovalname() {
		return approvalname;
	}

	public void setApprovalname(String approvalname) {
		this.approvalname = approvalname;
	}

	public Integer getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getSigntime() {
		return signtime;
	}

	public void setSigntime(String signtime) {
		this.signtime = signtime;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public Integer getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

}

