<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.edu.imnu.mishop.bean.Cart"%>
<%@ page import="cn.edu.imnu.mishop.bean.Users"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<jsp:useBean id="myCart"
	class="cn.edu.imnu.mishop.dao.CartDAO" scope="request">
</jsp:useBean>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="../css/iconfont.css">
	<link rel="stylesheet" href="../css/global.css">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../css/swiper.min.css">
	<link rel="stylesheet" href="../css/styles.css">
	<script src="../js/jquery.1.12.4.min.js" charset="UTF-8"></script>
	<script src="../js/bootstrap.min.js" charset="UTF-8"></script>
	<script src="../js/swiper.min.js" charset="UTF-8"></script>
	<script src="../js/global.js" charset="UTF-8"></script>
	<script src="../js/jquery.DJMask.2.1.1.js" charset="UTF-8"></script>
	<title>U袋网</title>
</head>
<body>
	<jsp:include page="../top.jsp" flush="true"></jsp:include>
	<!-- 顶部标题 -->
	<div class="bgf5 clearfix">
		<div class="top-user">
			<div class="inner">
				<a class="logo" href="../index.jsp"><img src="../images/icons/logo.jpg" alt="U袋网" class="cover"></a>
				<div class="title">购物车</div>
			</div>
		</div>
	</div>
	<div class="content clearfix bgf5">
		<section class="user-center inner clearfix">
			<div class="user-content__box clearfix bgf">
				<div class="title">购物车</div>
					
					<table class="table table-bordered">
							<%
								Users users = (Users)session.getAttribute("SESSION_USERS");
								List<Cart> list = myCart.getCartGoods(users.getUsers_id());
								if (!list.isEmpty()) {
							%>
									<form action="">
										<thead>
											<tr>
												<th width="150">
													<label class="checked-label"><input type="checkbox" class="check-all"><i></i> 全选</label>
												</th>
												<th width="300">商品信息</th>
												<th width="150">单价</th>
												<th width="200">数量</th>
												<th width="200">现价</th>
												<th width="80">操作</th>
											</tr>
										</thead>
								<%
										for (Cart cart : list) {
								%>
									<tbody>
										<tr>
											<th scope="row">
												<label class="checked-label"><input type="checkbox" name="check"><i></i>
													<div class="img"><img src="../<%=cart.getGoods_cover() %>" style="width:126px;height:126px;" alt="<%=cart.getGoods_name() %>" class="cover"></div>
												</label>
											</th>
											<td>
												<div class="name ep3"><%=cart.getGoods_name() %></div>
												<div class="type c9" goodscolor="<%=cart.getGoods_color() %>" goodssize="<%=cart.getGoods_size() %>">颜色分类：<%=cart.getGoods_color() %>  尺码：<%=cart.getGoods_size() %></div>
											</td>
											<td class="price" value="<%=cart.getGoods_price() %>">¥<%=cart.getGoods_price() %></td>
											<td>
												<div class="cart-num__box" goodsid="<%=cart.getGoods_id()%>">
													<input type="button" class="sub" value="-" >
													<input type="text" class="val" value="<%=cart.getGoods_amout() %>" maxlength="2">
													<input type="button" class="add" value="+" >
												</div>
											</td>
											<td class="price" value="<%=cart.getGoods_price() %>" >¥<%=cart.getGoods_price() %></td>
											<td><a href="" class="del">删除</a></td>
										</tr>	
									</tbody>
															
								<%
										}
								%>
									</table>
									<div class="user-form-group tags-box shopcart-submit pull-right">
										<button type="submit" class="btn">提交订单</button>
									</div>
									<div class="checkbox shopcart-total">
										<label><input type="checkbox" class="check-all"><i></i> 全选</label>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="" class="alldel">删除</a>
										<div class="pull-right">
											已选商品 <span class="checkAmout">0</span> 件
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合计（不含运费）
											<b class="cr">¥<span class="fz24" >0.00</span></b>
										</div>
									</div>
								</form>
								<script type="text/javascript">
								
								
								</script>
							<%
								} else {
							%>
							<div class="tips">
									<img alt="" class="tipsImg" src="../images/timg.gif">
									
										<p class="tipstext">您的购物车是空的哦~<br />去看看心仪的商品吧~</p>
										<a href="../index.jsp"><button class="tipshref">立即去购物</button></a>
							</div>
							<style>
								.tips{
									width:1100px;
									height:450px;
									position: relative;
								}
							
								.tipsImg{
									height: 80%;
									float:left;						
								}
								.tipstext{
									float:left;
									height:26px;
									line-height: 26px;
									font-size: 25px;
									font-family: "microsoft yahei";
									height: 80px;
									line-height:40px;
									text-align: center;
									position: absolute;
								    top: 120px;
								    right: 160px;
								}
								.tipshref{
									position: absolute;
								    top: 220px;
								    right: 245px;
								    height:35px;
								    width:90px;
								    background-color:#b31e22;
								    border:1px solid #b31e22;
								    color:#fff;
								    line-height:35px;
								}
							</style>
							<%
								}
							%>							
						
					
					<script>
						$(document).ready(function(){
							var $item_checkboxs = $('.shopcart-form__box tbody input[type="checkbox"]'),
								$check_all = $('.check-all');
							// 全选
							$check_all.on('change', function() {
								$check_all.prop('checked', $(this).prop('checked'));
								$item_checkboxs.prop('checked', $(this).prop('checked'));
							});
							// 点击选择
							$item_checkboxs.on('change', function() {
								var flag = true;
								$item_checkboxs.each(function() {
									if (!$(this).prop('checked')) { flag = false }
								});
								$check_all.prop('checked', flag);
							});
							// 个数限制输入数字
							$('input.val').onlyReg({reg: /[^0-9.]/g});
							// 加减个数
							$('.cart-num__box').on('click', '.sub,.add', function() {
								var value = parseInt($(this).siblings('.val').val());
								if ($(this).hasClass('add')) {
									$(this).siblings('.val').val(Math.min((value += 1),99));
								} else {
									$(this).siblings('.val').val(Math.max((value -= 1),1));
								}
							});
							$(document).ready(function() {
								$(".alldel").click(function(){
									$("input[name='check']").each(function () {
										if ($(this).is(":checked")) {
											var thisParents = $(this).parents().parents().siblings()
											var goodsid = thisParents.children(".cart-num__box").attr("goodsid")
											var goodscolor = thisParents.children(".type").attr("goodscolor")
											var goodssize = thisParents.children(".type").attr("goodssize")
											var goodsamout = thisParents.children(".cart-num__box").children(".val").attr("value")
											$(function(){
												$.changeGoodsAmout("del", goodsid, goodscolor, goodssize, goodsamout)
											});
				                        }
						               });
								});
								$(".check-all").click(function(){
									var flag = this.checked;
									var total = 0
									if($(this).is(':checked')){
										$("input[name='check']").each(function(){								
											var price = $(this).parents().siblings(".price").attr("value")
											var amout = $(this).parents().siblings().children('.cart-num__box').children(".val").attr("value")
											total = total + price * amout											
											this.checked = flag											
										});
										$(".fz24").text(total.toFixed(2))
										$(".checkAmout").html($('input[type=checkbox]:checked').length - 1)
									} else {
										$("input[name='check']").each(function(){
											this.checked = flag
											$(".fz24").text("0.00")
										});
										$(".checkAmout").html($('input[type=checkbox]:checked').length - 1)
									}										
								});
								$("input[name='check']").click(function(){
									$(".checkAmout").html($('input[type=checkbox]:checked').length)
									var price = $(this).parents().siblings(".price").attr("value")
									var amout = $(this).parents().siblings().children('.cart-num__box').children(".val").attr("value")
									if($(this).is(':checked')) {
										$(function(){
											$.totalPrice(price, amout)
										});
									} else {
										$(function(){
											$.subPrice(price, amout)
										});
									}
								});
								$(".add").click(function(){
									var thisParents = $(this).parents('.cart-num__box')
									var goodsid = thisParents.attr("goodsid")
									var goodscolor = thisParents.parents().prevAll().children(".type").attr("goodscolor")
									var goodssize = thisParents.parents().prevAll().children(".type").attr("goodssize")
									var goodsamout = $(this).siblings(".val").attr("value")
									$(function(){
										$.changeGoodsAmout("add", goodsid, goodscolor, goodssize,goodsamout)
									});
									if($(this).parents().parents().siblings().children().children("input[name='check']").is(':checked')){
										var price = $(this).parents().parents().siblings(".price").attr("value")
										var amout = 1
										$(function(){
											$.totalPrice(price, amout)
										});
									}
									
								});
								$(".sub").click(function(){
									var thisParents = $(this).parents('.cart-num__box')
									var goodsid = thisParents.attr("goodsid")
									var goodscolor = thisParents.parents().prevAll().children(".type").attr("goodscolor")
									var goodssize = thisParents.parents().prevAll().children(".type").attr("goodssize")
									var goodsamout = $(this).siblings(".val").attr("value")
									$(function(){
										$.changeGoodsAmout("sub", goodsid, goodscolor, goodssize,goodsamout)
									});
									if($(this).parents().parents().siblings().children().children("input[name='check']").is(':checked')){
										var price = $(this).parents().parents().siblings(".price").attr("value")
										var amout = 1
										$(function(){
											$.subPrice(price, amout)
										});
									}
								});
								$(".del").click(function(){
									var thisSiblings = $(this).parents().siblings()
									var goodsid = thisSiblings.children(".cart-num__box").attr("goodsid")
									var goodscolor = thisSiblings.children(".type").attr("goodscolor")
									var goodssize = thisSiblings.children(".type").attr("goodssize")
									var goodsamout = thisSiblings.children(".cart-num__box").children(".val").attr("value")
									$(function(){
										$.changeGoodsAmout("del", goodsid, goodscolor, goodssize, goodsamout)
									});
								});
								//ajax修改购物车商品数量
								(function($){
									$.changeGoodsAmout =  function(type, goodsid, goodscolor, goodssize, goodsamout){
										$.ajax({
								            url: "<%=request.getContextPath() %>/AddCartAmoutServlet",			
								            type: "post",    
								            data:{
								            	goodstype: type,
								            	userid: <%=users.getUsers_id() %>,
								            	goodsid: goodsid,
								            	goodscolor: goodscolor,
								            	goodssize: goodssize,
								            	goodsamout: goodsamout
								            },				
								            error:function(data){
								            	console.log("change cart amout", data)
								            },
								            success:function(data){
								            	console.log("change cart amout", data)
								            }
								        });
								};
								$.totalPrice =  function (price, amout){
									var currprice = parseInt($(".fz24").text())
									var total = (price * amout + currprice).toFixed(2)
									$(".fz24").text(total)
								};
								$.subPrice =  function (price, amout){
									var currprice = parseInt($(".fz24").text())
									var total = (currprice - price * amout).toFixed(2)
									$(".fz24").text(total)
								};
								})(jQuery)
								
							});
						});
					</script>
			
			</div>
		</section>
	</div>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="../udai_welcome.jsp" class="r-item-hd">
					<i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="../udai_shopcart.jsp" class="r-item-hd">
					<i class="iconfont icon-cart"></i>
					<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_collection.html" class="r-item-hd">
					<i class="iconfont icon-aixin"></i>
					<div class="r-tip__box"><span class="r-tip-text">我的收藏</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="" class="r-item-hd">
					<i class="iconfont icon-liaotian"></i>
					<div class="r-tip__box"><span class="r-tip-text">联系客服</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="issues.html" class="r-item-hd">
					<i class="iconfont icon-liuyan"></i>
					<div class="r-tip__box"><span class="r-tip-text">留言反馈</span></div>
				</a>
			</li>
			<li class="r-toolbar-item to-top">
				<i class="iconfont icon-top"></i>
				<div class="r-tip__box"><span class="r-tip-text">返回顶部</span></div>
			</li>
		</ul>
		<script>
			$(document).ready(function(){ $('.to-top').toTop({position:false}) });
		</script>
	</div>
	<!-- 底部信息 -->
	<div class="footer">
		<div class="footer-tags">
			<div class="tags-box inner">
				<div class="tag-div">
					<img src="../images/icons/footer_1.gif" alt="厂家直供">
				</div>
				<div class="tag-div">
					<img src="../images/icons/footer_2.gif" alt="一件代发">
				</div>
				<div class="tag-div">
					<img src="../images/icons/footer_3.gif" alt="美工活动支持">
				</div>
				<div class="tag-div">
					<img src="../images/icons/footer_4.gif" alt="信誉认证">
				</div>
			</div>
		</div>
		<div class="footer-links inner">
			<dl>
				<dt>U袋网</dt>
				<a href="temp_article/udai_article10.html"><dd>企业简介</dd></a>
				<a href="temp_article/udai_article11.html"><dd>加入U袋</dd></a>
				<a href="temp_article/udai_article12.html"><dd>隐私说明</dd></a>
			</dl>
			<dl>
				<dt>服务中心</dt>
				<a href="temp_article/udai_article1.html"><dd>售后服务</dd></a>
				<a href="temp_article/udai_article2.html"><dd>配送服务</dd></a>
				<a href="temp_article/udai_article3.html"><dd>用户协议</dd></a>
				<a href="temp_article/udai_article4.html"><dd>常见问题</dd></a>
			</dl>
			<dl>
				<dt>新手上路</dt>
				<a href="temp_article/udai_article5.html"><dd>如何成为代理商</dd></a>
				<a href="temp_article/udai_article6.html"><dd>代销商上架教程</dd></a>
				<a href="temp_article/udai_article7.html"><dd>分销商常见问题</dd></a>
				<a href="temp_article/udai_article8.html"><dd>付款账户</dd></a>
			</dl>
		</div>
		<div class="copy-box clearfix">
			<ul class="copy-links">
				<a href="agent_level.html"><li>网店代销</li></a>
				<a href="class_room.html"><li>U袋学堂</li></a>
				<a href="udai_about.html"><li>联系我们</li></a>
				<a href="temp_article/udai_article10.html"><li>企业简介</li></a>
				<a href="temp_article/udai_article5.html"><li>新手上路</li></a>
			</ul>
			<!-- 版权 -->
			<p class="copyright">
				© 2005-2017 U袋网 版权所有，并保留所有权利<br>
				ICP备案证书号：闽ICP备16015525号-2&nbsp;&nbsp;&nbsp;&nbsp;福建省宁德市福鼎市南下村小区（锦昌阁）1栋1梯602室&nbsp;&nbsp;&nbsp;&nbsp;Tel: 18650406668&nbsp;&nbsp;&nbsp;&nbsp;E-mail: 18650406668@qq.com
			</p>
		</div>
	</div>
</body>
</html>