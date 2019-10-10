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
	
	setInterval(function(){
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		var temp = document.getElementById('check_login').value;
		$.ajax({
			type:"POST",
			data:{userId:temp,currentPage:1,memberPage:1},
			url:projectName+"/aeas/listMyAssoByPage",
			dataType:"text",
				success:function(data){
				}
			});	
	}, 30000);
	
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
	}).on('click','#context_mid_top_btn_modifyNotice',function(){
		var outdiv=document.getElementById('context_mid_modifyOutSide');
		var framediv = document.getElementById('context_mid_modifyOutSide_notice');
		outdiv.style.display='block';
		framediv.style.display='block';
		
	}).on('click','#context_mid_modifyOutSide_closeNoticeBtn',function(){
		var outdiv=document.getElementById('context_mid_modifyOutSide');
		var framediv = document.getElementById('context_mid_modifyOutSide_notice');
		outdiv.style.display='none';
		framediv.style.display='none';
	}).on('click','#context_mid_top_btn_modifyView',function(){
		var outdiv=document.getElementById('context_mid_modifyOutSide');
		var framediv = document.getElementById('context_mid_modifyOutSide_view');
		outdiv.style.display='block';
		framediv.style.display='block';	
	}).on('click','#context_mid_modifyOutSide_closeViewBtn',function(){
		var outdiv=document.getElementById('context_mid_modifyOutSide');
		var framediv = document.getElementById('context_mid_modifyOutSide_view');
		outdiv.style.display='none';
		framediv.style.display='none';
	}).on()
	
	
	
	function showSubMenu(){
		var synbtn = document.getElementById('context_mid_top_btn_modifyNotice');
		var viewbtn = document.getElementById('context_mid_top_btn_modifyView');
		synbtn.style.display='block';
		viewbtn.style.display='block';
	}
	function hiddenSubMenu(){
		var synbtn = document.getElementById('context_mid_top_btn_modifyNotice');
		var viewbtn = document.getElementById('context_mid_top_btn_modifyView');
		synbtn.style.display='none';
		viewbtn.style.display='none';
	}

	function showPosiMenu(apply){
		var firstid = 'context_mid_membertable_first'+apply;
		var secondid = 'context_mid_membertable_second'+apply;
		var thirdid = 'context_mid_membertable_third'+apply;
		var firstbtn = document.getElementById(firstid);
		var secondbtn = document.getElementById(secondid);
		var thirdbtn = document.getElementById(thirdid);
		firstbtn.style.display='block';
		secondbtn.style.display='block';
		thirdbtn.style.display='block';
		
	}
	function hiddenPosiMenu(apply){
		var firstid = 'context_mid_membertable_first'+apply;
		var secondid = 'context_mid_membertable_second'+apply;
		var thirdid = 'context_mid_membertable_third'+apply;
		var firstbtn = document.getElementById(firstid);
		var secondbtn = document.getElementById(secondid);
		var thirdbtn = document.getElementById(thirdid);
		firstbtn.style.display='none';
		secondbtn.style.display='none';
		thirdbtn.style.display='none';
	}
	
	
	function modifyNotice(us,as){
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 	
		var outdiv=document.getElementById('context_mid_modifyOutSide');
		var framediv = document.getElementById('context_mid_modifyOutSide_notice');
		
		var userid = us;
		var assoid = as;
		var textarea = document.getElementById('context_mid_modifyOutSide_notTextArer').value;	
		$.ajax({
			type:"POST",
			data:{"userId":userid,"assoId":assoid,assoNotice:textarea},
			url:projectName+"/modifyNotice",
			dataType:"text",
			success:function(data){
				if(data=="success"){
					alert("修改成功！")
					outdiv.style.display='none';
					framediv.style.display='none';
				}
				else{
					alert("修改失败,请重试!")
				}
			}
		});
	}
	
	function saveModifyView(){
		var select = document.getElementById('projectPorperty').value;
		var selectinput = document.getElementById('context_mid_modifyOutSide_view_select').value=select;		
	}
	
	function deletemember(apply,asso){
		var pathName=window.document.location.pathname;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 	
		var userid = document.getElementById('check_login').value;
		var applyid = apply;
		var assoid = asso;
		if(confirm("是否要删除该成员?")==true){
			$.ajax({
				type:"POST",
				data:{applyId:applyid,userId:userid,assoId:assoid},
				url:projectName+"/deletemember",
				dataType:"text",
				success:function(data){
					if(data=="success"){
						alert("删除成功！")
					}
					else if(data=="notLeader"){
						alert("你不是社长，无权删除！")
					}
					else{
						alert("删除失败，请刷新重试！")
					}
				}
			});
		}
		else{
		}
	}
	
	function modifyposition(apply,asso,ob){
		var applyid = apply;
		var assoid = asso;
		var flag = ob;
		var userid = document.getElementById('check_login').value;
		var pathName=window.document.location.pathname;
		var position;
		var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
		if(flag == 1){
			position ="社长";
		}
		else if(flag == 2){
			position ="副社长";
		}
		else if(flag == 3){
			position ="社员";
		}
		if(confirm("是否修改当前社员职位?")==true){
			$.ajax({
				type:"POST",
				data:{applyId:applyid,userId:userid,assoId:assoid,assoPosition:position},
				url:projectName+"/modifyPosition",
				dataType:"text",
				success:function(data){
					if(data=="success"){
						alert("修改成功！")
					}
					else if(data=="notLeader"){
						alert("你不是社长，无权修改！")
					}
					else{
						alert("修改失败，请刷新重试！")
					}
				}
			});
		}
		else{}
	}