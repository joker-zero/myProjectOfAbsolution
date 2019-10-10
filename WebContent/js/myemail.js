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
						window.location.href=projectName+"/checkmyemail?currentPage=1&currentSendPage=1&userId="+userid+"";
				}
			});	
		}
	}).on()	
	
$(document).on('click', '#context_mid_top_acceptMsgBtn', function() {
		var userid = document.getElementById('check_login').value;
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		
		var acceptMsgDiv = document.getElementById('context_mid_acceptMsg');
		var acceptBtnDiv = document.getElementById('context_mid_top_accept');
	
		var sendMsgDiv = document.getElementById('context_mid_sendMsg');
		var sendBtnDiv = document.getElementById('context_mid_top_send');
		
		var sendedMsgDiv = document.getElementById('context_mid_sendedMsg');
		var sendedBtnDiv = document.getElementById('context_mid_top_sended');
		
		acceptBtnDiv.style.borderColor='transparent transparent #0000008f';
		sendBtnDiv.style.borderTop='90px solid #6d6d6db0';
		sendedBtnDiv.style.borderColor='transparent transparent #0000008f';
		
		acceptMsgDiv.style.display='block';
		sendMsgDiv.style.display='none';
		sendedMsgDiv.style.display='block';
		$.ajax({
			type:"POST",
			data:{"userId":userid},
			url:projectName+"/checkmyemail",
			dataType:"text",
				success:function(data){
					window.location.href=projectName+"/checkmyemail?currentPage=1&userId="+userid+"";
			}
		});	
	}).on('click', '#context_mid_top_sendMsgBtn', function(){
		var acceptMsgDiv = document.getElementById('context_mid_acceptMsg');
		var acceptBtnDiv = document.getElementById('context_mid_top_accept');
	
		var sendMsgDiv = document.getElementById('context_mid_sendMsg');
		var sendBtnDiv = document.getElementById('context_mid_top_send');
		
		var sendedMsgDiv = document.getElementById('context_mid_sendedMsg');
		var sendedBtnDiv = document.getElementById('context_mid_top_sended');
		
		acceptBtnDiv.style.borderColor='transparent transparent #6d6d6db0';
		sendBtnDiv.style.borderTop='90px solid #0000008f';
		sendedBtnDiv.style.borderColor='transparent transparent #6d6d6db0';
		
		acceptMsgDiv.style.display='none';
		sendMsgDiv.style.display='block';
		sendedMsgDiv.style.display='none';
	}).on('click', '#context_mid_top_sendedMsgBtn', function(){	
		var acceptMsgDiv = document.getElementById('context_mid_acceptMsg');
		var acceptBtnDiv = document.getElementById('context_mid_top_accept');
	
		var sendMsgDiv = document.getElementById('context_mid_sendMsg');
		var sendBtnDiv = document.getElementById('context_mid_top_send');
		
		var sendedMsgDiv = document.getElementById('context_mid_sendedMsg');
		var sendedBtnDiv = document.getElementById('context_mid_top_sended');
		
		acceptBtnDiv.style.borderColor='transparent transparent #0000008f';
		sendBtnDiv.style.borderTop='90px solid #6d6d6db0';
		sendedBtnDiv.style.borderColor='transparent transparent #0000008f';
		
		acceptMsgDiv.style.display='block';
		sendMsgDiv.style.display='none';
		sendedMsgDiv.style.display='block';
	}).on('click','#sendBtn',function(){
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		var acid = document.getElementById('send_acceptId').value;
		var sendid = document.getElementById('send_sendId').value;
		var sendname = document.getElementById('send_sendName').value;
		var emailtheam = document.getElementById('send_theam').value;
		var emailcontext = document.getElementById('send_context').value;
		$.ajax({
			type:"POST",
			data:{acceptUserId:acid,sendUserId:sendid,sendUserName:sendname,emailTheam:emailtheam,emailContext:emailcontext},
			url:projectName+"/sendemail",
			dataType:"text",
				success:function(data){
					if(data=="success"){
						alert("发送成功!")
					}
					else{
						alert("发送失败!,无此id，请检查后再发送!")
					}					
			}
		});
	}).on()
	
	function deleteEmails(ob){
	var pathName=window.document.location.pathname;
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	var emailid = ob;
	if(confirm("是否删除？")==true){
		$.ajax({
			type:"POST",
			data:{emailId:emailid},
			url:projectName+"/deleteemail",
			dataTepe:"text",
				success:function(data){
					if(data=="success"){
						alert("删除成功！")
					}
					else{
						alert("删除失败，请刷新后重试！")
					}
				}
			
		});
	}
	else{}	
	}

	function emailDetails(ob1,ob2){
		var outdiv = ob1;
		var indiv = ob2;
		outdiv.style.display='block';
		indiv.style.display='block';
	}
	
	function closeDetails(ob1,ob2){
		var outdiv = ob1;
		var indiv = ob2;
		outdiv.style.display='none';
		indiv.style.display='none';
	}
	