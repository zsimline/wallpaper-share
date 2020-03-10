<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.modobj.Wallpaper" %>
<%@ page import="com.modobj.User" %>
<%@ page import="java.util.ArrayList" %>
<%
	String p = request.getParameter("p");
	String u = User.getIdByCookie(request);
	
	if(u=="")
		response.getWriter().write("<script type=\"text/javascript\">alert('请先登录！');window.location.href='login.jsp'</script>");
	if(p==null) p = "0";
	ArrayList<Wallpaper> objlist =  Wallpaper.displayByUser(u,Integer.parseInt(p));
	Wallpaper wallpaper = null;
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
	<script type="text/javascript">
		function sendUpdate(arg){
			var panel = document.getElementById(arg);
			var wid = panel.getElementsByClassName('panel-body')[0].getAttribute('data-id');
		 	var wname = panel.getElementsByTagName('input')[0].value;
		 	var wlabel = panel.getElementsByTagName('select')[0].value;
		 	var post_content = "wid=" + wid + "&wname=" + wname + "&wlabel=" + wlabel;
	 	
			var req = new XMLHttpRequest();	
		  	req.open("POST", "Update.do",false);
		  	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		 	req.onload = function(oEvent) {
		    	if (req.status == 200){
		    		document.getElementById("infocon").innerHTML = "<font color='green'><b>修改成功</b></font>";		
		    		$('#myModal').modal();
		    	}
		    	else{
		    		document.getElementById("infocon").innerHTML = "<font color='red'><b>修改失败</b></font>";
		    		$('#myModal').modal();
		    	}
		  	};
		    req.send(post_content);
		}
		
		function verify(arg){
			var res = window.confirm("重要提示：确认删除吗？此操作不可逆");
			if (res)
				sendDelete(arg);
			else ;
		}
		
		function sendDelete(arg){
			var panel = document.getElementById(arg);
			var wid = panel.getElementsByClassName('panel-body')[0].getAttribute('data-id');
		 	var post_content = "wid=" + wid;
	 	
			var req = new XMLHttpRequest();	
		  	req.open("POST", "Undercarriage.do",false);
		  	req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		 	req.onload = function(oEvent) {
		    	if (req.status == 200){
		    		console.log("csacasc");
		    		document.getElementById("infocon").innerHTML = "<font color='green'><b>删除成功</b></font>";		
		    		$('#myModal').modal();
		    	}
		    	else{
		    		document.getElementById("infocon").innerHTML = "<font color='red'><b>删除失败</b></font>";
		    		$('#myModal').modal();
		    	}
		  	};
		    req.send(post_content);
		}
	</script>
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
                	<li class="active"><a href="/esclass/">首页</a></li>
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
    	<% for(int i=0;i<objlist.size();i++){ wallpaper = objlist.get(i); %>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapse-<%=i %>">ID:<%=wallpaper.getWid() %>（点我展开）</a>
                </h4>
            </div>
            <div id="collapse-<%=i %>" class="collapse">
                <div class="panel-body" data-id="<%=wallpaper.getWid() %>">
	  			  <form role="form" id="uform">
	  			  	<div class="form-group">
						<label for="wname">修改壁纸名称</label>
						<input type="text" class="form-control" required id="wname" value="<%=wallpaper.getWname() %>">
					</div>
					<div class="form-group">
						<label for="labels">修改壁纸标签：<%=wallpaper.getWlabel()%>&nbsp;&nbsp;&nbsp;</label>
						<select id="labels">
							<option value="风景">风景</option>
							<option value="游戏">游戏</option>
							<option value="动漫">动漫</option>
						</select>
					</div>
					<button type="button" class="btn btn-default" onclick="sendUpdate('collapse-<%=i %>')">修改</button>
					<button type="button" class="btn btn-default pull-right" onclick="verify('collapse-<%=i %>')">删除这张壁纸</button>
					<div style="margin-top:15px;">
	  					<img alt="" src="<%=wallpaper.getStpath() %>" id="preview">
	  				</div>
	  			  </form>
            	</div>
            </div>
        </div>
        <% } %>
    </div>
	
    <!-- 分页  -->
   	<div class="container">
	    <nav aria-label="Page navigation">
			<ul class="pagination pagination-lg">
    			<li class="active"><a href="home.jsp?p=0">1</a></li>
    			<li><a href="home.jsp?p=1">2</a></li>
    			<li><a href="home.jsp?p=2">3</a></li>
	    		<li><a href="home.jsp?p=3">4</a></li>
    			<li><a href="home.jsp?p=4">5</a></li>
    			<li><a href="home.jsp?p=5">6</a></li>
    			<li><a href="home.jsp?p=6">7</a></li>
    			<li><a href="home.jsp?p=7">8</a></li>
	    		<li><a href="home.jsp?p=8">9</a></li>
    			<li><a href="home.jsp?p=9">10</a></li>
    			<li><a href="#">上一页</a></li>
    			<li><a href="#">下一页</a></li>
  			</ul>
		</nav>
    </div> 
	
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body" id="infocon"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">关闭</button>
				</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->	
	    
    <!-- 尾部 -->
    <footer>
    	JavaWeb测试项目 - 桌面壁纸分享网站 ～ ©2019 By Mxsyx
    </footer>
</body>
</html>