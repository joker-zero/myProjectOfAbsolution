<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/demo.css">
	<!--必要样式-->
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/component.css">
	<!--[if IE]>
	<script src="js/html5.js"></script>
	<![endif]-->
	<style>
		.tip{
			width: 450px;
		    height: 400px;
		    position: absolute;
		    left: 380px;

		}
		p{
			margin-bottom:53px;
			margin-top:10px;
		}
		#userIdTip{
			position: absolute;
		    left: 0;
		    top:00px;
			color: red;
		    font-size: 19px;
		    font-weight: bold;
		    font-family: "隶书";
		    opacity: 0.9;
		}
		#userIdExitTip{
			position: absolute;
		    left: 0;
		    top:00px;
			color: red;
		    font-size: 19px;
		    font-weight: bold;
		    font-family: "隶书";
		    opacity: 0.9;
		}
		#userUNameTip{
			position: absolute;
		    left: 0;
		    top:78px;
			color: red;
		    font-size: 19px;
		    font-weight: bold;
		    font-family: "隶书";
		    opacity: 0.9;
		}
		#userPassTip{
			position: absolute;
		    left: 0;
		    top:155px;
			color: red;
		    font-size: 19px;
		    font-weight: bold;
		    font-family: "隶书";
		    opacity: 0.9;
		}
		#userNameTip{
			position: absolute;
		    left: 0;
		    top:230px;
			color: red;
		    font-size: 19px;
		    font-weight: bold;
		    font-family: "隶书";
		    opacity: 0.9;
		}
		#userIphoneTip{
			position: absolute;
		    left: 0;
		    top:305px;
			color: red;
		    font-size: 19px;
		    font-weight: bold;
		    font-family: "隶书";
		    opacity: 0.9;
		}

	</style>
</head>
<body>
    <div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header" style="height: 975px;">
				<canvas id="demo-canvas" width="100%" height="100%"></canvas>
				<div class="logo_box">
					<form action="${pageContext.request.contextPath}/user/registe" method="post" style="margin-bottom:0;">
						<div class="tip">
							<p id="userIdTip" style="display:none">学号错误，长度在9-12之间，请重新输入</p>
							<p id="userIdExitTip" style="display:none">账号已存在,请重新填写</p>
							<p id="userUNameTip" style="display:none">用户名格式错误，长度在1-15之间，请重新输入</p>
							<p id="userPassTip" style="display:none">密码格式错误，长度在6-18之间，请重新输入</p>
							<p id="userNameTip" style="display:none">姓名，长度在1-5之间，请重新输入</p>
							<p id="userIphoneTip" style="display:none">请输入正确的电话号码</p>
						</div>
						<div class="input_outer">
							<span class="u_user"></span>
							<input name="userId" id="userId" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入学号" value="${userId}" />
						</div>
						
						<div class="input_outer">
							<span class="u_user"></span>
							<input name="userName" id="userName" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入用户名" value="${userName}" />				
						</div>
						
						<div class="input_outer">
							<span class="us_uer"></span>
							<input name="passWord" id="passWord" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" value="" type="password" placeholder="请输入密码" value="${passWord}" />
						</div>
									
						<div class="input_outer">
							<span class="u_user"></span>
							<input name="realName" id="realName" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入姓名" value="${realName}" />
						</div>
						
						<div class="input_outer">
							<span class="u_user"></span>
							<input name="userIphone" id="userIphone" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入联系方式" value="${userIphone}" />
						</div>
						
						<div class="input_outer">
							<span class="u_user"></span>
							<input name="major" id="major" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入专业" value="${major}" />
						</div>
						
						<div class="input_outer">
							<span class="u_user"></span>
							<input name="gradesAndClass" id="gradesAndClass" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入班级" value="${gradesAndClass}" />
						</div>
						<font color="red">${registeErrorMsg}</font>
						<div style="text-align:center;"></div>
						<input class="act-but submit" width="50px" style="padding: 0.5em 3em;color: #FFFFFF;margin:0 73px" value="registe" type="submit">				
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/TweenLite.min.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/EasePack.min.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/rAF.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/demo-1.js"></script>
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>

</body>
<script>
$(document).on('blur', '#userId', function() {
		var userid = document.getElementById('userId');
		if((userid.value.length < 9) || (userid.value.length >12)){
			$("#userIdExitTip").hide(400);
			$("#userIdTip").show(400);
		}
		else{
			$("#userIdTip").hide(400);
			$.ajax({
				type:"POST",
				data:{userId:userid.value},
				url:"${pageContext.request.contextPath}/user/checkId",
				dataType:"text",
					success:function(result){
						if(result=="true"){
							$("#userIdExitTip").hide(400);
						}
						else{
							$("#userIdExitTip").show(400);
						}
					}
				});
		}
	}).on('blur', '#userName', function() {
		var username = document.getElementById('userName');
		if((username.value.length < 1) || (username.value.length >15)){
			$("#userUNameTip").show(400);
		}
		else{
			$("#userUNameTip").hide(400);
		}
	}).on('blur', '#passWord', function() {
		var password = document.getElementById('passWord');
		if((password.value.length < 6) || (password.value.length >18)){
			$("#userPassTip").show(400);
		}
		else{
			$("#userPassTip").hide(400);
		}
	}).on('blur', '#realName', function() {
		var realname = document.getElementById('realName');
		if((realname.value.length < 1) || (realname.value.length >5)){
			$("#userNameTip").show(400);
		}
		else{
			$("#userNameTip").hide(400);
		}
	}).on('blur','#userIphone',function() {
		var useriphone = document.getElementById('userIphone');
		var pattern = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		if((!pattern.test(useriphone.value))){
			$("#userIphoneTip").show(400);
		}
		else{
			$("#userIphoneTip").hide(400);
		}
	}).on()

</script>
</html>