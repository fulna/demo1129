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


<title>导师查看报告列表</title>

<!-- Bootstrap core CSS -->

<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/handlebars-1.0.0.beta.6.js"></script>
<!--第一步：引入Javascript / CSS （CDN）-->
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>

</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">研究生周报告管理系统</a>
		</div>

		<div id="navbar" class="navbar-collapse collapse"
			style="margin-right: 20px;">
			<ul id="orderwhite" class="nav navbar-nav navbar-right">
				<li><a href="#">导师</a></li>
				<li><span class="glyphicon glyphicon-log-out"
					style="font-size: 0.9em; color: white; margin-left: 0px; margin-top: 18px;"></span></li>
				<li><a href="/teacher/relogin">安全退出</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="divider" style="margin-top: 20px;"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="panel-group" id="accordion" style="margin-top: 40px;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree" style="text-decoration: none;">报告管理</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<ul class="nav nav-sidebar">
									<li><a href="/teacher/teacherLookStudentReportList">学生报告</a></li>
									<li><a href="/teacher/teacherLookLabReportList">实验室报告</a></li>
									<li><a href="/teacher/teacherCountReport">统计报告 </a></li>
									<li ><a href="/teacher/teacherLookShareReportList">分享报告 </a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseFour" style="text-decoration: none;">导师管理</a>
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
			<div class="col-sm-9  col-md-10  main" style="margin-top: 40px;">

				<div id="div1"
					style="background-color: #FFFFE0; padding-top: 60px; padding-left: 50px; height: 543px;">
					<div id="div1"
						style="background-color: #FFFFE0; padding-top: 15px; padding-left: 40px; height: 563px;">
						<!--第二步：添加如下 HTML 代码-->
						<table id="tableData" class="display">
							<thead>
								<tr>
									<th>报告编号</th>
									<th>学生姓名</th>
									<th>学生成绩</th>
									<th>操作</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModalReport" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"
				style="width: 840px; height: 580px; margin-right: 100px; padding: 0px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="editModalLabel">查看学生报告</h4>
				</div>
				<div id="report" style="margin-top: 15px;"></div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModalSharePeople" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"
				style="width: 300px; height: 220px; margin-right: 100px; padding: 0px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="editModalLabel">选择分享对象</h4>
				</div>
				<div id="reportpeople" style="margin-top: 15px;">
					<div id="div23" style="width:100%; height:60px;padding-left:20%;float:left;">
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalShareToTeacher" id="shareTeacher" name="shareTeacher">分享给老师</button>
					</div>
					<div id="div24" style="width:100%; height:60px;padding-left:20%;float:left;">
						<button type="button"  class="btn btn-info btn-lg"  data-toggle="modal" data-target="#myModalShareToStudent" id="shareStudent" name="shareStudent" style="margin-top:10px;">分享给学生</button>
					</div>		
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModalShareToTeacher" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"
				style="width: 400px; height:360px; margin-right: 100px; padding: 0px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="editModalLabel">导师列表</h4>
				</div>
				<div id="reportshare" style="margin-top: 15px;">
					<div id="div1" style="background-color: #FFFFE0; padding-top: 15px; padding-left: 40px; height:240px;">
						<select id="allteachername" name="allteachername"  style="width:100px;">
						</select>
					</div>
					<div id="div20" style="width:100%; height:20px;padding-left:40%;float:left;">
						<button type="button" class="btn btn-primary" id="shareReportToTeacher" name="shareReportToTeacher"  >分享</button>
					</div>	
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModalShareToStudent" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"
				style="width: 400px; height: 360px; margin-right: 100px; padding: 0px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="editModalLabel">学生列表</h4>
				</div>
				<div id="reportshare" style="margin-top: 15px;">
					<div id="div1" style="background-color: #FFFFE0; padding-top: 15px; padding-left: 40px; height: 240px;">
						<select id="allname" name="allname"  style="width:100px;">
						</select>
					</div>
					<div id="div20" style="width:100%; height:20px;padding-left:40%;float:left;">
						<button type="button" class="btn btn-primary" id="shareReportToStudent" name="shareReportToStudent"  >分享</button>
					</div>	
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
<script type="text/template" id="reportdetail">   	
	<div id="div1"
		style="background-color: #FFFFE0; padding-top: 15px; padding-left: 40px; height: 590px;">
		<div id="div3"
			style="border: 1px solid #000; width: 95%; height: 480px;">
			<div id="div4"
				style="width: 48%; height: 95%; padding: 25px; padding-left: 30px; float: left;">
				<div id="div6" style="width: 100%; height: 45%;">
					<form role="form">
						<div class="form-group">
							<label for="name">1.上周计划：</label>
							<textarea class="form-control" rows="6" id="lastplan" readonly="readonly">{{lastplan}}</textarea>
						</div>
					</form>
				</div>
				<div id="div7" style="width: 100%; height: 45%;">
					<form role="form">
						<div class="form-group">
							<label for="name">2.上周困难：</label>
							<textarea class="form-control" rows="6" id="lastproblem" readonly="readonly">{{lastproblem}}</textarea>
						</div>
					</form>
				</div>
			</div>
			<div id="div5"
				style="width: 48%; height: 95%; padding: 10px; padding-top: 25px; float: left;">
				<div id="div8" style="width: 100%; height: 33%;">
					<form role="form">
						<div class="form-group">
							<label for="name">3.本周完成情况：</label>
							<textarea class="form-control" rows="4" id="thistask" readonly="readonly">{{thistask}}</textarea>
						</div>
					</form>
				</div>
				<div id="div9" style="width: 100%; height: 33%;">
					<form role="form">
						<div class="form-group">
							<label for="name">4.本周遇到困难 ：</label>
							<textarea class="form-control" rows="4" id="thisproblem" readonly="readonly">{{thisproblem}}</textarea>
						</div>
					</form>
				</div>
				<div id="div10" style="width: 100%; height: 33%;">
					<form role="form">
						<div class="form-group">
							<label for="name">5.下周计划：</label>
							<textarea class="form-control" rows="4" id="nextplan" readonly="readonly">{{nextplan}}</textarea>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="div12" style="width:100%; height:80px;padding:10px;padding-left:35px;">
			<div id="div13" style="width:300px;height:50px;float:left;">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label style="width:75px;float:left">导师评分</label>
						<div  style="width:70%;float:left;" >
							<textarea  rows="1" id="score" readonly="readonly">{{grade}}</textarea>
						</div>
					</div>
				</form>
			</div>
			<div id="div14" style="width:300px;height:100%;float:left;">
				<form class="form-inline" role="form">
					<div class="form-group" >
						<label  style="width:30%;float:left">导师评语</label>
						<div  style="width:70%;float:left;">
							<textarea style="width:300px;"  rows="3" id="comment" readonly="readonly">{{comment}}</textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</script>

<script type="text/template" id="commentreport">   	
	<div id="div1"
		style="background-color: #FFFFE0; padding-top: 15px; padding-left: 40px; height: 620px;">
		<div id="div3"
			style="border: 1px solid #000; width: 95%; height: 480px;">
			<div id="div4" style="width: 48%; height: 95%; padding: 25px; padding-left: 30px; float: left;">
				<div id="div6" style="width: 100%; height: 45%;">
					<form role="form">
						<div class="form-group">
							<label for="name">1.上周计划：</label>
							<textarea class="form-control" rows="6" id="lastplan" readonly="readonly">{{lastplan}}</textarea>
						</div>
					</form>
				</div>
				<div id="div7" style="width: 100%; height: 45%;">
					<form role="form">
						<div class="form-group">
							<label for="name">2.上周困难：</label>
							<textarea class="form-control" rows="6" id="lastproblem" readonly="readonly">{{lastproblem}}</textarea>
						</div>
					</form>
				</div>
			</div>
			<div id="div5"
				style="width: 48%; height: 95%; padding: 10px; padding-top: 25px; float: left;">
				<div id="div8" style="width: 100%; height: 33%;">
					<form role="form">
						<div class="form-group">
							<label for="name">3.本周完成情况：</label>
							<textarea class="form-control" rows="4" id="thistask" readonly="readonly">{{thistask}}</textarea>
						</div>
					</form>
				</div>
				<div id="div9" style="width: 100%; height: 33%;">
					<form role="form">
						<div class="form-group">
							<label for="name">4.本周遇到困难 ：</label>
							<textarea class="form-control" rows="4" id="thisproblem" readonly="readonly">{{thisproblem}}</textarea>
						</div>
					</form>
				</div>
				<div id="div10" style="width: 100%; height: 33%;">
					<form role="form">
						<div class="form-group"><div id="rid" name="rid" style="display:none">{{rid}}</div> 
							<label for="name">5.下周计划：</label>
							<textarea class="form-control" rows="4" id="nextplan" readonly="readonly">{{nextplan}}</textarea>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="div12" style="width:100%; height:150px;padding:10px;padding-left:35px;">
			<div id="div13" style="width:100%;height:70px;float:left;">
			    <div id="div14" style="width:40%;height:50px;float:left;">
					<form class="form-horizontal" role="form">
					<div class="form-group">
						<label style="width:75px;float:left">导师评分</label>
						<div  style="width:120px;float:left;" >
						 <select  dir="rtl" id="grade"  name="grade" style="width:70px;">
              			   <option value =""></option>
                           <option value ="1">1分</option>
						   <option value ="2">2分</option>
						   <option value ="3">3分</option>			    
						   <option value ="4">4分</option>
						   <option value ="5">5分</option>
					       <option value ="6">6分</option>
					       <option value ="7">7分</option>
					       <option value ="8">8分</option>
						   <option value ="9">9分</option>
						   <option value ="10">10分</option>
                         </select>
						</div>
					</div>
				</form>
			</div>
			<div id="div15" style="width:55%;height:100%;float:left;">
				<form class="form-inline" role="form">
					<div class="form-group" >
						<label  style="width:30%;float:left">导师评语</label>
						<div  style="width:70%;float:left;">
							<textarea style="width:300px;"  rows="3" id="comment" name="comment"></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="div16" style="width:100%; height:20px;padding-left:40%;float:left;">
			<button type="button" class="btn btn-primary" onclick="comment({{rid}})">提交</button>
		</div>	
	</div>
</script>
	<script type="text/javascript">
		$(document).ready( function () {
		    var datatable = $('#tableData').DataTable( {
		    	"processing": true,//数据加载时显示进度条
		    	"searching": true,//启用搜索功能
		    	"serverSide": true,//启用服务端分页（这是使用Ajax服务端的必须配置）
		        ajax: {
		            url: '/teacher/lookreportlist',
		            dataSrc: 'data'
		        },
		        columns: [
		                  { data: 'rid' },
		                  { data: 'sname' },
		                  { data: 'grade' },
 		                  { data: null,"render":function(data,type,row,meta){
								var html = "<button   id='toLookReport' name='toLookReport' class='btn btn-info btn-xs'  data-toggle='modal' data-target='#myModalReport' style='margin:0px;margin-right:3px;'  >查看</button><button   id='toCommentReport' name='toCommentReport' class='btn btn-warning btn-xs'  data-toggle='modal' data-target='#myModalReport' style='margin:0px;margin-right:3px;'  >评分</button><button id='toShareReport' name='toShareReport' data-toggle='modal' data-target='#myModalSharePeople' class='btn btn-danger btn-xs' style='margin:0px;margin-right:3px;'>分享</button><button id='toExportReport' name='toExportReport' class='btn btn-success btn-xs' style='margin:0px;'>导出</button>";
		                  	  	return html;
 		                  	}
		                  }                 
		              ]
		    } );
		} 
		);
		
		$(document).ready( function (){		  //学生列表			
			var datas={};
			var server="/teacher/getStudentListname";						
			$.ajax({
	    	    type: "post",
	    	    dataType : "json",
	    	    url: server,
	    	    data: datas,    	   
	    	    success: function(result) {
	    	    	 for (var i = 0; i < result.data.length; i++) {   					     
						  	$("#allname").append("<option"+" "+"value="+result.data[i]+">"+result.data[i]+"</option>");
						} 
	    	    }
	        });
		  }
		);
		
		$(document).ready( function (){			//导师列表	
			var datas={};
			var server="/teacher/getTeacherListname";						
			$.ajax({
	    	    type: "post",
	    	    dataType : "json",
	    	    url: server,
	    	    data: datas,    	   
	    	    success: function(result) {
	    	    	 for (var i = 0; i < result.data.length; i++) {   					     
						  	$("#allteachername").append("<option"+" "+"value="+result.data[i]+">"+result.data[i]+"</option>");
						} 
	    	    }
	        });
		  }
		);

		$(document).on("click", "#toLookReport", function(se) {
			var $select = $(this).parent().parent();
			var rData = $('#tableData').DataTable().row($select).data();
			var server = "/teacher/teacherGetReportByRid";
			var datas = {};
			datas["rid"] = rData.rid;
			datas["sname"] = rData.sname;
			datas["grade"] = rData.grade;
			$.ajax({
				type : "post",
				dataType : "json",
				url : server,
				data : datas,
				success : function(data) {
					//用zepto获取模板              
					var tpl = $("#reportdetail").html();
					//预编译模板
					var template = Handlebars.compile(tpl);
					//匹配json内容
					var html = template(data);
					//插入模板,到ul中
					$('#report').html(html);
				}
			})
		});
		
		$(document).on("click", "#toCommentReport", function(se) {

			var $select = $(this).parent().parent();
			var rData = $('#tableData').DataTable().row($select).data();
			var grade =rData.grade;
			var server ;
			if(grade!="" && grade!= null ){
				alert("该报告已评阅！");
				var server = "/teacher/teacherGetReportByRid";
				var datas = {};
				datas["rid"] = rData.rid;
				datas["sname"] = rData.sname;
				datas["grade"] = rData.grade;
				$.ajax({
					type : "post",
					dataType : "json",
					url : server,
					data : datas,
					success : function(data) {
						//用zepto获取模板              
						var tpl = $("#reportdetail").html();
						//预编译模板
						var template = Handlebars.compile(tpl);
						//匹配json内容
						var html = template(data);
						//插入模板,到ul中
						$('#report').html(html);
					}
				})	
			}else{
				var server = "/teacher/teacherGetReportByRid";
				var datas = {};
				datas["rid"] = rData.rid;
				datas["sname"] = rData.sname;
				datas["grade"] = rData.grade;
				$.ajax({
					type : "post",
					dataType : "json",
					url : server,
					data : datas,
					success : function(data) {
						//用zepto获取模板              
						var tpl = $("#commentreport").html();
						//预编译模板
						var template = Handlebars.compile(tpl);
						//匹配json内容
						var html = template(data);
						//插入模板,到ul中
						$('#report').html(html);
					}
				})				
			}  //else			
		});
		
		$(document).on("click", "#toShareReport", function(se) {
			var $select = $(this).parent().parent();
			var rData = $('#tableData').DataTable().row($select).data();		
			var server = "/teacher/getShareReportRid";
			var datas = {};
			datas["rid"] = rData.rid;
			datas["sname"] = rData.sname;
			datas["grade"] = rData.grade;
			$.ajax({
				type : "post",
				dataType : "json",
	    	    url: server,
	    	    data: datas,    	   
	    	    success: function(result) {
	    	    	
	    	    }
			});
		});
		
		
		
		$(document).on("click", "#toExportReport", function(se) {
			var $select = $(this).parent().parent();
			var rData = $('#tableData').DataTable().row($select).data();
			var server = "/teacher/teacherExportReportByRid";
			var datas = {};
			datas["rid"] = rData.rid;
			datas["sname"] = rData.sname;
			datas["grade"] = rData.grade;
			$.ajax({
				type : "post",
				dataType : "json",
				url : server,
				data : datas,
				success : function(result) {
					if(result.code==0){
	    	    		alert(result.message);
	    	    		window.location.href="/teacher/teacherLookStudentReportList";
	    	    	}else{
	    	    		alert(result.message);
	    	    		return false;		
	    	    	}
				}
			})
		});
		
		
		$(document).on("click", "#shareReportToStudent", function(se) {   //分享给学生
			var server = "/teacher/shareInformationStoreToStudent";
			var datas = {};
			datas["sname"] = $("#allname").val();;
			$.ajax({
				type : "post",
				dataType : "json",
				url : server,
				data : datas,
				success : function(result) {
					if(result.code==0){
	    	    		alert(result.message);
	    	    		window.location.href="/teacher/teacherLookStudentReportList";
	    	    	}else{
	    	    		alert(result.message);
	    	    		return false;		
	    	    	}
				}
			})
		});
		
		$(document).on("click", "#shareReportToTeacher", function(se) {    //分享给导师
			var server = "/teacher/shareInformationStoreToTeacher";
			var datas = {};
			datas["tname"] = $("#allteachername").val();;
			$.ajax({
				type : "post",
				dataType : "json",
				url : server,
				data : datas,
				success : function(result) {
					if(result.code==0){
	    	    		alert(result.message);
	    	    		window.location.href="/teacher/teacherLookStudentReportList";
	    	    	}else{
	    	    		alert(result.message);
	    	    		return false;		
	    	    	}
				}
			})
		});
			
	function comment(rid){	
		
				var grade=$("#grade").val();
				var comment=$("#comment").val();					
				if(grade=="")
				{
					alert("请输入评分！");
					return false;				
				}
				
				if(comment=="")
					{
					alert("请输入评语！");
					return false;
					}
				var server="/teacher/commentReportByRid";
				var datas={};			
				datas["rid"] =rid;
				datas["grade"] =  $("#grade").val();		
				datas["comment"] =  $("#comment").val();	
				$.ajax({
		    	    type: "post",
		    	    dataType : "json",
		    	    url: server,
		    	    data: datas,    	   
		    	    success: function(result) {
		    	    	if(result.code==0){
		    	    		alert(result.message);
		    	    		window.location.href="/teacher/teacherLookStudentReportList";
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
