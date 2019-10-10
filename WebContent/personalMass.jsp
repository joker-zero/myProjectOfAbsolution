<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>个人信息</title>
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/demo.css">
	<link rel="stylesheet" href="<%=path%>/css/personalMass.css" type="text/css">
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
					<div class="context_mid_personalMass" id="context_mid_personalMass">
						<font color="red">${errModifyMsg2}</font>
						<font color="red">${sussModifyMsg2}</font>
						<div class="context_mid_personalMass_date" id="context_mid_personalMass_date">
							<span style="color: white;width:250px;">学号</span>
							<input name="userId" id="context_mid_personalMass_input" "type="text" placeholder="${currentUser.userId}" value="${currentUser.userId}">
							
							<span style="color: white;width:250px;">用户名</span>
							<input name="userName" id="context_mid_personalMass_input" type="text" placeholder="${currentUser.userName} " value="${currentUser.userName}">
							
							<span style="color: white;width:250px;">密码</span>
							<input name="passWord" id="context_mid_personalMass_userPass" style="margin-bottom:20px;padding: 8px;border-bottom: 1px solid #808080; width: 100%;" type="password" placeholder="${currentUser.passWord}" value="${currentUser.passWord}">
							<input class="act-but submit" id="context_mid_personalMass_showPass"  type="button" value="显示" >
							<input class="act-but submit" id="context_mid_personalMass_hidePass"  type="button" value="隐藏" >
							
							<span style="color: white;width:250px;">真实姓名</span>
							<input name="realName" id="context_mid_personalMass_input" type="text" placeholder="${currentUser.realName}" value="${currentUser.realName}">
							
							<span style="color: white;width:250px;">联系方式</span>
							<input name="userIphone" id="context_mid_personalMass_input" type="text" placeholder="${currentUser.userIphone}" value="${currentUser.userIphone}">
							
							<span style="color: white;width:250px;">专业</span>
							<input name="major" id="context_mid_personalMass_input" type="text" placeholder="${currentUser.major}" value="${currentUser.major}">
							
							<span style="color: white;width:250px;">班级</span>
							<input name="gradesAndClass" id="context_mid_personalMass_input" type="text" placeholder="${currentUser.gradesAndClass}" value="${currentUser.gradesAndClass}">
							
							<input class="act-but submit" id="context_mid_personalMass_ModifyPass" style="padding: 0.5em 2.3em;color: #FFFFFF;width:200px" type="button" value="修改信息">
						</div>
						
						<form action="${pageContext.request.contextPath}/user/modifyPortrait" class="context_mid_personalMass_portrait" method="post" enctype="multipart/form-data">
							<table >
								<tr>
									<td style="color:darkcyan;font-size:20px;font-weight:bold">修改头像：</td>
								</tr>
							</table>
							<input id="portrait" class="act-but submit" style="background:none;color:white;border:#FFFFFF solid 1px;width:350px;height:67px;" type="file" name="file" ><!--这个name=“file”并不是数据库的字段名哦-->
							<input name="userId" type="text" style="display:none;" value="${currentUser.userId}">
							<button class="act-but submit" type="submit" >修改</button>
							<font color="red">${errModifyMsg1}</font>
							<font color="red">${sussModifyMsg1}</font>
						</form>
					
						<div class="context_mid_personalMass_modifyMass" id="context_mid_personalMass_modifyMass">
							<div class="context_mid_personalMass_modifyMass_outside">
								<div class="tip">
									<p id="userIdTip" style="display:none">学号错误，长度在9-12之间，请重新输入</p>
									<p id="userIdExitTip" style="display:none">账号已存在,请重新填写</p>
									<p id="userUNameTip" style="display:none">用户名格式错误，长度在1-15之间，请重新输入</p>
									<p id="userPassTip" style="display:none">密码格式错误，长度在6-18之间，请重新输入</p>
									<p id="userNameTip" style="display:none">姓名，长度在1-5之间，请重新输入</p>
									<p id="userIphoneTip" style="display:none">请输入正确的电话号码</p>
								</div>
								<div class="context_mid_personalMass_modifyMass_title">
									<h2>修改信息</h2>
								</div >
								<form class="context_mid_personalMass_modifyMass_form" action="${pageContext.request.contextPath}/user/modify" method="post">
										<input name="loginImage" value="${currentUser.loginImage}" style="display:none;">
										<span style="color: white;width:250px;">学号</span>
										<input name="userId" class="context_mid_personalMass_modifyMass_input" id="context_mid_personalMass_modifyMass_userId" style="background-color: rgba(84, 84, 84, 0.33);;"type="text" placeholder="${currentUser.userId}" value="${currentUser.userId}" readonly>

										<span style="color: white;width:250px;">用户名</span>
										<input name="userName" class="context_mid_personalMass_modifyMass_input" id="context_mid_personalMass_modifyMass_userUName" type="text" placeholder="${currentUser.userName} " value="${currentUser.userName}">
										<p id="userUNameTip" style="display:none">用户名格式错误，长度在1-15之间，请重新输入</p>
										
										<span style="color: white;width:250px;">密码</span>
										<input name="passWord" class="context_mid_personalMass_modifyMass_input" id="context_mid_personalMass_modifyMass_userPass" style="padding: 8px;width: 100%;border: 1px solid; margin-bottom:20px;" type="password" placeholder="${currentUser.passWord}" value="${currentUser.passWord}">
										<p id="userPassTip" style="display:none">密码格式错误，长度在6-18之间，请重新输入</p>
										<input class="act-but submit" id="context_mid_personalMass_modifyMass_showPass" style="padding: 0.3em 0.3em;color: #FFFFFF;width:50px" type="button" value="显示" >
										<input class="act-but submit" id="context_mid_personalMass_modifyMass_hidePass" style="padding: 0.3em 0.3em;color: #FFFFFF;width:50px" type="button" value="隐藏" >
										
										<span style="color: white;width:250px;">真实姓名</span>
										<input name="realName" class="context_mid_personalMass_modifyMass_input" id="context_mid_personalMass_modifyMass_realName" type="text" placeholder="${currentUser.realName}" value="${currentUser.realName}">
										<p id="userNameTip" style="display:none">姓名，长度在1-5之间，请重新输入</p>
										
										<span style="color: white;width:250px;">联系方式</span>
										<input name="userIphone" class="context_mid_personalMass_modifyMass_input" id="context_mid_personalMass_modifyMass_Phone" type="text" placeholder="${currentUser.userIphone}" value="${currentUser.userIphone}">
										<p id="userIphoneTip" style="display:none">请输入正确的电话号码</p>
										
										<span style="color: white;width:250px;">专业</span>
										<input name="major" class="context_mid_personalMass_modifyMass_input" id="context_mid_personalMass_modifyMass_major" type="text" placeholder="${currentUser.major}" value="${currentUser.major}">
										
										<span style="color: white;width:250px;">班级</span>
										<input name="gradesAndClass" class="context_mid_personalMass_modifyMass_input" id="context_mid_personalMass_modifyMass_GAC" type="text" placeholder="${currentUser.gradesAndClass}" value="${currentUser.gradesAndClass}">
										<input class="act-but submit" id="context_mid_personalMass_modifyMass_closeModify" style="padding: 0.5em 2.3em;color: #FFFFFF;width:200px;position:absolute;left:70px;top:580px;" type="button" value="关闭">
										<input class="act-but submit" id="context_mid_personalMass_modifyMass_saveModify" style="padding: 0.5em 2.3em;color: #FFFFFF;width:200px;position:absolute;left:70px;top:520px;" type="submit" value="保存修改" >
								</form>
							</div>						
						</div>
					</div>	
				</div>

				<div class="context_left">
					<div class="context_left_portrait">
						<img src="<%=path%>/image/timg.jpg" id="context_left_portrait_image" style="display:block;"></img>
						<img id="context_left_portrait_login" alt="" src="<%=path%>/${currentUser.loginImage}">
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
	<script src="<%=path%>/js/personalMass.js" type="text/javascript"></script>
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