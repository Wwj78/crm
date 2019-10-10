package service;

import java.util.List;

import entity.User;
import utils.ReturnInfo;

public interface UserService extends basicService<User>{
	public  ReturnInfo getWhere(String where,Integer limit,Integer page);
	public  List<User> getAll();
	public User login(User u);
	public int selectNum();
}
