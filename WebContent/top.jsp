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
					<a href="LogoutServlet">退出</a>
				<%
					}
				%>
				<a href="udai_welcome.jsp">我的U袋</a>
				<a href="udai_order.jsp">我的订单</a>
				<a href="udai_integral.html">积分平台</a>
			</div>
		</div>
	</div>
	<!-- 搜索栏 -->
	<div class="top-search">
		<div class="inner">
			<a class="logo" href="index.jsp"><img src="images/icons/logo.jpg" alt="U袋网" class="cover"></a>
			<div class="search-box">
				<form class="input-group">
					<input placeholder="Ta们都在搜U袋网" type="text">
					<span class="input-group-btn">
						<button type="button">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</span>
				</form>
				<p class="help-block text-nowrap">
					<a href="">连衣裙</a>
					<a href="">裤</a>
					<a href="">衬衫</a>
					<a href="">T恤</a>
					<a href="">女包</a>
					<a href="">家居服</a>
					<a href="">2017新款</a>
				</p>
			</div>
			<div class="cart-box">
				<a href="udai_shopcart.jsp" class="cart-but">
					<i class="iconfont icon-shopcart cr fz16"></i> 购物车 0 件
				</a>
			</div>
		</div>
	</div>
</body>
</html>