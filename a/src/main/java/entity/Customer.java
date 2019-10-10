package entity;


import java.io.Serializable;

public class Customer implements Serializable{

	private Integer id;
	private String name;
	private Integer userid;
	private String username;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	private String nexttime;
	private Integer status;
	private Integer custypeid;
	private String custypename;
	
	private String address;
	private Integer level;
	private String contacts;
	private Integer sex;
	private String phone;
	private Integer role;
	private String post;
	private Integer type;
	private Integer free;
	public static String[] sexs= {"男","女"};
	public String getSexname() {
		return sexs[sex];
	}
	public static String[] statustStrings= {"非常不满","不满","一般","有意向","满意","非常满意"};
	public String getStatusname() {
		return statustStrings[status];
	}
	public static String[] roles= {"员工","部门主管","经理","总经理"};
	public String getRolename() {
		return roles[role];
	}
	public static String[] levels= {"一星","二星","三星","四星","五星"};
	public String getLevelname() {
		return levels[level];
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



	public String getNexttime() {
		return nexttime;
	}
	public void setNexttime(String nexttime) {
		this.nexttime = nexttime;
	}
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String Contacts) {
		this.contacts = Contacts;
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

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	public Integer getCustypeid() {
		return custypeid;
	}
	public void setCustypeid(Integer custypeid) {
		this.custypeid = custypeid;
	}
	public String getCustypename() {
		return custypename;
	}
	public void setCustypename(String custypename) {
		this.custypename = custypename;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getFree() {
		return free;
	}
	public void setFree(Integer free) {
		this.free = free;
	}

}
