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
	<title>我的私信</title>
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/normalize.css">
	<link rel="stylesheet" type="text/css" href="http://gikhg574109.jsp.jspee.com.cn:80/LoginAndRegister/css/demo.css">
		<link rel="stylesheet" href="<%=path%>/css/myemail.css" type="text/css">
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
					<div class="context_mid_top">
						<div id="context_mid_top_accept" class="context_mid_top_accept">
							<input id="context_mid_top_acceptMsgBtn" class="act-but submit" type="button" value="收到的私信">
						</div>
						<div id="context_mid_top_send" class="context_mid_top_send">
							<input id="context_mid_top_sendMsgBtn" class="act-but submit" type="button" value="发送私信">
						</div>
						<div id="context_mid_top_sended" class="context_mid_top_sended">
							<input id="context_mid_top_sendedMsgBtn" class="act-but submit" type="button" value="已发的私信">
						</div>
					</div>
					<div id="context_mid_acceptMsg" class="context_mid_acceptMsg">
						<table class="context_mid_acceptMsg_table"  border="1" cellpadding="10" cellspacing="0" class="table1" style="background-color:white;">
							<thead>
								<tr>
									<th style="width:150px;">发件人</th>
									<th style="width:820px;">主题</th>
									<th style="width:220px;">时间</th>
									<th style="width:130px;">状态</th>
									<th style="width:130px;">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="em" items="${requestScope.emailmsg.lists}">
									<div id="acceptDetails${em.emailId}" style="display:none;">
										<div id="accept${em.emailId}" style="display:none;">
											<input id="" class="act-but submit" type="button" value="关闭" onclick="closeDetails(acceptDetails${em.emailId},accept${em.emailId})">
											<textarea>${em.emailContext}</textarea>
										</div>
									</div>
									<tr id="acc${em.emailId}" onclick="emailDetails(acceptDetails${em.emailId},accept${em.emailId})">			
										<td>${em.sendUserId}${em.sendUserName}</td>
										<td>${em.emailTheam}</td>
										<td>${em.acceptTime}</td>
										<td>${em.emailState}</td>
										<td>
											<input id="context_mid_acceptMsg_table_option" class="context_mid_acceptMsg_table_option" type="button" value="删除" onclick="deleteEmails(${em.emailId})">
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tr>
								<td class="td2" colspan="7" style="text-align:center;">
								   <span>第${requestScope.emailmsg.currPage }/ ${requestScope.emailmsg.totalPage}页</span>  
								   <span>总记录数：${requestScope.emailmsg.totalCount }  每页显示:${requestScope.emailmsg.pageSize}</span>  
								   <span>
								       <c:if test="${requestScope.emailmsg.currPage != 1}">
								           <a href="${pageContext.request.contextPath }/checkmyemail?currentPage=1&userId=${currentUser.userId}">[首页]</a>  
								           <a href="${pageContext.request.contextPath }/checkmyemail?currentPage=${requestScope.emailmsg.currPage-1}&userId=${currentUser.userId}">[上一页]</a>  
								       </c:if>
								       
								       <c:if test="${requestScope.emailmsg.currPage != requestScope.emailmsg.totalPage}">
								           <a href="${pageContext.request.contextPath }/checkmyemail?currentPage=${requestScope.emailmsg.currPage+1}&userId=${currentUser.userId}">[下一页]</a>  
								           <a href="${pageContext.request.contextPath }/checkmyemail?currentPage=${requestScope.emailmsg.totalPage}&userId=${currentUser.userId}">[尾页]</a>  
								       </c:if>
								   </span>
								</td>	
							</tr>		
						</table>
					</div>
					
					<div id="context_mid_sendMsg" class="context_mid_sendMsg">
						<form action="${pageContext.request.contextPath}/sendemail" class="context_mid_sendMsg_form" method="post">
							收件人:<input id="send_acceptId" class="context_mid_sendMsg_acceptId" name="acceptUserId" type="text" value="">
							主&nbsp&nbsp&nbsp&nbsp题:<input id="send_theam" class="context_mid_sendMsg_theam" name="emailTheam" type="text" value="">
							正&nbsp&nbsp&nbsp&nbsp文:<textarea id="send_context" class="context_mid_sendMsg_context" value=""></textarea>
							<input id="send_sendId" class="context_mid_sendMsg_sendId" name="sendUserId" type="text" value="${currentUser.userId}" style="display:none">
							发件人:<input id="send_sendName" class="context_mid_sendMsg_sendName" name="sendUserName" type="text" value="${currentUser.userName}" disabled>
							<input id="sendBtn" class="context_mid_sendMsg_sendBtn" type="button" value="发送">
						</form>
					</div>
					
					<div id="context_mid_sendedMsg" class="context_mid_sendedMsg">
						<table class="context_mid_acceptMsg_table"  border="1" cellpadding="10" cellspacing="0" class="table1" style="background-color:white;">
							<thead>
								<tr>
									<th style="width:150px;">收件人</th>
									<th style="width:820px;">主题</th>
									<th style="width:220px;">时间</th>
									<th style="width:130px;">状态</th>
									<th style="width:130px;">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="sm" items="${requestScope.sendmsg.lists}">
									<div id="sendedDetails${sm.emailId}" style="display:none;">
										<div id="sended${sm.emailId}" style="display:none;">
											<input id="" class="act-but submit" type="button" value="关闭" onclick="closeDetails(sendedDetails${sm.emailId},sended${sm.emailId})">
											<textarea>${sm.emailContext}</textarea>
										</div>
									</div>
									<tr id="sen${sm.emailId}" onclick="emailDetails(sendedDetails${sm.emailId},sended${sm.emailId})">
										<td>${sm.acceptUserId}</td>
										<td>${sm.emailTheam}</td>
										<td>${sm.acceptTime}</td>
										<td>${sm.emailState}</td>
										<td>
											<input id="context_mid_acceptMsg_table_option" class="context_mid_acceptMsg_table_option" type="button" value="删除" onclick="deleteEmails(${sm.emailId})">
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tr>
								<td class="td2" colspan="7" style="text-align:center;">
								   <span>第${requestScope.sendmsg.currPage }/ ${requestScope.sendmsg.totalPage}页</span>  
								   <span>总记录数：${requestScope.sendmsg.totalCount }  每页显示:${requestScope.sendmsg.pageSize}</span>  
								   <span>
								       <c:if test="${requestScope.sendmsg.currPage != 1}">
								           <a href="${pageContext.request.contextPath }/checkmyemail?currentPage=1&currentSendPage=1&userId=${currentUser.userId}">[首页]</a>  
								           <a href="${pageContext.request.contextPath }/checkmyemail?currentPage=1&currentSendPage=${requestScope.sendmsg.currPage-1}&userId=${currentUser.userId}">[上一页]</a>  
								       </c:if>
								       
								       <c:if test="${requestScope.sendmsg.currPage != requestScope.sendmsg.totalPage}">
								           <a href="${pageContext.request.contextPath }/checkmyemail?currentPage=1&currentSendPage=${requestScope.sendmsg.currPage+1}&userId=${currentUser.userId}">[下一页]</a>  
								           <a href="${pageContext.request.contextPath }/checkmyemail?currentPage=1&currentSendPage=${requestScope.sendmsg.totalPage}&userId=${currentUser.userId}">[尾页]</a>  
								       </c:if>
								   </span>
								</td>	
							</tr>		
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
	<script src="<%=path%>/js/myemail.js" type="text/javascript"></script>
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