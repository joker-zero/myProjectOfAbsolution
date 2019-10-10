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
	<title>${assoDetails.assoName}</title>
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/demo.css">
		<link rel="stylesheet" href="<%=path%>/css/assoDetails.css" type="text/css">
	<!--必要样式-->
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/component.css">
	<!--[if IE]>
	<script src="js/html5.js"></script>
	<![endif]-->
</head>
<body>
	<div class="loginName">
		<input id="check_login" value="${currentUser.userId}">
		<input id="apply_assoId" value="${assoDetails.assoId}" style="display:none">
		<input id="apply_assoLeader" value="${assoDetails.assoLeader}" style="display:none">
		
	</div>
	<div id="">
		<input id="associationId" value="${assoDetails.assoId}" style="display:none;">
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
					<div class="context_mid_top">
						<div class="context_mid_top_assoName">
							${assoDetails.assoName}
						</div>
					</div>
					
					<div class="context_mid_left">
						<div class="context_mid_left_details">
							<div class="context_mid_left_details_portrait">
								<img id="details_portrait" alt="" src="<%=path%>/${assoDetails.assoImage}">
							</div>
							<div class="context_mid_left_details_data">
								<table border="1px solid white" cellpadding="10" cellspacing="0" >
									<thead>
										<tr>
											<th>社团编号:</th>
											<th>社长:</th>
											<th>社长学号:</th>
											<th>社团创建时间:</th>
										<tr>
									</thead>
									<tbody>
										<tr>
											<td>
												${assoDetails.assoId}
											</td>
											<td>
												${assoDetails.userName}
											</td>
											<td>
												${assoDetails.assoLeader}
											</td>
											<td>
												${assoDetails.assoTime}
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="context_mid_left_join">
								<input id="context_mid_left_joinBtn" class="act-but submit" type="button" value="申请加入">
							</div>
						</div>
					</div>
					
					<div class="context_mid_right">
						<div class="context_mid_right_notice">
							<table class="context_mid_right_noticetable">
								<thead>
									<tr>
										<th style="font-size:30px;color:white;">简介</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><textarea cols='1' rows='10' style="width:100%;height:220px; background-color:#3899fde8;text-align:left;" >${assoDetails.assoSynopsis}</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="context_mid_bottom">
						<table class="context_mid_bottom_table">
						<thead>
							<tr>
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
								<th>5</th>
							</tr>
							<tr>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image1}"></td>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image2}"></td>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image3}"></td>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image4}"></td>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image5}"></td>
							</tr>
						</thead>
						<tbody>
							
							<tr>
								<th>6</th>
								<th>7</th>
								<th>8</th>
								<th>9</th>
								<th>10</th>															
							</tr>
							<tr>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image6}"></td>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image7}"></td>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image8}"></td>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image9}"></td>
								<td><img id="context_mid_bottom_image" alt="" src="<%=path%>/${images.image10}"></td>
							</tr>
						</tbody>
					</table>
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
	<script src="<%=path%>/js/assoDetails.js" type="text/javascript"></script>
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