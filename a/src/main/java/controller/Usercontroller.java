package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Dept;
import entity.Role;
import entity.User;
import service.DeptService;
import service.RoleService;
import service.UserService;
import utils.ReturnInfo;

@Controller
@RequestMapping("User")
public class Usercontroller  {
	@Autowired
	UserService service;
	@Autowired
	RoleService rservice;
	@Autowired
	DeptService dservice;
	@RequestMapping("login")
	public String login(User u, String code, ModelMap m, HttpSession s) {

		try {
			SecurityUtils.getSubject().getSession().setTimeout(1000000);
			SecurityUtils.getSubject().login(new UsernamePasswordToken(u.getLogin(),u.getPassword()));
			
		}catch(AccountException e) {
			return "redirect:/login.html";
		}
		User curr=(User) SecurityUtils.getSubject().getSession().getAttribute("user");
		if(curr.getStatus()==0) {
			return "redirect:/index.jsp";
		}else {
			return "redirect:/login.html";
		}
	}

	@RequestMapping("outlogin")
	public String login(HttpSession s, HttpServletRequest req) {
		SecurityUtils.getSubject().logout();
		return "redirect:/login.html";
	}
	
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where user.name like '%" + txt + "%'";
		}
		return service.getWhere(where, page, limit);
	}

	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}
	@RequestMapping("stop")
	public @ResponseBody String stop(User t) {
		t.setStatus(1);
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("restart")
	public @ResponseBody String res(User t) {
		t.setStatus(0);
		service.update(t);
		return "{\"status\":1}";
	}

	@RequestMapping("edit")
	public @ResponseBody User edit(Integer id) {
		return service.getByid(id);
	}

	@RequestMapping("insert")
	public @ResponseBody String insert(User t) {
		service.insert(t);
		return "{\"status\":1}";
	}

	@RequestMapping("update")
	public @ResponseBody String update(User t) {
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("getRoleid")
	public @ResponseBody List<Role> getRolename(){
		return rservice.getAll();
	}
	@RequestMapping("getDeptid")
	public @ResponseBody List<Dept> getDeptname(){
		return dservice.getAll();
	}
	@RequestMapping("getSexs")
	public @ResponseBody String[] getSexs() {
		return User.sexs;
	}
	@RequestMapping("getStatus")
	public @ResponseBody String[] getStatusname() {
		return User.statusStrings;
	}
}
