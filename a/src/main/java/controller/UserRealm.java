package controller;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import entity.User;
import service.ClueService;
import service.ContractService;
import service.CusService;
import service.DeptService;
import service.GoodsService;
import service_Impl.UserServiceImpl;

public class UserRealm extends AuthorizingRealm
{
	@Autowired
	UserServiceImpl service;
	@Autowired
	CusService cservice;
	@Autowired
	ClueService clueservice;
	@Autowired
	ContractService conservice;
	@Autowired
	GoodsService gservice;
	@Autowired
	DeptService dservice;
    protected Logger logger =  LoggerFactory.getLogger(this.getClass());  
    @Override
    protected AuthorizationInfo  doGetAuthorizationInfo(PrincipalCollection arg0)
    {
        UsernamePasswordToken token =  (UsernamePasswordToken)  SecurityUtils.getSubject().getPrincipal();
        String username = token.getUsername();
        logger.info(username + "授权...");
        // 从数据库中查找该用户的角色和权限
        SimpleAuthorizationInfo sainfo = new  SimpleAuthorizationInfo();
        Set<String> roles = new  HashSet<String>();
        roles.add("admin");
        //roles.add("role1");
        Set<String> permissions = new  HashSet<String>();
        permissions.add("add");
        permissions.add("delete");
        sainfo.setRoles(roles);
         sainfo.setStringPermissions(permissions);
        return sainfo;
    }
    @Override
    protected AuthenticationInfo  doGetAuthenticationInfo(AuthenticationToken  arg0)
        throws AuthenticationException
    {
    UsernamePasswordToken token =  (UsernamePasswordToken)arg0;
    	User user = service.login(new User(token.getUsername(),new String(token.getPassword())));
    	int cusnum= cservice.selectNum();
    	int cluenum=clueservice.selectNum();
    	int usernum=service.selectNum();
    	int deptnum=dservice.selectNum();
    	int connum=conservice.selectNum();
    	int goodsnum=gservice.selectNum();
   //      根据username从数据库查找用户，得到密码
   //      假设找到的用户如下
    	
        if (null == user) {
            throw new  AccountException("username is not exist");
        }
        SecurityUtils.getSubject().getSession().setAttribute("user", user);
        SecurityUtils.getSubject().getSession().setAttribute("cusnum", cusnum);
        SecurityUtils.getSubject().getSession().setAttribute("cluenum",cluenum);
        SecurityUtils.getSubject().getSession().setAttribute("usernum",usernum);
        SecurityUtils.getSubject().getSession().setAttribute("deptnum",deptnum);
        SecurityUtils.getSubject().getSession().setAttribute("connum",connum);
        SecurityUtils.getSubject().getSession().setAttribute("goodsnum",goodsnum);
        return new  SimpleAuthenticationInfo(arg0, token.getPassword(),token.getUsername());
    }
}
