<%@ page language="java" contentType="text/html" import="java.util.Date"
	import="java.text.SimpleDateFormat" import="java.sql.*"
	pageEncoding="UTF-8"%>
<html>
<head>

<style>
#div1 {
	position: relative;
	text-align: center;
	margin-top: 300px;
	margin-left: 750px;
	width: 360px;
	height: 400px;
	background-color: #F9FFEA;
	box-shadow: 0 0 1px 1px;
	opacity: 0.85;
	border-radius: 5px
}

body {
	font-family: sans-serif;
	background:
		url('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542350848309&di=7b0f19258b67b799bf7baa702aa8d9b4&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F038f7d458350590a8012060c8cd1820.jpg');
	background-size: cover;
	width: 100%;
	margin: 0 auto;
}
</style>
</head>

<body>
	
	<div id="div1">
			<h1 style="font-size: 30px;color:blue;margin-top: 80px">欢迎来到账户管理系统</h1>
			<p style="font-size: 23px;color:blue">登录页</p>
		<div id="div2">
		
			<form action="login.jsp" name="form1" method="post">
				<table>
					<br>
					<br>
					<br> 用户名：
					<input type="text" name="uname" id="idname">
					<br>
					<br> 密码::&nbsp;
					<input type="password" name="upsw" id="idpsw">
					<br>
					<br>
					<br>
					<br>
					<input type="reset" class="btn btn-primary"
						style="height: 30px;color:white;background-color: navy;"
						value="重置" id="btn1">&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-primary"
						style="height: 30px;color:white;background-color: navy;"
						value="确定" id="btn2" onclick="mylogin();">&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-primary"
						style="height: 30px;color:white;background-color: navy;"
						value="去注册" id="btn3" onclick="register();">

				</table>
			</form>
		</div>
	</div>


	<%
		request.setCharacterEncoding("UTF-8");
		String stname = request.getParameter("uname");
		String stpass = request.getParameter("upsw");
		// String stip = request.getRemoteAddr();

		/*    Date date = new Date();
		SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		String nowTime = sdf.format(date);*/

		//------------------连接数据库---------------------  
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
		
	

		
		String sql2 = "SELECT uspass FROM users where usname='" + stname + "' and PASSWORD('" + stpass
				+ "')=uspass";
		ResultSet rs = stat.executeQuery(sql2);
		
		/* while(rs.next()){
		 String pass = rs.getString("uspass");
		 out.print(pass);
		}
		 
		
		stat.close();
		conn.close();*/
	%>
	<script>
			function mylogin(){
					<%if (rs.next()) {%>
      
      window.location.href="a.jsp"; <%} else {%>
    	alert("密码错误或用户未注册！");
    	<%}

			stat.close();
			conn.close();%>

			}

			</script>

	<script>	
				function register()
				{
					
						window.location.href="register.jsp";
					
				}
			</script>

</body>
</html>





