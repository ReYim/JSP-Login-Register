<%@ page language="java" contentType="text/html" import="java.util.Date"
	import="java.text.SimpleDateFormat" import="java.sql.*"
	pageEncoding="UTF-8"%>
<html>

<head>
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<title>注册页面</title>

<style>
#div1 {
	margin-top: 200px;
	margin-left: 750px;
	width: 360px;
	height: 300px;
	background-color: #F9FFEA;
	box-shadow: 0 0 1px 1px;
	opacity: 0.85;
	border-radius: 5px
}

body {
	background:
		url('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542350848309&di=7b0f19258b67b799bf7baa702aa8d9b4&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F038f7d458350590a8012060c8cd1820.jpg');
	font-family: sans-serif;
	background-size: cover;
	width: 100%;
	margin: 0 auto;
}

#header {
	width: 60%;
	margin: 0 auto;
	text-align: center;
	color: #fff;
}

#div2 {
	position: relative;
	top: 50px;
}

#div2 {
	position: relative;
	top: 50px;
	vertical-align: center;
}
</style>


</head>
<body>
	<div class="container-fluid">
		<div id="header">
			<h1 style="font-size: 30px;color:blue;margin-top: 80px">欢迎来到账户管理系统</h1>
			<p style="font-size: 23px;color:blue">注册页</p>

		</div>
		<div id="div1">
			<div id="div2">
				<form action="register.jsp" name="form1" method="post">
					<table>
						&nbsp;&nbsp;&nbsp; 用户名:：
						<input type="text" name="uname" id="idname">
						<br>
						<br> &nbsp;&nbsp;&nbsp; 设置密码:
						<input type="password" name="upsw" id="idpsw">
						<br>
						<br> &nbsp;&nbsp;&nbsp; 确认密码:
						<input type="password" name="upsw2" id="idpsw2">
						<br>
						<br>
						<br>
						<br> &nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn btn-primary" value="重置" id="btn1">&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btn-primary" value="提交" id="btn2"
							onclick="mylogin();">&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btn-primary" value="去登陆" id="btn3"
							onclick="login();">

					</table>
				</form>
			</div>
		</div>

		<%
			request.setCharacterEncoding("UTF-8");
			String stname = request.getParameter("uname");
			String stpass = request.getParameter("upsw");
			String stip = request.getRemoteAddr();

			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat(" yyyy-MM-dd HH:mm:ss ");
			String nowTime = sdf.format(date);
			boolean isValid = false;

			//------------------连接数据库------------------------------
			String driverName = "com.mysql.jdbc.Driver"; //驱动名称  
			String DBUser = "root"; //mysql用户名  
			String DBPasswd = "123456"; //mysql密码  
			String DBName = "mys"; //数据库名 

			String connUrl = "jdbc:mysql://localhost/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd;
			Class.forName(driverName).newInstance();
			Connection conn = DriverManager.getConnection(connUrl);
			Statement stat = conn.createStatement();
			stat.executeQuery("SET NAMES UTF8");
			//------------------------------------------------------------------
			
			if (stname != null && stpass != null && stip != null) {     //防止每次刷新页面时时重新提交 null 的数据到数据库
				String sql = "INSERT INTO users (usname,uspass,usip) VALUES ('" + stname + "',PASSWORD('" + stpass
						+ "'),'" + stip + "')";
				int i = stat.executeUpdate(sql);

				String sql2 = "SELECT uspass FROM users where usname='" + stname + "' and PASSWORD('" + stpass
						+ "')=uspass";
				ResultSet rs = stat.executeQuery(sql2);

				if (rs.next()) {
					isValid = true;
				}
				if (isValid) {
					//out.println("登录成功！");

				} else {
					out.println("登录失败！");

				}

				stat.close();
				conn.close();
			}
		%>

	</div>
</body>
<script type="text/javascript">

	function mylogin() {   //判断输入不能为空的函数
		var ps1 = document.getElementById("idpsw").value;
		var ps2 = document.getElementById("idpsw2").value;
		var name = document.getElementById("idname").value;
		if (ps1 == "" || ps2 == "" || name == "") {
			alert("表格内容不能为空！，请填写");
			return false;

		} else if (ps1 != ps2) {
			alert("两次输入密码不一样，请重新填写");
			return false;

		} else {
			alert("注册成功，请登陆！");
			form1.submit();
			return true;
		
		}

	}

	function login() {  //跳转登录窗口
		window.location.href = "login.jsp";
	}
</script>
</html>