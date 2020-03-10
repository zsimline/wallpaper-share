<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.modobj.Wallpaper" %>
<%@ page import="java.util.ArrayList" %>
<%
	String l = request.getParameter("l"); 
	String p = request.getParameter("p");
	if(l==null) l = "风景";
	if(p==null) p = "0";
	ArrayList<Wallpaper> objlist =  Wallpaper.displayByLabel(l,Integer.parseInt(p));
%>


<!DOCTYPE HTML>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/share.css">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>

<body>
	<!-- 头部  -->
    <div class="container-fluid">
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/esclass/">阡陌桌面</a>
                </div>
                <ul class="nav navbar-nav">
                	<li><a href="/esclass/">首页</a></li>
                 	<li><a href="upload.jsp">上传</a></li>
                    <li class="dropdown" class="active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                         	分类<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="type.jsp?l=风景&p=0">风景</a></li>
                            <li><a href="type.jsp?l=游戏&p=0">游戏</a></li>
                            <li><a href="type.jsp?l=动漫&p=0">动漫</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
        			<div class="form-group">
            			<input type="text" class="form-control" placeholder="Search">
        			</div>
        			<button type="submit" class="btn btn-default">提交</button>
    			</form>
    			<ul class="nav navbar-nav navbar-right"> 
            		<li><a href="home.jsp"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li> 
            		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录/注册</a></li> 
        		</ul> 
            </div>
        </nav>
    </div>
    
    <!-- 展示 -->
    <div class="container">
    	<hr>
    	<div class="row">
    	<% for(Wallpaper wallpaper:objlist){ %>
 			<div class="col-md-4">
 				<a href="<%="info.jsp?wid=" + wallpaper.getWid() %>" title="<%=wallpaper.getWname() %>">
 					<img src="<%=wallpaper.getStpath() %>">
 					<p class="ffu"><%=wallpaper.getWname() %></p>
 				</a>
 			</div>
 		<%} %>
 		</div>
    	<hr>
    </div>
    
    <!-- 分页  -->
   	<div class="container">
	    <nav aria-label="Page navigation">
			<ul class="pagination pagination-lg">
    			<li class="active"><a href="type.jsp?l=<%=l %>&p=0">1</a></li>
    			<li><a href="type.jsp?l=<%=l %>&p=1">2</a></li>
    			<li><a href="type.jsp?l=<%=l %>&p=2">3</a></li>
	    		<li><a href="type.jsp?l=<%=l %>&p=3">4</a></li>
    			<li><a href="type.jsp?l=<%=l %>&p=4">5</a></li>
    			<li><a href="type.jsp?l=<%=l %>&p=5">6</a></li>
    			<li><a href="type.jsp?l=<%=l %>&p=6">7</a></li>
    			<li><a href="type.jsp?l=<%=l %>&p=7">8</a></li>
	    		<li><a href="type.jsp?l=<%=l %>&p=8">9</a></li>
    			<li><a href="type.jsp?l=<%=l %>&p=9">10</a></li>
    			<li><a href="#">上一页</a></li>
    			<li><a href="#">下一页</a></li>
  			</ul>
		</nav>
    </div> 
    
    <!-- 尾部 -->
    <footer>
    	JavaWeb测试项目 - 桌面壁纸分享网站 ～ ©2019 By Mxsyx
    </footer>
</body>
</html>