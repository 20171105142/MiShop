<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html><head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">


<title>404错误页面</title>
<link href="<%=request.getContextPath() %>/css/404/pintuer.css" rel="stylesheet">
</head>

<body>
<div class="container" style=" margin-top:8%;"> 
   <div class="panel margin-big-top">
      <div class="text-center">
         <br>
         <h2 class="padding-top"> <stong>404错误！抱歉您要找的页面不存在</stong> </h2>
         <div class=""> 
            <div class="float-left">
                <img src="<%=request.getContextPath() %>/images/404/ds-1.gif">
                <div class="alert"> 卧槽！页面不见了！ </div>
            </div>
            <div class="float-right">
               <img src="<%=request.getContextPath() %>/images/404/ds-2.png" width="260"> 
            </div>
          </div>
          <div class="padding-big">
               <a href="<%=request.getContextPath() %>/index.jsp" class="button bg-yellow">返回首页</a>
               <a href="https://404.life/" class="button">保证不打死管理员</a>
          </div> 
      </div> 
   </div> 
</div>
</body></html>