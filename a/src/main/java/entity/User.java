package entity;


import java.io.Serializable;

public class User implements Serializable{

	private Integer id;
	private String name;
	private String login;
	private String password;
	private Integer roleid;
	private String rolename;
	private Integer status;
	public static String[] statusStrings={"正常","禁用"};
	public String getStatusname() {
		return statusStrings[status];
	}
	private Integer sex;
	public static String[] sexs= {"男","女"};
	public String getSexname() {
		return sexs[sex];
	}
	private Integer deptid;
	private String deptname;
	private Integer power;
	public static String[] powerStrings={"全部","本部门"};
	public String getPowername() {
		return powerStrings[power];
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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRoleid() {
		return roleid;
	}

	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getDeptid() {
		return deptid;
	}

	public void setDeptid(Integer deptid) {
		this.deptid = deptid;
	}

	public Integer getPower() {
		return power;
	}

	public void setPower(Integer power) {
		this.power = power;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String login, String password) {
		this.login=login;
		this.password=password;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

}

