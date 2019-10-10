<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link href="/CRM/lib/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="/CRM/lib/layui/layui.all.js"></script>
<script src="/CRM/js/jquery.min.js"></script>
<script type="text/javascript" src="/CRM/js/my.js"></script>


<title></title>
</head>
<body>
<style>
select {
	width: 220px;
}
div {
	width: 260px;
}
</style>
<form class="layui-form" lay-filter="myform">
<input type="hidden" name="id" >
  <div class="layui-form-item">
    <label class="layui-form-label">员工姓名</label>
    <div class="layui-input-block">
      <input type="text" name="name"  autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">手机号</label>
    <div class="layui-input-block">
 		<input type="text" name="login"  autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
	  <input type="text" name="password"  autocomplete="off" placeholder="请输入" class="layui-input">
	</div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">角色</label>
    <div class="layui-input-block">
      <select name="roleid" >
      </select>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">员工状态</label>
    <div class="layui-input-block">
      <select name="status" >
      </select>
    </div>
  </div>
     <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <select name="sex" >
      </select>	
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">部门</label>
    <div class="layui-input-block">
		<select name="deptid" >
      </select>	
    </div>
    <br>
    <div class="layui-form-item">
    <label class="layui-form-label">限权</label>
    <div class="layui-input-block">
      <input type="text" name="power"  autocomplete="off" placeholder="请输入" class="layui-input">
    </div>
   </div>
      <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>

<script type="text/javascript">
var id="${param.id}";

$.post("edit",{id:id}, function(json) {
	render('myform', json);
	getlist("getRoleid",{},"[name=roleid]",json.roleid);
	getarray("getSexs",{},"[name=sex]",json.sex);
	getarray("getStatus",{},"[name=status]",json.status);
	getlist("getDeptid",{},"[name=deptid]",json.deptid);
},"json");
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("update", data.field, function(json) {
			  closeFrame();
			  parent.fresh('demo');
			}, "json");
		    
		    return false;
		  });
	     layui.use(['laydate','form'], function(){
	         var laydate = layui.laydate;
	         var  form = layui.form;


	         // 监听全选
	         form.on('checkbox(checkall)', function(data){

	           if(data.elem.checked){
	             $('tbody input').prop('checked',true);
	           }else{
	             $('tbody input').prop('checked',false);
	           }
	           form.render('checkbox');
	         }); 
	         
	         //执行一个laydate实例
	         laydate.render({
	           elem: '#time' //指定元素
	         });

	       });
});
</script>
</body>
</html>