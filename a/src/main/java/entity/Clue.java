package entity;

import java.io.Serializable;

public class Clue implements Serializable{

	
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer source;
	public static String[] sources= {"一级","二级","三级","四级","五级","六级"};
	public String getSourcename() {
		return sources[source];
	}
	private String name;
	private String company;
	private String post;
	private Integer sex;
	public static String[] sexs= {"男","女"};
	public String getSexname() {
		return sexs[sex];
	}
	private String phone;
	private String remarks;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSource() {
		return source;
	}

	public void setSource(Integer source) {
		this.source = source;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}

