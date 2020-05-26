<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "cn.edu.imnu.mishop.bean.Users" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 顶部tab -->
	<div class="tab-header">
		<div class="inner">
			<div class="pull-left">
				<div class="pull-left">嗨，欢迎来到<span class="cr">U袋网</span></div>
				<a href="agent_level.html">网店代销</a>
				<a href="temp_article/udai_article4.html">帮助中心</a>
			</div>
			<div class="pull-right">
				<%
					Users sessionUsers = (Users)session.getAttribute("SESSION_USERS");
					if(sessionUsers == null){
				%>
					<a href="login.jsp"><span class="cr">登录</span></a>
					<a href="login.jsp?p=register">注册</a>
				<%
					} else {
				%>
					<span>Hi~</span>
					<span class="cr" ><%=sessionUsers.getUsers_phone() %></span>
					<a href="" + url id="logout">退出</a>
				<%
					}
				%>
				<script>
					$('#logout').click(function(){
						var url = window.location.href;
						document.getElementById("logout").href="LogoutServlet?url=" + url;
					});
				</script>
				<a href="udai_welcome.jsp">我的U袋</a>
				<a href="udai_order.jsp">我的订单</a>
				<a href="udai_integral.html">积分平台</a>
			</div>
		</div>
	</div>
</body>
</html>