package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public interface UserDao {

	@Select("select count(1)  from  User LEFT JOIN dept on user.deptid=dept.id LEFT JOIN role on user.roleid=role.id ${where}")
	public Integer selectCount(@Param("where") String where);
	@Select("select count(1)  from  User LEFT JOIN dept on user.deptid=dept.id LEFT JOIN role on user.roleid=role.id ")
	public Integer selectNum();
	@Select("select User.*,dept.name deptname,role.name rolename from  User LEFT JOIN dept on user.deptid=dept.id LEFT JOIN role on user.roleid=role.id ${where} order by user.id ${limit}")
	public  List<User> getWhere(@Param("where") String where,@Param("limit") String limit);
	
	@Select("select User.* from  User ")
	public  List<User> getAll();
	@Select("select*from user where login=#{login} and password=#{password}")
	public  User login(User u);
	@Select("select User.*,dept.name deptname,role.name rolename from  User LEFT JOIN dept on user.deptid=dept.id LEFT JOIN role on user.roleid=role.id  where user.id=#{id}")
	public  User getByid(int id);

	@Delete("delete from User where id=#{id}")
	public int delete(int id);

	 @Insert("insert into User (name,login,password,roleid,status,sex,deptid,power) values(#{name},#{login},#{password},#{roleid},#{status},#{sex},#{deptid},#{power})")
	 public Integer insert(User t);

	 @Update("update User set name=#{name},login=#{login},password=#{password},roleid=#{roleid},status=#{status},sex=#{sex},deptid=#{deptid},power=#{power} where id=#{id}")
	 public Integer update(User t);

}
