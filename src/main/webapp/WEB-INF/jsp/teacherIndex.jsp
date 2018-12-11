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
          <li><a href="http://www.lsdfj.com/wx/admin/relogin" >安全退出</a></li>
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

        	<div  id="div1" style="background-color:#FFFFE0;padding-top:60px;padding-left:50px; height:543px;">
				    <div style="margin-top:170px;margin-left:240px;font-size:60px;color:#d1d1d1;">研究生周报告管理系统</div>  
			</div>		
		</div>	
	</div>
	</div>



 
  </body>
</html>


