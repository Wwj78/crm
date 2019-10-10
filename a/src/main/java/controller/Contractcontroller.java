package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Customer;
import entity.Goods;
import entity.User;
import entity.Contract;
import service.CusService;
import service.GoodsService;
import service.UserService;
import service.ContractService;
import utils.ReturnInfo;

@Controller
@RequestMapping("Contract")
public class Contractcontroller  {
	@Autowired
	ContractService service;
	@Autowired
	CusService cservice;
	@Autowired
	UserService uservice;
	@Autowired
	GoodsService gservice;
	@RequestMapping("index")
	public @ResponseBody ReturnInfo index(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where contract.name like '%" + txt + "%'";
		}
		return service.getWhere(where, page, limit);
	}
	@RequestMapping("user")
	public @ResponseBody ReturnInfo user(String txt, Integer page, Integer limit) {
		String where = "";
		if (txt != null) {
			where = "where customer.name like '%" + txt + "%'";
		}
		return uservice.getWhere(where, page, limit);
	}

	@RequestMapping("delete")
	public @ResponseBody String delete(Integer id, ModelMap m, HttpServletRequest req) {
		service.delete(id);
		return "{\"status\":1}";
	}

	@RequestMapping("edit")
	public @ResponseBody Contract edit(Integer id) {
		return service.getByid(id);
	}

	@RequestMapping("insert")
	public @ResponseBody String insert(Contract t) {
		service.insert(t);
		return "{\"status\":1}";
	}

	@RequestMapping("update")
	public @ResponseBody String update(Contract t) {
		service.update(t);
		return "{\"status\":1}";
	}
	@RequestMapping("getUserid")
	public @ResponseBody List<User> getUsername(){
		return uservice.getAll();
	}
	@RequestMapping("getApprovalname")
	public @ResponseBody List<User> getApproval(){
		return uservice.getAll();
	}
	@RequestMapping("getCustomerid")
	public @ResponseBody List<Customer> getCus(){
		return cservice.getAll();
	}
	@RequestMapping("getGoodsid")
	public @ResponseBody List<Goods> getGoods(){
		return gservice.getAll();
	}
	
	
	
}
