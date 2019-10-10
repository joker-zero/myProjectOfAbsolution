	window.onload=function(){
		var temp = document.getElementById('check_login');
		var temp_login = document.getElementById('link_login');
		var temp_logout = document.getElementById('link_logout');
		var temp_portraitImage = document.getElementById('context_left_portrait_image');
		if(temp.value == ""){
			temp_logout.style.top = '9999px';
			temp_login.style.top = 0;
			temp_portraitImage.style.display = 'block';
		}
		else{
			temp_logout.style.top = 0;
			temp_login.style.top = '9999px';
			temp_portraitImage.style.display = 'none';
		}
	}
	
	$(document).on('click', '#context_mid_personalMass_showPass', function() {
		var userPassType = document.getElementById('context_mid_personalMass_userPass');
		var showPass = document.getElementById('context_mid_personalMass_showPass');
		var hidePass = document.getElementById('context_mid_personalMass_hidePass');
		userPassType.type = 'text';
		showPass.style.display = 'none';
		hidePass.style.display = 'block';
	}).on('click', '#context_mid_personalMass_hidePass', function() {
		var userPassType = document.getElementById('context_mid_personalMass_userPass');
		var showPass = document.getElementById('context_mid_personalMass_showPass');
		var hidePass = document.getElementById('context_mid_personalMass_hidePass');
		userPassType.type='password';
		showPass.style.display = 'block';
		hidePass.style.display = 'none';	
	}).on('click', '#context_mid_personalMass_ModifyPass', function(){
		var showModify = document.getElementById('context_mid_personalMass_modifyMass');
		showModify.style.display = 'block';
	}).on('click', '#context_mid_personalMass_modifyMass_closeModify', function(){
		var closeModify = document.getElementById('context_mid_personalMass_modifyMass');
		closeModify.style.display = 'none';
		$("#userUNameTip").hide(0);
		$("#userPassTip").hide(0);
		$("#userNameTip").hide(0);
		$("#userIphoneTip").hide(0);
	}).on('click', '#context_mid_personalMass_modifyMass_showPass', function() {
		var userPassType = document.getElementById('context_mid_personalMass_modifyMass_userPass');
		var showPass = document.getElementById('context_mid_personalMass_modifyMass_showPass');
		var hidePass = document.getElementById('context_mid_personalMass_modifyMass_hidePass');
		userPassType.type = 'text';
		showPass.style.display = 'none';
		hidePass.style.display = 'block';
	}).on('click', '#context_mid_personalMass_modifyMass_hidePass', function() {
		var userPassType = document.getElementById('context_mid_personalMass_modifyMass_userPass');
		var showPass = document.getElementById('context_mid_personalMass_modifyMass_showPass');
		var hidePass = document.getElementById('context_mid_personalMass_modifyMass_hidePass');
		userPassType.type='password';
		showPass.style.display = 'block';
		hidePass.style.display = 'none';	
	}).on()
	
$(document).on('click', '#firstPage_btn', function() {
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		
		window.location.href=projectName+"/aeas/listAllByPage?currentPage=1";

	}).on('click', '#personalMass_btn', function() {
		var temp = document.getElementById('check_login');
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		if(temp.value==""){
			alert("还未登陆，请先登录！")
			window.location.href=projectName+"/index.jsp";
		}
		else{
			window.location.href=projectName+"/personalMass.jsp";
		}
	}).on('click', '#myAssociation_btn', function() {
		var temp = document.getElementById('check_login');
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		if(temp.value==""){
			alert("还未登陆，请先登录！")
			window.location.href=projectName+"/index.jsp";
		}
		else{
			window.location.href=projectName+"/myAssociation.jsp";
		}
	}).on('click', '#applyAssociation_btn', function() {
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		var temp = document.getElementById('check_login');
		if(temp.value==""){
			alert("还未登陆，请先登录！")
			window.location.href=projectName+"/index.jsp";
		}
		else{
			var temp = document.getElementById('check_login').value;
			$.ajax({
				type:"POST",
				data:{assoLeader:temp},
				url:projectName+"/aeas/checkEstablishAndRevoke",
				dataType:"text",
					success:function(data){
						window.location.href=projectName+"/aeas/listByPage?currentPage=1&userId="+temp+"";
					}
				});	
		}
	}).on('click', '#myEmail_btn', function() {
		var temp = document.getElementById('check_login');
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		if(temp.value==""){
			alert("还未登陆，请先登录！")
			window.location.href=projectName+"/index.jsp";
		}
		else{
			var userid = document.getElementById('check_login').value;
			$.ajax({
				type:"POST",
				data:{"userId":userid},
				url:projectName+"/checkmyemail",
				dataType:"text",
					success:function(data){
						window.location.href=projectName+"/checkmyemail?currentPage=1&userId="+userid+"";
					}
				});	
		}
	}).on()
	
$(document).on('blur', '#context_mid_personalMass_modifyMass_userUName', function() {
		var username = document.getElementById('context_mid_personalMass_modifyMass_userUName');
		if((username.value.length < 1) || (username.value.length >15)){
			$("#userUNameTip").show(400);
		}
		else{
			$("#userUNameTip").hide(400);
		}
	}).on('blur', '#context_mid_personalMass_modifyMass_userPass', function() {
		var password = document.getElementById('context_mid_personalMass_modifyMass_userPass');
		if((password.value.length < 6) || (password.value.length >18)){
			$("#userPassTip").show(400);
		}
		else{
			$("#userPassTip").hide(400);
		}
	}).on('blur', '#context_mid_personalMass_modifyMass_realName', function() {
		var realname = document.getElementById('context_mid_personalMass_modifyMass_realName');
		if((realname.value.length < 1) || (realname.value.length >5)){
			$("#userNameTip").show(400);
		}
		else{
			$("#userNameTip").hide(400);
		}
	}).on('blur','#context_mid_personalMass_modifyMass_Phone',function() {
		var useriphone = document.getElementById('context_mid_personalMass_modifyMass_Phone');
		var pattern = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		if((!pattern.test(useriphone.value))){
			$("#userIphoneTip").show(400);
		}
		else{
			$("#userIphoneTip").hide(400);
		}
	}).on()
	
$(document).on('click','#context_mid_personalMass_modifyMass_saveModify',function(){
		closeModify.style.display = 'none';
	}).on()