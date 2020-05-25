<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.edu.imnu.mishop.bean.Goods"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<html lang="zh-cmn-Hans">
<jsp:useBean id="pagination"
	class="cn.edu.imnu.mishop.PageBean.GoodsPageBean" scope="request">
</jsp:useBean>
<jsp:useBean id="recommend"
	class="cn.edu.imnu.mishop.dao.GoodsDAO" scope="request">
</jsp:useBean>
<jsp:setProperty property="pageSize" value="16" name="pagination" />
<jsp:setProperty property="pageNo" param="pageNo" name="pagination" />
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
	<div class="content inner">
		<section class="filter-section clearfix">
			<ol class="breadcrumb">
				<li><a href="index.jsp">首页</a></li>
				<li class="active">商品筛选</li>
			</ol>
			<div class="filter-box">
				<div class="all-filter">
					<div class="filter-value">
						<div class="filter-title">选择商品分类 <i class="iconfont icon-down"></i></div>
						<!-- 全部大分类 -->
						<ul class="catelist-card">
							<a href=""><li class="active">全部分类</li></a>
							<a href=""><li>女装</li></a>
							<a href=""><li>男装</li></a>
							<a href=""><li>包包</li></a>
							<a href=""><li>童装</li></a>
							<a href=""><li>鞋靴</li></a>
						</ul>
						<!-- 已选选项 -->
						<div class="ul_filter">
							<span class="pull-left">
								颜色：红色 <a href="javascript:;" class="close">&times;</a>
							</span>
							<span class="pull-left">
								尺寸：XXL <a href="javascript:;" class="close">&times;</a>
							</span>
						</div>
						<a class="reset pull-right" href="item_category.html">重置</a>
					</div>
				</div>
				<div class="filter-prop-item">
					<span class="filter-prop-title">分类：</span>
					<ul class="clearfix">
						<a href=""><li class="active">全部</li></a>
						<a href=""><li>上装</li></a>
						<a href=""><li>下装</li></a>
						<a href=""><li>裙装</li></a>
						<a href=""><li>内衣</li></a>
					</ul>
				</div>
				<div class="filter-prop-item">
					<span class="filter-prop-title">颜色：</span>
					<ul class="clearfix">
						<a href=""><li class="active">全部</li></a>
						<a href=""><li>红色</li></a>
						<a href=""><li>粉红</li></a>
						<a href=""><li>蓝色</li></a>
						<a href=""><li>白色</li></a>
					</ul>
				</div>
				<div class="filter-prop-item">
					<span class="filter-prop-title">尺寸：</span>
					<ul class="clearfix">
						<a href=""><li class="active">全部</li></a>
						<a href=""><li>L</li></a>
						<a href=""><li>M</li></a>
						<a href=""><li>S</li></a>
						<a href=""><li>X</li></a>
						<a href=""><li>XL</li></a>
						<a href=""><li>XXL</li></a>
						<a href=""><li>XXXL</li></a>
					</ul>
				</div>
				<div class="filter-prop-item">
					<span class="filter-prop-title">价格：</span>
					<ul class="clearfix">
						<a href=""><li class="active">全部</li></a>
						<a href=""><li>0-20</li></a>
						<a href=""><li>20-40</li></a>
						<a href=""><li>40-80</li></a>
						<a href=""><li>80-100</li></a>
						<a href=""><li>100-150</li></a>
						<a href=""><li>150以上</li></a>
						<form class="price-order">
							<input type="text">
							<span class="cc">-</span>
							<input type="text">
							<input type="button" value="确定">
						</form>
					</ul>
				</div>
			</div>
			<div class="sort-box bgf5">
				<div class="sort-text">排序：</div>
				<a href=""><div class="sort-text">销量 <i class="iconfont icon-sortDown"></i></div></a>
				<a href=""><div class="sort-text">评价 <i class="iconfont icon-sortUp"></i></div></a>
				<a href=""><div class="sort-text">价格 <i class="iconfont"></i></div></a>
				<div class="sort-total pull-right">共<%=pagination.getTotalGoods() %>个商品</div>
			</div>
		</section>
		<section class="item-show__div clearfix">
			<div class="pull-left">
				<div class="item-list__area clearfix">
					<%
						List<Goods> list = pagination.getPageDate();
						if (list != null) {
							for (Goods goods : list) {
					%>
					<div class="item-card">
						<a href="<%=request.getContextPath()%>/GoodsDetailServlet?goods_id=<%=goods.getGoods_id()%>" class="photo">
							<img src=<%=goods.getGoods_cover()%> alt=<%=goods.getGoods_name()%> class="cover">
							<div class="name"><%=goods.getGoods_name()%></div>
						</a>
						<div class="middle">
							<div class="price"><small>￥</small><%=goods.getGoods_price()%></div>
							<div class="sale"><a href="">加入购物车</a></div>
						</div>
						<div class="buttom">
							<div>销量 <b><%=goods.getGoods_sale() %></b></div>
							<div>人气 <b>888</b></div>
							<div>评论 <b>1688</b></div>
						</div>
					</div>
					<%
							}
						}
					%>
				</div>
			
				<!-- 分页 -->
			<div class="page text-right clearfix">
				<%
					if (pagination.isHasPreviousPage()) {
				%>
					<a class="disabled" href="item_category.jsp?pageNo=<%=pagination.getPageNo() - 1%>">上一页</a>
				<%
					}								
					int viewedIndex = 7;					
					int firstIndex = (pagination.getPageNo()<=viewedIndex/2+1?1:(pagination.getPageNo()-viewedIndex/2));
    				int lastIndex = (firstIndex+viewedIndex-1>=pagination.getTotalPages()?pagination.getTotalPages():firstIndex+viewedIndex-1);
    				if(lastIndex>=pagination.getTotalPages())
    					firstIndex = lastIndex - viewedIndex+1;
    				if(firstIndex < 1){
    					firstIndex = 1;
    				}
					for(int i = firstIndex; i <= lastIndex; i++){
						if(i == pagination.getPageNo()){
				%>
							<a class="select"><%=i %></a>
				<%
						} else {
				%>			<a href="item_category.jsp?pageNo=<%=i %>"><%=i %></a>
				<%
						}
					}
					if (pagination.isHasNextPage()) {
				%>
						<a class="" href="item_category.jsp?pageNo=<%=pagination.getPageNo() + 1%>">下一页</a>
				<%
					}
				%>
				<a class="disabled"><jsp:getProperty property="pageNo" name="pagination" />/<jsp:getProperty
				property="totalPages" name="pagination" />页</a>
				<div class="page-order">
						到第
						<input type="text" name="page" oninput = "value=value.replace(/[^\d]/g,'')">
						页
						<input class="sub" type="button" value="确定">
				</div>
			</div>
		</div>
			<script type="text/javascript">
				$('.sub').click(function(){
					var page = $('input[name="page"]').val();
					if(page != 0 && page <= <%=pagination.getTotalPages()%>){
						window.location.href = "item_category.jsp?pageNo=" + page;
					}
				});				
			</script>
			<div class="pull-right">
				<div class="desc-segments__content">
					<div class="lace-title">
						<span class="c6">爆款推荐</span>
					</div>
					<div class="picked-box">
						<%
							list = recommend.getHotGoods("");
							if (list != null) {
								for (Goods goods : list) {
						%>
									<a href="<%=request.getContextPath() %>/GoodsDetailServlet?goods_id=<%=goods.getGoods_id() %>" class="picked-item">
										<img src="<%=goods.getGoods_cover() %>" alt="<%=goods.getGoods_name()%>" class="cover">
											<span class="look_price">¥<%=goods.getGoods_price()%></span>
									</a>
						<%
								}
							}
						%>					
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- 右侧菜单 -->
	<div class="right-nav">
		<ul class="r-with-gotop">
			<li class="r-toolbar-item">
				<a href="udai_welcome.jsp" class="r-item-hd">
					<i class="iconfont icon-user" data-badge="0"></i>
					<div class="r-tip__box"><span class="r-tip-text">用户中心</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_shopcart.jsp" class="r-item-hd">
					<i class="iconfont icon-cart"></i>
					<div class="r-tip__box"><span class="r-tip-text">购物车</span></div>
				</a>
			</li>
			<li class="r-toolbar-item">
				<a href="udai_collection.jsp" class="r-item-hd">
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