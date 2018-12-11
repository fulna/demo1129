<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->


    <title>管理员登录</title>

    <!-- Bootstrap core CSS -->
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link href="/css/adminlogin.css" rel="stylesheet">
	<script type="text/javascript" src="/js/jquery-1.7.1.min.js" ></script>

</head>

<body background="/images/bgp/4.jpg"  style="background-size:100% 100%;background-repeat:no-repeat;">
	
	<div class="form-bg">
		  <div class="container"  id="form1">
		     <div class="row">
		          <div class="col-md-offset-3 col-md-6">
		              <form class="form-horizontal" id="from1">
		                    <span class="heading">管理员登录</span>
		                     <div class="form-group">
		                            <input type="text" class="form-control" id="Aname" placeholder="用户名">
		                            <i class="fa fa-user"></i>
		                      </div>
		                       <div class="form-group help">
		                            <input type="password" class="form-control" id="Psw" placeholder="密　码">		                        
		                        	<i class="fa fa-lock"></i>
		                       </div>
		                       <div class="form-group">
		                            <button type="button" class="btn btn-default" onclick="adminlogin()">登录</button>
		                       </div>
		                   </form>
		               </div>
		           </div>
		      </div>
	</div>

<script type="text/javascript">
		function adminlogin(){					
			
			var Aname=$("#Aname").val();
			var Psw=$("#Psw").val();		
			if(Aname=="")
			{
				alert("请输入用户名！");
				return false;				
			}
			
			if(Psw=="")
				{
				alert("请输入密码！");
				return false;
				}
			var server="/admin/login";
			var datas={};			
			datas["Aname"] = $("#Aname").val();
			datas["Psw"] =  $("#Psw").val();						
			$.ajax({
	    	    type: "post",
	    	    dataType : "json",
	    	    url: server,
	    	    data: datas,    	   
	    	    success: function(result) {
	    	    	if(result.code==0){
	    	    		alert(result.message);
	    	    		window.location.href="/admin/adminIndex";
	    	    	}else{
	    	    		alert(result.message);
	    	    		return false;		
	    	    	}
	    	    }
	        });
		}
	</script>
	
</body>
</html>


