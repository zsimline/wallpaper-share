<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>壁纸上传</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/share.css">
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function changepic() {
		 	var reads = new FileReader();
		 	f = $('#inputfile')[0].files[0];
		 	reads.readAsDataURL(f);
		 	reads.onload = function(e) {
		 		$('#preview')[0].src = this.result;
		 };
		}
		
		function submitFile(){
		 	var wname = document.getElementById("name").value;
		 	var wfile = document.getElementById("inputfile").files[0];
		 	var wlabel = document.getElementById("labels").value;
		 	
		 	var odata = new FormData();
		 	odata.append("wname",wname);
		 	odata.append("wlabel",wlabel);
		 	odata.append("wfile",wfile);
		 	
			var req = new XMLHttpRequest();	
		  	req.open("POST", "Upload.do",false);
		 	req.onload = function(oEvent) {
		    	if (req.status == 200){
		    		document.getElementById("infocon").innerHTML = "<font color='green'><b>上传成功</b></font>";		
		    		$('#myModal').modal();
		    	}
		    	else if(req.status == 501){
		    		document.getElementById("infocon").innerHTML = "<font color='red'><b>请登录后再上传</b></font>";
		    		$('#myModal').modal();
		    	}
		    	else{
		    		document.getElementById("infocon").innerHTML = "<font color='red'><b>上传失败</b></font>";
		    		$('#myModal').modal();
		    	}
		  	};
		  req.send(odata);
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
                	<li><a href="/esclass/">最新</a></li>
                 	<li class="active"><a href="upload.jsp">上传</a></li>
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
	
	<!-- 上传控件  -->
	<div class="container">
	  <form role="form" id="uform">
		<div class="form-group">
			<label for="name">名称</label>
			<input type="text" class="form-control" required id="name" placeholder="为您的壁纸起个名字吧">
		</div>
		<div class="form-group">
			<label for="inputfile">选择您要上传的壁纸</label>
			<input type="file" id="inputfile" required onchange="changepic(this)">
		</div>
		<div class="form-group">
			<label for="labels">为壁纸添加一个标签</label>
			<select id="labels">
				<option value="风景">风景</option>
				<option value="游戏">游戏</option>
				<option value="动漫">动漫</option>
			</select>
		</div>
		<button type="button" class="btn btn-default" onclick="submitFile()">上传</button>
		<div style="margin-top:15px;">
	  		<img alt="" src="" id="preview">
	  	</div>
	  </form>
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
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload()">关闭</button>
				</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->   
</body>
</html>