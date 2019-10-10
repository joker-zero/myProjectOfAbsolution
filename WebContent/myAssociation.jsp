<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我的社团</title>
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/demo.css">
	<link rel="stylesheet" href="./css/myAssociation.css" type="text/css">
	<!--必要样式-->
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/component.css">
	<!--[if IE]>
	<script src="js/html5.js"></script>
	<![endif]-->

</head>
<body>
	<div class="loginName">
		<input id="check_login" value="${currentUser.userId}">
	</div>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header" style="height: 975px;">
				<canvas id="demo-canvas" style="width:100% ;height:100%"></canvas>
				
				<div class="context_top">
					<div class="context_top_return">
						<a href="javascript:history.go(-1);">向上一页</a>
					</div>
					
					<div class="context_top_link">
						<div class="context_top_link_login" id="link_login">
							<a  href="${pageContext.request.contextPath}/index.jsp">[登录]</a>
						</div>
						<div class="context_top_link_logout" id="link_logout">
							<a  onclick="logout()">[退出]</a>
						</div>
						<div class="context_top_link_registe" id="link_registe">
							<a  href="${pageContext.request.contextPath}/registe.jsp" >注册</a>
						</div>
					</div>
				</div>
				
				<div class="context_mid">
					<div class="context_mid_title">我的社团</div>
					<div class="context_mid_left">
						<div class="context_mid_left_link">
						<a href="${pageContext.request.contextPath }/aeas/listMyAssoByPage?currentPage=1&memberPage=1&userId=${currentUser.userId}">已加入的社团</a>  
						</div>
					</div>
					<div style="height:600px; width:100px; border-right:#929191 solid 8px;position:absolute;top:18%;left:30%"></div>
					<div class="context_mid_right">
						<div class="context_mid_right_link">
							<a href="${pageContext.request.contextPath}/creatAsso.jsp">创建社团</a>
						</div>
					</div>
				</div>

				<div class="context_left">
					<div class="context_left_portrait">
						<img src="image/timg.jpg" id="context_left_portrait_image" style="display:block;"></img>
						<img id="context_left_portrait_login" alt="" src="${currentUser.loginImage}">
						<div class="context_left_userName">
							${currentUser.userName}
						</div>		
					</div>
					<div class="context_left_functionBtn">
						<input class="act-but submit" id="firstPage_btn" type="button" value="首页" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%">
						<input class="act-but submit" id="personalMass_btn" type="button" value="个人信息" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%">
						<input class="act-but submit" id="myAssociation_btn" type="button" value="我的社团" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%">
						<input class="act-but submit" id="applyAssociation_btn" type="button" value="社团申请" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%" >
						<input class="act-but submit" id="myEmail_btn" type="button" value="我的私信" style="color: #FFFFFF;width:50%;margin:20px 0px 0 20%">
					</div>
				</div>
				
				<div class="context_bottom">
				
				</div>
		</div>
	</div>	
</div>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/TweenLite.min.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/EasePack.min.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/rAF.js"></script>
	<script src="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/js/demo-1.js"></script>
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="./js/myAssociation.js" type="text/javascript"></script>
</body>
<script>
function logout() {
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/user/first",
		dataType:"text",
			success:function(data){
				window.location.href = "${pageContext.request.contextPath}/first.jsp";
			}
		});
}
</script> 
</html>