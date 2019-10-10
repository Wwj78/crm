<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
        <script type="text/javascript">
         function datetime() {
            //创建日期时间对象
            var datetime = new Date();

            //获取组件
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1;
            var day = datetime.getDate();
            var hour = datetime.getHours();
            var minute = datetime.getMinutes();
            var second = datetime.getSeconds();
            var week = datetime.getDay();

            //转换星期格式
            switch (week) {
                case 0:
                    var week = '星期日';
                    break;
                case 1:
                    var week = '星期一';
                    break;
                case 2:
                    var week = '星期二';
                    break;
                case 3:
                    var week = '星期三';
                    break;
                case 4:
                    var week = '星期四';
                    break;
                case 5:
                    var week = '星期五';
                    break;
                case 6:
                    var week = '星期六';
                    break;
            }

            //小时,分钟,秒如果小于10加上前导零
            if (hour < 10) {
                var hour = 0 + "" + hour;
            }

            if (minute < 10) {
                var minute = 0 + "" + minute;
            }

            if (second < 10) {
                var second = 0 + "" + second;
            }

            //完整时间
            var now =  year + "年" + month + "月" + day + "日" + " " + hour + ":" + minute + ":" + second + " " + week;

            //更新内容
            $("#currtime").text(now);//这里是往标签中添加
        }
    </script>
    <script>
    //定时器
    	setInterval(datetime, 100);
	</script>
	<script type="text/javascript">
	
	layui.use('table', function() {
		var table = layui.table;
		var uid=${user.id};
		var uname="${user.name}";
		table.render({
			elem : '#today_res',
			url : 'Reserved/getToday' //数据接口
			,
			where : {username:uname},
			page : false //开启分页
			,
			cols : [ [ //表头
				{
					field : 'id',
					title : 'ID',
					sort : true,
					
				}, {
					field : 'customername',
					title : '客户名称',
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
		});
		table.render({
			elem : '#tomonth_rev',
			url : 'Revisit/getTomonth' //数据接口
			,
			where : {userid:uid},
			page : false //开启分页
			,
			cols : [ [ //表头
				{
					field : 'id',
					title : 'ID',
					sort : true,
					
				}, {
					field : 'customername',
					title : '客户名称',
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
		});
	});
	
	</script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <blockquote class="layui-elem-quote">欢迎：
                                <span class="x-red">${user.name}</span>
                                                     当前时间:<span class="x-red" id="currtime"></span>
                            </blockquote>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">数据统计</div>
                        <div class="layui-card-body ">
                            <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>客户数</h3>
                                        <p>
                                            <cite>${cusnum}</cite></p>
                                    </a>
                                </li>
                               
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>员工数</h3>
                                        <p>
                                            <cite>${usernum}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>部门数</h3>
                                        <p>
                                            <cite>${deptnum}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>合同数</h3>
                                        <p>
                                            <cite>${connum}</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-md2 layui-col-xs6 ">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>产品数</h3>
                                        <p>
                                            <cite>${goodsnum}</cite></p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6 layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header"><a href="Reserved/reserved.jsp">预约</a>
                            <span class="layui-badge layui-bg-cyan layuiadmin-badge">今日</span></div>
                        <div class="layui-card-body  " style="height: 200px;">
                            <table id="today_res"></table>
                        </div>
                    </div>
                </div>
                <div class="layui-col-sm6 layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header"><a href="Revisit/revisit.jsp">已回访</a>
                            <span class="layui-badge layui-bg-cyan layuiadmin-badge">月</span></div>
                        <div class="layui-card-body" style="height: 200px;">
                            <table id="tomonth_rev"></table>
                        </div>
                    </div>
                </div>

                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">系统信息</div>
                        <div class="layui-card-body" >
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>版本号</th>
                                        <td>1.0.180420</td></tr>
                                    <tr>
                                        <th>服务器地址</th>
                                        <td>x.xuebingsi.com</td></tr>
                                    <tr>
                                        <th>操作系统</th>
                                        <td>WINNT</td></tr>
                                    <tr>
                                        <th>运行环境</th>
                                        <td>Apache/2.4.23 (Win32) OpenSSL/1.0.2j mod_fcgid/2.3.9</td></tr>
                                    <tr>
                                        <th>PHP版本</th>
                                        <td>5.6.27</td></tr>
                                    <tr>
                                        <th>PHP运行方式</th>
                                        <td>cgi-fcgi</td></tr>
                                    <tr>
                                        <th>MYSQL版本</th>
                                        <td>5.5.53</td></tr>
                                    <tr>
                                        <th>ThinkPHP</th>
                                        <td>5.0.18</td></tr>
                                    <tr>
                                        <th>上传附件限制</th>
                                        <td>2M</td></tr>
                                    <tr>
                                        <th>执行时间限制</th>
                                        <td>30s</td></tr>
                                    <tr>
                                        <th>剩余空间</th>
                                        <td>86015.2M</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">开发团队</div>
                        <div class="layui-card-body ">
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>版权所有</th>
                                        <td>
                                            <a href="http://x.xuebingsi.com/" target="_blank">访问官网</a></td>
                                    </tr>
                                    <tr>
                                        <th>开发者</th>
                                        <td>王文杰(wwjie_666@163.com)</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <style id="welcome_style"></style>
                <div class="layui-col-md12">
                    <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由x-admin提供技术支持。</blockquote></div>
            </div>
        </div>
        </div>
    </body>
</html>