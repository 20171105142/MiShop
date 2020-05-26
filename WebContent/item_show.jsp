<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.edu.imnu.mishop.bean.Goods"%>
<%@ page import="cn.edu.imnu.mishop.bean.Users"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<html lang="zh-cmn-Hans">
<jsp:useBean id="recommend"
	class="cn.edu.imnu.mishop.dao.GoodsDAO" scope="request">
</jsp:useBean>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" href="css/iconfont.css">
	<link rel="stylesheet" href="css/global.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/swiper.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<script src="js/jquery.1.12.4.min.js" charset="UTF-8"></script>
	<script src="js/bootstrap.min.js" charset="UTF-8"></script>
	<script src="js/swiper.min.js" charset="UTF-8"></script>
	<script src="js/global.js" charset="UTF-8"></script>
	<script src="js/jquery.DJMask.2.1.1.js" charset="UTF-8"></script>
	<title>U袋网</title>
</head>
<body>
	<jsp:include page="top.jsp" flush="true"></jsp:include>
	<jsp:include page="search.jsp" flush="true"></jsp:include>
	<!-- 内页导航栏 -->
	<div class="top-nav bg3">
		<div class="nav-box inner">
			<div class="all-cat">
				<div class="title"><i class="iconfont icon-menu"></i> 全部分类</div>
			</div>
			<ul class="nva-list">
				<a href="index.jsp"><li>首页</li></a>
				<a href="temp_article/udai_article10.html"><li>企业简介</li></a>
				<a href="temp_article/udai_article5.html"><li>新手上路</li></a>
				<a href="class_room.html"><li>U袋学堂</li></a>
				<a href="enterprise_id.html"><li>企业账号</li></a>
				<a href="udai_contract.html"><li>诚信合约</li></a>
				<a href="item_remove.html"><li>实时下架</li></a>
			</ul>
		</div>
	</div>
	<%
		Goods goods = (Goods)request.getAttribute("goodsDeatil");
	%>
	<div class="content inner">
		<section class="item-show__div item-show__head clearfix">
			<div class="pull-left">
				<ol class="breadcrumb">
					<li><a href="index.html">首页</a></li>
					<li><a href="item_sale_page.html">爆款推荐</a></li>
					<li class="active"><%=goods.getGoods_name() %></li>
				</ol>
				<div class="item-pic__box" id="magnifier">
					<div class="small-box">
						<img class="cover" src="<%=goods.getGoods_DisplayImages()[0] %>" alt="重回汉唐 旧忆 原创设计日常汉服女款绣花长褙子吊带改良宋裤春夏">
						<span class="hover"></span>
					</div>
					<div class="thumbnail-box">
						<a href="javascript:;" class="btn btn-default btn-prev"></a>
						<div class="thumb-list">
							<ul class="wrapper clearfix">
								<%
									int i = 0;
									for(String image : goods.getGoods_DisplayImages()){
										i++;
								%>
									<li class="item active" data-src="<%=goods.getGoods_enlargeDisplayImages()[i - 1] %>"><img class="cover" src="<%=image %>" alt="商品预览图"></li>
								<%
									}
								%>
							</ul>
						</div>
						<a href="javascript:;" class="btn btn-default btn-next"></a>
					</div>
					<div class="big-box"><img src="<%=goods.getGoods_enlargeDisplayImages()[0] %>" alt="重回汉唐 旧忆 原创设计日常汉服女款绣花长褙子吊带改良宋裤春夏"></div>
				</div>
				<script src="js/jquery.magnifier.js"></script>
				<script>
					$(function () {
						$('#magnifier').magnifier();
					});
				</script>
				<div class="item-info__box">
					<div class="item-title">
						<div class="name ep2"><%=goods.getGoods_name() %></div>
						<div class="sale cr">优惠活动：该商品享受8折优惠</div>
					</div>
					<div class="item-price bgf5">
						<div class="price-box clearfix">
							<div class="price-panel pull-left">
								售价：<span class="price">￥<%=goods.getGoods_price() %><s class="fz16 c9">￥24.00</s></span>
							</div>
							<div class="vip-price-panel pull-right">
								会员等级价格 <i class="iconfont icon-down"></i>
								<ul class="all-price__box">
									<!-- 登陆后可见 -->
									<li><span class="text-justify">普通：</span>40.00元</li>
									<li><span class="text-justify">银牌：</span>38.00元</li>
									<li><span class="text-justify">超级：</span>28.00元</li>
									<li><span class="text-justify">V I P：</span>19.20元</li>
								</ul>
							</div>
							<script>
								// 会员价格折叠展开
								$(function () {
									$('.vip-price-panel').click(function() {
										if ($(this).hasClass('active')) {
											$('.all-price__box').stop().slideUp('normal',function() {
												$('.vip-price-panel').removeClass('active').find('.iconfont').removeClass('icon-up').addClass('icon-down');
											});
										} else {
											$(this).addClass('active').find('.iconfont').removeClass('icon-down').addClass('icon-up');
											$('.all-price__box').stop().slideDown('normal');
										}
									});
								});
							</script>
						</div>
						<div class="c6">普通会员限购 2 件，想要<u class="cr"><a href="">购买更多</a></u>？</div>
					</div>
					<ul class="item-ind-panel clearfix">
						<li class="item-ind-item">
							<span class="ind-label c9">累计销量</span>
							<span class="ind-count cr"><%=goods.getGoods_sale() %></span>
						</li>
						<li class="item-ind-item">
							<a href=""><span class="ind-label c9">累计评论</span>
							<span class="ind-count cr">1314</span></a>
						</li>
						<li class="item-ind-item">
							<a href=""><span class="ind-label c9">赠送积分</span>
							<span class="ind-count cg">666</span></a>
						</li>
					</ul>
					<div class="item-key">						
						<form action="">
							<div class="item-sku">
								<dl class="item-prop clearfix">
									<dt class="item-metatit">颜色：</dt>
									<dd><ul data-property="颜色" class="clearfix">
										<%
											int colorCheckId = 1;
											for(String color:goods.getGoods_color()){
												if(colorCheckId == 1){
										%>
													<li>
														<a href="javascript:;" role="button" class="check on" data-value="<%=color %>" aria-disabled="true" name="color">
														<span><%=color %></span>
														</a>
													</li>
										<%
												} else {
										%>
													<li>
														<a href="javascript:;" role="button" class="check" data-value="<%=color %>" aria-disabled="true" name="color">
															<span><%=color %></span>
														</a>
													</li>
										<%
												}
												colorCheckId ++;
											}
										%>
										<script>
											$(document).ready(function(){
												$('.check').click(function(){
													if($(this).hasClass("on")){
														console.log("have class")
														
													} else {
														
														$(this).addClass("on").parent().siblings().children().removeClass("on");												
													}
												})																				
											});
											
										</script>
									</ul></dd>
								</dl>
								<dl class="item-prop clearfix">
									<dt class="item-metatit">尺码：</dt>
									<dd><ul data-property="尺码" class="clearfix">
										<%
											int sizeCheckId = 1;
											for(String size:goods.getGoods_size()){
												if(sizeCheckId == 1){
										%>
													<li>
														<a href="javascript:;" role="button" class="check on" data-value="<%=size %>" aria-disabled="true" name="size">
														<span><%=size %></span>
														</a>
													</li>
										<%
												} else {
										%>
													<li>
														<a href="javascript:;" role="button"  class="check" data-value="<%=size %>" aria-disabled="true" name="size">
															<span><%=size %></span>
														</a>
													</li>
										<%
												}
												sizeCheckId ++;
											}
										%>
									</ul></dd>
								</dl>
							</div>
							<div class="item-amount clearfix bgf5">
								<div class="item-metatit">数量：</div>
								<div class="amount-box">
									<div class="amount-widget">
										<input class="amount-input" value="1" maxlength="8" title="请输入购买量" type="text" id="goodsNumber">
										<div class="amount-btn">
											<a class="amount-but add"></a>
											<a class="amount-but sub"></a>
										</div>
									</div>
									<div class="item-stock"><span style="margin-left: 10px;">库存 <b id="Stock"><%=goods.getGoods_stock() %></b> 件</span></div>
									<script>
										$(function () {
											$('.amount-input').onlyReg({reg: /[^0-9]/g});
											var stock = parseInt($('#Stock').html());
											$('.amount-widget').on('click','.amount-but',function() {											
												var num = parseInt($('.amount-input').val());
												if (!num) num = 0;
												if ($(this).hasClass('add')) {												
													if (num > stock - 1){													
														return DJMask.msg({														
															width:"300px",
															height:"100px",
															content:"您输入的数量超过库存上限"
														});
													}
													$('.amount-input').val(num + 1);
												} else if ($(this).hasClass('sub')) {
													if (num == 1){
														return DJMask.open({
															width:"300px",
															height:"100px",
															content:"您输入的数量有误"
														});
													}
													$('.amount-input').val(num - 1);
												}
											});
										});
									</script>
								</div>
							</div>
							<div class="item-action clearfix bgf5">
								<a href="javascript:;" rel="nofollow" data-addfastbuy="true" title="点击此按钮，到下一步确认购买信息。" role="button" class="item-action__buy">立即购买</a>
								<a href="javascript:;" rel="nofollow" data-addfastbuy="true" role="button" class="item-action__basket">
									<i class="iconfont icon-shopcart"></i> 加入购物车
								</a>
							</div>
						</form>
						<script>
							$(document).ready(function() {
								$(".item-action__basket").click(function(){
									<%	
										Users users = (Users)session.getAttribute("SESSION_USERS");
										if(users != null){
									%>
											var form = $(this).parents('form')
											var color = $(".on:first").attr("data-value")
											var size = $(".on:last").attr("data-value")
											var amount = $('.amount-input').val()
											$.ajax({
									            url: "<%=request.getContextPath() %>/AddCartServlet",			
									            type: "post",
									            data:{
									            	userid: <%=users.getUsers_id() %>,
									            	goodsid: <%=goods.getGoods_id() %>,
									            	color: color,
									            	size: size,
									            	amount: amount
									            },				
									            error:function(data){
									            	console.log("add cart data",data)
									            },
									            success:function(data){
									                console.log("add cart data",data)
									              
									            }
									        });
									<%
										} else {											
									%>			
											$(location).attr('href', 'login.jsp');
									<%
										}
									%>																					
								});								
							});
						</script>
					</div>
				</div>
			</div>
			<div class="pull-right picked-div">
				<div class="lace-title">
					<span class="c6">爆款推荐</span>
				</div>
				<div class="swiper-container picked-swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<%
								List<Goods> list = recommend.getHotGoods("");
								list = list.subList(0, 3);
								if (list != null) {
									for (Goods hotgoods : list) {
							%>										
										<a class="picked-item" href="<%=request.getContextPath() %>/GoodsDetailServlet?goods_id=<%=hotgoods.getGoods_id() %>">
											<img src="<%=hotgoods.getGoods_cover() %>" alt="<%=hotgoods.getGoods_name()%>" class="cover">
											<div class="look_price">¥<%=hotgoods.getGoods_price()%></div>
										</a>																		
							<%
									}
								}
							%>
						</div>
						<div class="swiper-slide">
							<%
								list = recommend.getHotGoods("");
								list = list.subList(3, 6);
								if (list != null) {
									for (Goods hotgoods : list) {
							%>										
										<a class="picked-item" href="<%=request.getContextPath() %>/GoodsDetailServlet?goods_id=<%=hotgoods.getGoods_id() %>">
											<img src="<%=hotgoods.getGoods_cover() %>" alt="<%=hotgoods.getGoods_name()%>" class="cover">
											<div class="look_price">¥<%=hotgoods.getGoods_price()%></div>
										</a>																
							<%
									}
								}
							%>
						</div>
						<div class="swiper-slide">
							<%
								list = recommend.getHotGoods("");
								list = list.subList(6, 8);
								if (list != null) {
									for (Goods hotgoods : list) {
							%>										
										<a class="picked-item" href="<%=request.getContextPath() %>/GoodsDetailServlet?goods_id=<%=hotgoods.getGoods_id() %>">
											<img src="<%=hotgoods.getGoods_cover() %>" alt="<%=hotgoods.getGoods_name()%>" class="cover">
											<div class="look_price">¥<%=hotgoods.getGoods_price()%></div>
										</a>																
							<%
									}
								}
							%>
						</div>
					</div>
				</div>
				<div class="picked-button-prev"></div>
				<div class="picked-button-next"></div>
				<script>
					$(document).ready(function(){ 
						// 顶部banner轮播
						var picked_swiper = new Swiper('.picked-swiper', {
							loop : true,
							direction: 'vertical',
							prevButton:'.picked-button-prev',
							nextButton:'.picked-button-next',
						});
					});
				</script>
			</div>
		</section>
		<section class="item-show__div item-show__body posr clearfix">
			<div class="item-nav-tabs">
				<ul class="nav-tabs nav-pills clearfix" role="tablist" id="item-tabs">
					<li role="presentation" class="active"><a href="#detail" role="tab" data-toggle="tab" aria-controls="detail" aria-expanded="true">商品详情</a></li>
					<li role="presentation"><a href="#evaluate" role="tab" data-toggle="tab" aria-controls="evaluate">累计评价 <span class="badge">1314</span></a></li>
					<li role="presentation"><a href="#service" role="tab" data-toggle="tab" aria-controls="service">售后服务</a></li>
				</ul>
			</div>
			<div class="pull-left">
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="detail" aria-labelledby="detail-tab">
						<div class="item-detail__info clearfix">
							<div class="record">商品编号：<%=goods.getGoods_identifier() %></div>
							<div class="record">上架时间：<%=goods.getGoods_listing() %></div>
							<div class="record">商品毛重：<%=goods.getGoods_weight() %>克</div>
							<div class="record">商品库存：<%=goods.getGoods_stock() %>件</div>
						</div>
						<div class="rich-text">
							<p style="text-align: center;">
								<i id="desc-module-1" style="font-size: 0"></i>
								<%
									for(String images : goods.getGoods_productImages()) {
								%>
										<img src="<%=images %>" alt=""><br>
								<%		
									}
								%>
								<i id="desc-module-2" style="font-size: 0"></i>
								<%
									for(String images : goods.getGoods_detailImages()) {
								%>
										<img src="<%=images %>" alt=""><br>
								<%		
									}
								%>
								<i id="desc-module-3" style="font-size: 0"></i>
								<%
									for(String images : goods.getGoods_sizeAndTyrImages()) {
								%>
										<img src="<%=images %>" alt=""><br>
								<%		
									}
								%>
								<i id="desc-module-4" style="font-size: 0"></i>
								<%
									for(String images : goods.getGoods_modelImages()) {
								%>
										<img src="<%=images %>" alt=""><br>
								<%		
									}
								%>
								<i id="desc-module-5" style="font-size: 0"></i>
								<%
									for(String images : goods.getGoods_questionImages()) {
										
										if(images != goods.getGoods_questionImages()[goods.getGoods_questionImages().length - 1]){
								%>
											<img src="<%=images %>" alt=""><br>
								<%
										} else {
								%>
											<img src= "<%=images %>" width="790" alt="">
								<%
										}
									}
								%>			
								
							</p>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="evaluate" aria-labelledby="evaluate-tab">
						<div class="evaluate-tabs bgf5">
							<ul class="nav-tabs nav-pills clearfix" role="tablist">
								<li role="presentation" class="active"><a href="#all" role="tab" data-toggle="tab" aria-controls="all" aria-expanded="true">全部评价 <span class="badge">1314</span></a></li>
								<li role="presentation"><a href="#good" role="tab" data-toggle="tab" aria-controls="good">好评 <span class="badge">1000</span></a></li>
								<li role="presentation"><a href="#normal" role="tab" data-toggle="tab" aria-controls="normal">中评 <span class="badge">314</span></a></li>
								<li role="presentation"><a href="#bad" role="tab" data-toggle="tab" aria-controls="bad">差评 <span class="badge">0</span></a></li>
							</ul>
						</div>
						<div class="evaluate-content">
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="all" aria-labelledby="all-tab">

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<!-- 分页 -->
									<div class="page text-center clearfix">
										<a class="disabled">上一页</a>
										<a class="select">1</a>
										<a href="">2</a>
										<a href="">3</a>
										<a href="">4</a>
										<a href="">5</a>
										<a href="">6</a>
										<a href="">7</a>
										<a href="">8</a>
										<a class="" href="">下一页</a>
										<a class="disabled">1/60页</a>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="good" aria-labelledby="good-tab">
									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>
									
									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<!-- 分页 -->
									<div class="page text-center clearfix">
										<a class="disabled">上一页</a>
										<a class="select">1</a>
										<a href="">2</a>
										<a href="">3</a>
										<a href="">4</a>
										<a href="">5</a>
										<a href="">6</a>
										<a href="">7</a>
										<a href="">8</a>
										<a class="" href="">下一页</a>
										<a class="disabled">1/20页</a>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="normal" aria-labelledby="normal-tab">
									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>
									
									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>


									<!-- 分页 -->
									<div class="page text-center clearfix">
										<a class="disabled">上一页</a>
										<a class="select">1</a>
										<a href="">2</a>
										<a href="">3</a>
										<a href="">4</a>
										<a href="">5</a>
										<a class="" href="">下一页</a>
										<a class="disabled">1/5页</a>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="bad" aria-labelledby="bad-tab">

									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>
									
									<div class="eval-box">
										<div class="eval-author">
											<div class="port">
												<img src="images/icons/default_avt.png" alt="欢迎来到U袋网" class="cover b-r50">
											</div>
											<div class="name">高***恒</div>
										</div>
										<div class="eval-content">
											<div class="eval-text">
												真是特别美_回头穿了晒图
											</div>
											<div class="eval-imgs">
												<div class="img-temp"><img src="images/temp/S-001-1_s.jpg" data-src="images/temp/S-001-1_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-2_s.jpg" data-src="images/temp/S-001-2_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-3_s.jpg" data-src="images/temp/S-001-3_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-4_s.jpg" data-src="images/temp/S-001-4_b.jpg" data-action="zoom" class="cover"></div>
												<div class="img-temp"><img src="images/temp/S-001-5_s.jpg" data-src="images/temp/S-001-5_b.jpg" data-action="zoom" class="cover"></div>
											</div>
											<div class="eval-time">
												2017年08月11日 20:31 颜色分类：深棕色 尺码：均码
											</div>
										</div>
									</div>
									<!-- 分页 -->
									<div class="page text-center clearfix">
									</div>
								</div>
							</div>
							<script src="js/jquery.zoom.js"></script>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="service" aria-labelledby="service-tab">
						<!-- 富文本 -->
						<div class="service-content rich-text">
							<img title="" alt="" src="http://img.aocmonitor.com.cn/image/2014-06/86575417.gif" width="240" height="160" border="0" align="left"><p>承蒙惠购 AOC 产品，谨致谢意！为了让您更好地使用本产品，武汉艾德蒙科技股份有限公司通过该产品随机附带的保修证向您做出下述维修服务承诺，并按照该服务的承诺向您提供维修服务。</p><p>这些服务承诺仅适用于2016年6月1日（含）之后销售的AOC品牌显示器标准品。</p><p>如果您选择购买了 AOC 显示器扩展功能模块或其它厂家电脑主机，其保修承诺请参见相应产品的保修卡。</p><p>所有承诺内容以产品附件的保修卡为准。</p><p><br></p><h3>一、全国联保</h3><p style="text-indent:2em">AOC 显示器实施全国范围联保，国家标准三包服务。无论您是在中国大陆 ( 不含香港、澳门、台湾地区) 何处购买并在大陆地区使用的显示器，出现三包范围内的故障时，可凭显示器的保修证正本和购机发票到 AOC 显示器维修网点或授权网点进行维修同时，也欢迎您关注官方微信服务号“AOC用户俱乐部”(微信号：aocdisplay)进行查询。</p><div style="text-align:center"><img src="http://img.aocmonitor.com.cn/image/2017-05/89154415.jpg" alt=""></div><p><br></p><p>三包服务如下：</p><ol><li>商品自售出之日起 7 日内，出现《微型计算机商品性能故障表》中所列故障时，消费者可选择退货、换货或修理。</li><li>商品自售出之日起 15 日内，出现《微型计算机商品性能故障表》中所列故障时，消费者可选择换货或修理。</li><li>商品自售出之日起 1 年内，出现《微型计算机商品性能故障表》中所列故障时，消费者可选择修理。</li></ol><p>以下情况不在三包范围内：</p><ol><li>超过三包有效期。</li><li>无有效的三包凭证及发票。</li><li>发票上内容与商品实物标识不符或者涂改的。</li><li>未按产品使用说明书要求使用、维护、保养而造成损坏的（人为损坏）。</li><li>非 AOC 授权的修理者拆动造成损坏的（私自拆修）。</li><li>非 AOC 在中国大陆（不含香港、澳门、台湾地区）销售的商品。</li></ol><h3>二、显示器专享服务</h3><p><strong>1、LUVIA视界头等舱，VIP专享服务</strong></p><p style="text-indent:2em">AOC针对各省市地区采取指定商品销售，消费者购买指定销往该区域的LUVIA卢瓦尔显示器标准品，从发票开具之日起1年内，注册成为官方微信服务号“AOC用户俱乐部”(微信号：aocdisplay)产品会员，即可在当地享“LUVIA视界头等舱，VIP专享服务”。</p><div style="text-align:center"><img src="http://img.aocmonitor.com.cn/image/2017-05/25352146.jpg" alt=""></div><p><br></p><p style="text-indent:2em">* 如客户未在发票开具之日起1年内注册AOC微信会员，则只享受国家三包服务。</p><p style="text-indent:2em">注册会员方式：1、关注“AOC用户俱乐部”微信公众号。2、点击“会员”→“注册会员”。3、填写个人真实信息并注册产品信息，即可成为AOC产品会员。</p><p style="text-indent:2em"><strong>3年免费上门更换</strong>：从发票开具之日起3年内，产品若发生《微型计算机商品性能故障表》所列性能故障，可免费更换不低于同型号同规格产品。（服务网点无法覆盖区域，全国区域免费邮寄，双向运费由AOC负担）</p><p style="text-indent:2em"><strong>一键快捷掌上服务：</strong>从注册成为“AOC用户俱乐部”会员之日起，可享在线贴身技术顾问有问必答、售后服务在线预约、服务网点在线查询等一键快捷掌上服务。（人工客服咨询在线时间：8:00-22:00）</p><p style="text-indent:2em"><strong>增值豪礼尊享服务：</strong>可参加“AOC用户俱乐部”有奖互动赢取豪礼。</p><p>注：<br>(1)如不能及时提供购机发票或发票记载不清、涂改、商品实物标示和发票内容不符，将以您上传“AOC用户俱乐部”的发票信息为准计算保修时间；如果发票信息并未上传，将以该显示器制造日期(制造日期见显示器后壳条形码标签)加一个月为准计算保修时间。<br>(2)非“AOC用户俱乐部”产品会员，不享受“LUVIA视界头等舱，VIP专享服务”。</p>
						</div>
					</div>
			    </div>
				<div class="recommends">
					<div class="lace-title type-2">
						<span class="cr">爆款推荐</span>
					</div>
					<div class="swiper-container recommends-swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<%
									list = recommend.getHotGoods("");
									list = list.subList(0, 4);
									if (list != null) {
										for (Goods hotgoods : list) {
								%>										
											<a class="picked-item" href="<%=request.getContextPath() %>/GoodsDetailServlet?goods_id=<%=hotgoods.getGoods_id() %>">
												<img src="<%=hotgoods.getGoods_cover() %>" alt="<%=hotgoods.getGoods_name()%>" class="cover">
												<div class="look_price">¥<%=hotgoods.getGoods_price()%></div>
											</a>																
								<%
										}
									}
								%>
							</div>
							<div class="swiper-slide">
								<%
									list = recommend.getHotGoods("");
									list = list.subList(4, 8);
									if (list != null) {
										for (Goods hotgoods : list) {
								%>										
											<a class="picked-item" href="<%=request.getContextPath() %>/GoodsDetailServlet?goods_id=<%=hotgoods.getGoods_id() %>">
												<img src="<%=hotgoods.getGoods_cover() %>" alt="<%=hotgoods.getGoods_name()%>" class="cover">
												<div class="look_price">¥<%=hotgoods.getGoods_price()%></div>
											</a>																
								<%
										}
									}
								%>
							</div>
						</div>
					</div>
					<script>
						$(document).ready(function(){
							var recommends = new Swiper('.recommends-swiper', {
								spaceBetween : 40,
								autoplay : 5000,
							});
						});
					</script>
				</div>
			</div>
			<div class="pull-right">
				<div class="tab-content" id="descCate">
					<div role="tabpanel" class="tab-pane fade in active" id="detail-tab" aria-labelledby="detail-tab">
						<div class="descCate-content bgf5">
							<dd class="dc-idsItem selected">
								<a href="#desc-module-1"><i class="iconfont icon-dot"></i> 产品图</a>
							</dd>
							<dd class="dc-idsItem">
								<a href="#desc-module-2"><i class="iconfont icon-selected"></i> 细节图</a>
							</dd>
							<dd class="dc-idsItem">
								<a href="#desc-module-3"><i class="iconfont"></i> 尺寸及试穿</a>
							</dd>
							<dd class="dc-idsItem">
								<a href="#desc-module-4"><i class="iconfont"></i> 模特效果图</a>
							</dd>
							<dd class="dc-idsItem">
								<a href="#desc-module-5"><i class="iconfont"></i> 常见问题</a>
							</dd>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="evaluate-tab" aria-labelledby="evaluate-tab">
						<div class="descCate-content posr bgf5">
							<div class="lace-title">
								<span class="c6">相关推荐</span>
							</div>
							<div class="picked-box">
								<a class="picked-item" href="">
									<img src="images/temp/S-001-1_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
								<a class="picked-item" href="">
									<img src="images/temp/S-001-2_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
								<a class="picked-item" href="">
									<img src="images/temp/S-001-3_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
								<a class="picked-item" href="">
									<img src="images/temp/S-001-4_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
								<a class="picked-item" href="">
									<img src="images/temp/S-001-5_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="service-tab" aria-labelledby="service-tab">
						<div class="descCate-content posr bgf5">
							<div class="lace-title">
								<span class="c6">最近浏览</span>
							</div>
							<div class="picked-box">
								<a class="picked-item" href="">
									<img src="images/temp/S-001-1_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
								<a class="picked-item" href="">
									<img src="images/temp/S-001-2_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
								<a class="picked-item" href="">
									<img src="images/temp/S-001-3_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
								<a class="picked-item" href="">
									<img src="images/temp/S-001-4_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
								<a class="picked-item" href="">
									<img src="images/temp/S-001-5_s.jpg" class="cover">
									<div class="look_price">¥134.99</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				$(document).ready(function(){
					$('#descCate').smartFloat(0);
					$('.dc-idsItem').click(function() {
						$(this).addClass('selected').siblings().removeClass('selected');
					});
					$('#item-tabs a[data-toggle="tab"]').on('show.bs.tab', function (e) {
						$('#descCate #' + $(e.target).attr('aria-controls') + '-tab')
						.addClass('in').addClass('active').siblings()
						.removeClass('in').removeClass('active');
					});
				});
			</script>
		</section>
	</div>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="udai_welcome.html" class="r-item-hd">
					<i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_shopcart.html" class="r-item-hd">
					<i class="iconfont icon-cart"></i>
					<div class="r-tip__box"><span class="r-tip-text" id="shopCart">购物车</span></div>
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
					<img src="images/icons/footer_1.gif" alt="厂家直供">
				</div>
				<div class="tag-div">
					<img src="images/icons/footer_2.gif" alt="一件代发">
				</div>
				<div class="tag-div">
					<img src="images/icons/footer_3.gif" alt="美工活动支持">
				</div>
				<div class="tag-div">
					<img src="images/icons/footer_4.gif" alt="信誉认证">
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