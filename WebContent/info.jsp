<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                    <a class="navbar-brand" href="#">阡陌桌面</a>
                </div>
                <ul class="nav navbar-nav">
                	<li><a href="/esclass/">首页</a></li>
                 	<li><a href="upload.jsp">上传</a></li>
                    <li class="dropdown">
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
	   <ul class="breadcrumb">
    		<li><a href="/esclass/">首页</a></li>
    		<li><a href="type.jsp?l=${ wallpaper.wlabel }&p=0">${ wallpaper.wlabel }壁纸</a></li>
    		<li class="active">${ wallpaper.wname }</li>
	   </ul>
	
		<div id="shows">
			<img src="${ wallpaper.stpath }">
		</div>		
		<div class="panel panel-default">
    		<div class="panel-heading">
        		<h3 class="panel-title">信息</h3>
    		</div>
    		<div class="panel-body">
        		<span>标签：</span><label>${ wallpaper.wlabel }</label>
        		<span>作者：</span><label>${ wallpaper.author }</label>
        		<span>名字：</span><label>${ wallpaper.wname }</label>
        		<a href="${ wallpaper.stpath }" class="btn pull-right" download>下载这张图片</a>
    		</div>
		</div>
	</div>
	    
    <!-- 尾部 -->
    <footer>
    	JavaWeb测试项目 - 桌面壁纸分享网站 ～ ©2019 By Mxsyx
    </footer>
</body>
