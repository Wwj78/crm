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
<link rel="stylesheet" href="../css/xadmin.css">
<script type="text/javascript" src="/CRM/js/tableSelect.js"></script>
<title></title>
</head>
<body>
<style>
select{
	width: 220px;
}
.layui-input-block{
	width: 260px;
}
.g{
	width:60px;
}
</style>
<div style="width: 50%;display: inline-block;">
<form class="layui-form" lay-filter="myform">
<input type="hidden" name="id" >
<input type="hidden" name="number" >
  <div class="layui-form-item">
    <label class="layui-form-label">合同名称</label>
    <div class="layui-input-block">
      <input type="text" name="name"  autocomplete="off" placeholder="请输入" class="layui-input" >
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">签署人</label>
    <div class="layui-input-block">
      <select name="userid" >
      </select>
    </div>
  </div>
  	<div class="layui-form-item">
		<label class="layui-form-label">审批人</label>
		<div class="layui-input-block">
			<input type="text" name="approvalname" placeholder="请输入" autocomplete="off" class="layui-input" id="demo">
		</div>
	</div>
    <div class="layui-form-item">
    <label class="layui-form-label">客户名称</label>
    <div class="layui-input-block">
      <select name="customerid" >
      </select>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">销售金额</label>
    <div class="layui-input-block">
		<input class="layui-input" type="text" name="amount" >
    </div>
  </div>
     <div class="layui-form-item">
    <label class="layui-form-label">签署时间</label>
    <div class="layui-input-block">
    <input class="layui-input" type="text" autocomplete="off" name="signtime" id="sign">
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">合同开始时间</label>
    <div class="layui-input-block">
		<input class="layui-input" type="text" autocomplete="off" name="begintime" id="begin">
    </div>
    </div>
    <div class="layui-form-item">
    <label class="layui-form-label">合同结束时间</label>
    <div class="layui-input-block">
		<input class="layui-input" type="text"  autocomplete="off" name="endtime" id="end">    </div>
   </div>
    <div style="width: 50%;display: inline-block;position: absolute;left: 30%;top:0;">
	<div class="layui-form-item">
    <label class="layui-form-label">商品</label>
    <div class="layui-input-block">
    	<input class="layui-input" type="hidden"  autocomplete="off" name="goodsid">
    	<input class="layui-input" type="text"  autocomplete="off" name="goodsname" id="goods">
    </div>
    </div>
    
</div>
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>
</div>

<script type="text/javascript">
	var pz=0;
	var p=0;
	var form = layui.form;
		form.render();
	var tableSelect = layui.tableSelect;

	tableSelect.render({
		elem: '#goods',
		searchKey: 'my',
		checkedKey: 'id',
		searchPlaceholder: '自定义文字和name',
		table: {
			url : 'goods' //数据接口
			,
			cols : [ [ //表头
				{ type: 'checkbox' , fixed: 'left'},
			{
				field : 'id',
				title : 'ID',
				sort : true,
				
			}, {
				field : 'name',
				title : '商品名称',
			}, {
				field : 'price',
				title : '单价',
			}

			] ],
			parseData : function(res) {
				return {
					"code" : res.code,
					"msg" : res.msg,
					"count" : res.count,
					data : res.list
				}
			}
		},
		done: function (elem, data) {
			var NEWJSON = []
			var NEWJSON1 = [];
			var NEWJSON2 = [];
			layui.each(data.data, function (index, item) {
				NEWJSON.push(item.id);
				NEWJSON1.push(item.name);
				NEWJSON2.push(item.price);
				p=item.price;
			})
			elem.val(NEWJSON1.join(","));
			$("[name=goodsid]").val(NEWJSON.join(","));
			$("#goodsname").val(NEWJSON1);
			$("#price").val(NEWJSON2);
		}
	});
	$("#discount").bind("input propertychange",function(){
		pz=p*$("#amount").val()*(1-$("#discount").val()/100);
		$("[name=amount]").val(pz);
		$("[name=statistics]").val(pz);
	});
	$("#amount").bind("input propertychange",function(){
		pz=p*$("#amount").val()*(1-$("#discount").val()/100);
		$("[name=amount]").val(pz);
		$("[name=statistics]").val(pz);
	});
	tableSelect.render({
		elem: '#demo',
		searchKey: 'my',
		checkedKey: 'id',
		searchPlaceholder: '自定义文字和name',
		table: {
			url : 'user' //数据接口
			,
			cols : [ [ //表头
				{ type: 'checkbox' , fixed: 'left'},
			{
				field : 'id',
				title : 'ID',
				width : 80,
				sort : true,
				
			}, {
				field : 'name',
				title : '客户名称',
			}, {
				field : 'rolename',
				title : '角色',
				width : 140
			}, {
				field : 'deptname',
				title : '部门',
				width : 140
			},{
				field : 'statusname',
				title : '员工状态',
				width : 140
			}

			] ],
			parseData : function(res) {
				return {
					"code" : res.code,
					"msg" : res.msg,
					"count" : res.count,
					data : res.list
				}
			}
		},
		done: function (elem, data) {
			var NEWJSON = []
			layui.each(data.data, function (index, item) {
				NEWJSON.push(item.name)
			})
			elem.val(NEWJSON.join(","))
		}
	});

</script>

<script type="text/javascript">
var number;
$.post("getCount",{},function(json){
    var datetime = new Date();
    //获取组件
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1;
    var day = datetime.getDate();
    if(month<10){
    	month="0"+month;
    }
    var now = year.toString()+month.toString()+day.toString();
	number=now+"-"+(parseInt(json)+1);
	$("[name=number]").val(number);
},"json");


getlist("getUserid",{},"[name=userid]",-1);
getlist("getCustomerid",{},"[name=customerid]",-1);
getlist("getGoodsid",{},"[name=goodsid]",-1);
layui.use(['form',], function(){
	  var form = layui.form;
	  form.on('submit(demo1)', function(data){
		 $.post("insert", data.field, function(json) {
			  closeFrame();
			  parent.fresh('demo');
			}, "json");
		    
		    return false;
		  });
});
layui.use(['laydate','form'], function(){
    var laydate = layui.laydate;
    var  form = layui.form;
    
    //执行一个laydate实例
    laydate.render({
      elem: '#sign' //指定元素
    ,trigger: 'click'
    });
    laydate.render({
          elem: '#begin'
       ,trigger: 'click'//指定元素
    });
    laydate.render({
          elem: '#end' //指定元素
    	,trigger: 'click'
    });

  });

</script>
</body>
</html>