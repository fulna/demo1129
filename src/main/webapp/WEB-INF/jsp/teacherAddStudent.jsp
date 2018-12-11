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
           <li><a href="#" >导师</a></li>
          <li><span class="glyphicon glyphicon-log-out"style="font-size:0.9em;color:white;margin-left:0px;margin-top:18px;"></span></li>
          <li><a href="/teacher/relogin" >安全退出</a></li>
          </ul>
        </div>
      </div>
    </nav>
	<div class="divider" style="margin-top:20px;"></div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">    	
			<div class="panel-group" id="accordion" style="margin-top:40px;">
			    <div class="panel panel-default">
			        <div class="panel-heading">
			            <h4 class="panel-title">
			                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" style="text-decoration: none;">报告管理</a>
			            </h4>
			        </div>
			        <div id="collapseThree" class="panel-collapse collapse">
			            <div class="panel-body">
			               	<ul class="nav nav-sidebar">
			            		<li ><a href="/teacher/teacherLookStudentReportList">学生报告 </a></li>
			            		<li ><a href="/teacher/teacherLookLabReportList">实验室报告 </a></li>
			            		<li ><a href="/teacher/teacherCountReport">统计报告 </a></li>
			            		<li ><a href="/teacher/teacherLookShareReportList">分享报告 </a></li>
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
			            			<li><a href="/teacher/teacherAddTeacher">添加导师</a></li>
			            			<li><a href="/teacher/teacherLookTeacherList">导师列表</a></li>
			            			<li><a href="/teacher/teacherAddStudent">添加学生</a></li>
			            			<li><a href="/teacher/teacherLookStudentList">学生列表</a></li>
			          		</ul>
			            </div>
			        </div>
			    </div>
			</div>
        </div>
        <div class="col-sm-9  col-md-10  main"  style="margin-top:40px;" >

        	<div  id="div1" style="background-color:#FFFFE0;padding-top:10px;padding-left:50px; height:543px;">				  
				<h1>添加学生</h1>
				

				   <div style="width:750px;height:400px;background-color:white;padding:6px;padding-left:250spx;margin-left:80px;border:2px solid black;">
					<form class="bs-example bs-example-form" role="form" style="padding:15px;margin-left:158px;">
						<div class="input-group">
							<span class="input-group-addon">学号</span>
							<input type="text" class="form-control" style="width:300px;"id="sid">
						</div>
					    <br>
					    <div class="input-group">
							<span class="input-group-addon">姓名</span>
							<input type="text" class="form-control"style="width:300px;"id="sname">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon">初始密码</span>
							<input type="text" class="form-control"style="width:275px;"id="psw">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon">手机号码</span>
							<input type="text" class="form-control"style="width:275px;"id="phone">	
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon">教师号</span>
							<input type="text" class="form-control" style="width:290px;"id="tid">
						</div>
					    <br>
					    <div class="input-group">
							<span class="input-group-addon">实验室号</span>
							<input type="text" class="form-control" style="width:275px;"id="lid">
						</div>
					    <br>
					    
					<input type="submit" value="提交" class="btn btn-info" style="margin-left:217px;"  onclick="addstudent()">
				  <input type="reset" value="重置" class="btn btn-info" style="margin-left:26px;">
				</form>
		</div>
		</div>
		</div>
	</div>
</div>

 <script type="text/javascript">

 
        //添加学生
		function addstudent(){					
			
			var sid=$("#sid").val();
		    var sname=$("#sname").val();
		    var psw=$("#psw").val();
		    var phone=$("#phone").val();
		    var tid=$("#tid").val();
		    var lid=$("#lid").val();
			if(sid=="")
			{
				alert("请输入学号！");
				return false;				
			}
			
			if(sname=="")
				{
				alert("请输入学生姓名！");
				return false;
				}
			if(psw=="")
			{
			alert("请输入密码！");
			return false;
			}
			if(phone=="")
			{
			alert("请输入手机号码！");
			return false;
			}
			if(tid=="")
			{
			alert("请输入教师号！");
			return false;
			}
			if(lid=="")
			{
			alert("请输入实验室号！");
			return false;
			}
		    var server="/teacher/addStudent";
			var datas={};			
			datas["sid"] = $("#sid").val();
			datas["sname"] =  $("#sname").val();		
			datas["psw"] =  $("#psw").val();
			datas["phone"] =  $("#phone").val();
			datas["tid"] =  $("#tid").val();
			datas["lid"] =  $("#lid").val();
			$.ajax({
	    	    type: "post",
	    	    dataType : "json",
	    	    url: server,
	    	    data: datas,    	   
	    	    success: function(result) {
	    	    	if(result.code==0){
	    	    		alert(result.message);
	    	    		window.location.href="/teacher/teacherIndex";
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


