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


    <title>研究生周报告管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>	 
   <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

  <body>
	
    <nav class="navbar navbar-inverse navbar-fixed-top" >
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">研究生周报告管理系统</a>
        </div>
        
        <div id="navbar" class="navbar-collapse collapse" style="margin-right:20px;">
          <ul  id="orderwhite"class="nav navbar-nav navbar-right">
           <li><a href="#" >管理员</a></li>
          <li><span class="glyphicon glyphicon-log-out"style="font-size:0.9em;color:white;margin-left:0px;margin-top:18px;"></span></li>
          <li><a href="/admin/relogin" >安全退出</a></li>
          </ul>
        </div>
      </div>
    </nav>
	<div class="divider" style="margin-top:20px;"></div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">    	
			<div class="panel-group" id="accordion" style="margin-top:40px;">
<!-- 				<div class="panel panel-default">
			        <div class="panel-heading">
			            <h4 class="panel-title">
			                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration: none;">管理中心</a>
			            </h4>
			        </div>
			        <div id="collapseOne" class="panel-collapse collapse">
			        <div class="panel-body">
			            <ul class="nav nav-sidebar">
			            	<li ><a href="adminLookLab.jsp">查看实验室 </a></li>
			          	</ul>
			        </div>
			        </div>
			    </div> -->
			    <div class="panel panel-default">
			        <div class="panel-heading">
			            <h4 class="panel-title">
			                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" style="text-decoration: none;">实验室管理</a>
			            </h4>
			        </div>
			        <div id="collapseThree" class="panel-collapse collapse">
			            <div class="panel-body">
			               	<ul class="nav nav-sidebar">
			               		<li><a href="/admin/adminAddLab">添加实验室 </a></li>
								<li><a href="/admin/adminLookLabList">查看实验室 </a></li>
			          		</ul>
			            </div>
			        </div>
			    </div>
			    <div class="panel panel-default">
			        <div class="panel-heading">
			            <h4 class="panel-title">
			                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour" style="text-decoration: none;">导师管理</a>
			            </h4>
			        </div>
			        <div id="collapseFour" class="panel-collapse collapse">
			            <div class="panel-body">
			                <ul class="nav nav-sidebar">
			            		<li><a href="/admin/adminAddTeacher">添加导师</a></li>
								<li><a href="/admin/adminLookTeacherList">查看导师</a></li>
			          		</ul>
			            </div>
			        </div>
			    </div>
			</div>
        </div>
        <div class="col-sm-9  col-md-10  main"  style="margin-top:40px;" >

        	<div  id="div1" style="background-color:#FFFFE0;padding-top:60px;padding-left:50px; height:543px;">
				<div class="form-bg">
					<div class="container"  id="form1">
						<div class="row">
							<div class="col-md-offset-3 col-md-6">
								<form class="form-horizontal" id="from1">
									<style type="text/css">
										.form-group{
											width: 300px;
											height: 50px;
										}
										.heading{
											width:250px;
											height:70px;
											text-align: center;
										}
										.form-group-bt{
											width:400px;
											height:100px;
											margin:30px auto;
										}
									</style>

									<div class="heading" >
										<font size="5" > 教师注册 </font>
									</div>

									<div class="form-group" style="height: 50px; top:30%; ">
										<font size="4">教工号：</font>
										<input type="text" style="width: 200px; top:30%; class="form-control" id="Tid">
									</div>

									<div class="form-group" >
										<font size="4">姓&nbsp&nbsp&nbsp&nbsp名：</font>
										<input type="text" style="width: 200px; top:30%; class="form-control" id="Tname">  
									</div>

									<div class="form-group" >
										<font size="4">密&nbsp&nbsp&nbsp&nbsp码：</font>
										<input type="password" style="width: 200px; top:30%; class="form-control" id="Psw">
									</div>

									<div class="form-group" >
										<font size="4">手机号：</font>
										<input type="text" style="width: 200px; top:30%; class="form-control" id="Phone">	
									</div>

									<div class="form-group-bt">
										<button type="button" class="btn btn-default" onclick="addTeacher()" >提交</button>
										<button type="button" class="btn btn-default" >重置</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>  
			</div>		
		</div>		
		</div>	
	</div>
	
	<script type="text/javascript">
        //管理员添加教师
		function addTeacher(){					
			
			var Tid=$("#Tid").val();
		    var Tname=$("#Tname").val();
		    var Psw=$("#Psw").val();
		    var Phone=$("#Phone").val();
			if(Tid=="")
			{
				alert("请输入教工号！");
				return false;				
			}
			
			if(Tname=="")
				{
				alert("请输入教工姓名！");
				return false;
				}
			if(Psw=="")
			{
			alert("请输入密码！");
			return false;
			}
			if(Phone=="")
			{
			alert("请输入手机号码！");
			return false;
			}
		    var server="/admin/saveAdminAddTeacher";
			var datas={};			
			datas["Tid"] = $("#Tid").val();
			datas["Tname"] =  $("#Tname").val();		
			datas["Psw"] =  $("#Psw").val();
			datas["Phone"] =  $("#Phone").val();
			$.ajax({
	    	    type: "post",
	    	    dataType : "json",
	    	    url: server,
	    	    data: datas,    	   
	    	    success: function(result) {
	    	    	if(result.code==0){
	    	    		alert(result.message);
	    	    		window.location.href="/admin/adminAddTeacher";
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


