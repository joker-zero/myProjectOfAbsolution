<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>登录</title>
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/demo.css">

	<!--必要样式-->
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/component.css">
	<!--[if IE]>
	<script src="js/html5.js"></script>
	<![endif]-->
	
</head>
  
  <body>
    <div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header" style="height: 975px;">
				<canvas id="demo-canvas" style="width:100% ;height:100%"></canvas>
				<div class="logo_box">
					<h3>WelCome</h3>
					<form action="${pageContext.request.contextPath}/user/login" method="post" style="margin-bottom:0;">
						<div class="input_outer">
							<span class="u_user"></span>
							<input name="userId" id="userId" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入学号" value="${userId}" />
						</div>
						
						<div class="input_outer">
							<span class="us_uer"></span>
							<input name="passWord" id="passWord" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" value="" type="password" placeholder="请输入密码" value="${passWord}" />
						</div>
						
						<font color="red">${errorMsg1}</font>
						<font color="red">${errorMsg2}</font>
						<div style="text-align:center;"></div>
						<div style="float:left;">
							<input class="act-but submit" id="loginBtn" width="50px" style="padding: 0.5em 2.5em;color: #FFFFFF" value="Login" type="submit" >						
						</div>

					</form>
					<div style="float:right;">
						<form action="" >
							<input class="act-but submit" width="50px" style="padding: 0.5em 1.95em;color: #FFFFFF" type="button" value = "Register" onclick = "window.location.href = '${pageContext.request.contextPath}/registe.jsp'">
						</form>
					</div>

				</div>
			</div>
		</div>
	</div><!-- /container -->
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/TweenLite.min.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/EasePack.min.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/rAF.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/demo-1.js"></script>
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>