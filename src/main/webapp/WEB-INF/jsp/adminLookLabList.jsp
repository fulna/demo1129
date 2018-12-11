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


<title>管理员查看导师列表</title>

<!-- Bootstrap core CSS -->

<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
				<li><a href="#">管理员</a></li>
				<li><span class="glyphicon glyphicon-log-out"
					style="font-size: 0.9em; color: white; margin-left: 0px; margin-top: 18px;"></span></li>
				<li><a href="/admin/relogin">安全退出</a></li>
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
									href="#collapseThree" style="text-decoration: none;">实验室管理</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseFour" style="text-decoration: none;">导师管理</a>
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
			<div class="col-sm-9  col-md-10  main" style="margin-top: 40px;">

				<div id="div1"
					style="background-color: #FFFFE0; padding-top: 60px; padding-left: 50px; height: 543px;">
					<div id="div1"
						style="background-color: #FFFFE0; padding-top: 15px; padding-left: 40px; height: 563px;">
						<!--第二步：添加如下 HTML 代码-->
						<table id="tableData" class="display">
							<thead>
								<tr>
									<th>实验室号</th>
									<th>实验室方向</th>
									<th>实验室负责人</th>
									<th>具体操作</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModalLabContent" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="margin-top: 100px; margin-left: 240px;">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 360px; height: 260px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="detail-esitpsw">修改实验室方向</h4>
				</div>
				<div id="editContent" style="margin-top: 15px;"></div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModalLabTeacher" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="margin-top: 100px; margin-left: 240px;">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 360px; height: 260px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="editModalLabel">修改实验室负责人</h4>
				</div>
				<div id="editTeacher" style="margin-top: 15px;">
					
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

<script type="text/template" id="detaileditcontent">   		
	<form    id = "form1" class="form-horizontal" role="form" style="width:360px;padding-left:25px;">
		<div class="form-group">
			<label for="lastname" class="col-sm-5 control-label">新实验室方向:</label>
			<div class="col-sm-7" style="width:160px;">
				<input class="form-control" id="newcontent" style="width:150px;"placeholder="请输入实验室新方向">
			</div>
		</div>
	</form>	
	<hr>
	<div class="col-sm-offset-2 col-sm-10">
		<button    class="btn btn-danger btn-xs" data-dismiss="modal" style="margin-left:80px;" onclick="adminEditTLabContent({{lid}})">修改</button>
	</div>
</script>
<script type="text/template" id="detaileditteacher">   		
	<form    id = "form1" class="form-horizontal" role="form" style="width:360px;padding-left:25px;">
		 <div class="form-group">
			 <label for="lastname" class="col-sm-5 control-label">负责人教工号:</label>
			<div class="col-sm-7" style="width:160px;">
				<input class="form-control" id="newtid" style="width:150px;"placeholder="请输入教工号">
			</div>
		</div>		 
		<div class="form-group">
			 <label for="lastname" class="col-sm-5 control-label">负责人姓名:</label>
			<div class="col-sm-7" style="width:160px;">
				<input class="form-control" id="newlname" style="width:150px;"placeholder="请输入姓名">
			</div>
		</div>
	</form>	
	<hr>
	<div class="col-sm-offset-2 col-sm-10">
		<button    class="btn btn-danger btn-xs" data-dismiss="modal" style="margin-left:80px;" onclick="adminEditLabTeacher({{lid}})">修改</button>
	</div>
</script>

<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var datatable = $('#tableData')
									.DataTable(
											{
												"processing" : true,//数据加载时显示进度条
												"searching" : true,//启用搜索功能
												"serverSide" : true,//启用服务端分页（这是使用Ajax服务端的必须配置）
												ajax : {
													url : '/admin/getLookLabList',
													dataSrc : 'data'
												},
												columns : [
														{
															data : 'lid'
														},
														{
															data : 'lcontent'
														},
														{
															data : 'lname'
														},											
														{
															data : null,
															"render" : function(
																	data, type,
																	row, meta) {
																var html = "<button   id='toLabContent' name='toLabContent'  class='btn btn-info btn-xs'  data-toggle='modal' data-target='#myModalLabContent' style='margin:0px;margin-left:3px'  >修改实验方向</button><button   id='toLabTeacher' name='toLabTeacher'  class='btn btn-info btn-xs'  data-toggle='modal' data-target='#myModalLabTeacher' style='margin:0px;margin-left:3px'  >修改负责人</button><button   id='deleteLab' name='deleteLab' class='btn btn-warning btn-xs'  style='margin:0px;margin-left:3px;' >删除</button>";
																return html;
															}
														}

												]
											});
						});

		$(document).on("click", "#toLabContent", function(e) {

			var $select = $(this).parent().parent();
			var rData = $('#tableData').DataTable().row($select).data();

			var server = "/admin/adminGetLabByLid";
			var datas = {};
			datas["lid"] = rData.lid;
			datas["lcontent"] = rData.lcontent;
			datas["lname"] = rData.lname;
			$.ajax({
				type : "post",
				dataType : "json",
				url : server,
				data : datas,
				success : function(data) {
					//用zepto获取模板              
					var tpl = $("#detaileditcontent").html();
					//预编译模板
					var template = Handlebars.compile(tpl);
					//匹配json内容
					var html = template(data);
					//插入模板,到ul中
					$('#editContent').html(html);
				}
			})
		});
		
		$(document).on("click", "#toLabTeacher", function(e) {

			var $select = $(this).parent().parent();
			var rData = $('#tableData').DataTable().row($select).data();

			var server = "/admin/adminGetLabByLid";
			var datas = {};
			datas["lid"] = rData.lid;
			datas["lcontent"] = rData.lcontent;
			datas["lname"] = rData.lname;
			$.ajax({
				type : "post",
				dataType : "json",
				url : server,
				data : datas,
				success : function(data) {
					//用zepto获取模板              
					var tpl = $("#detaileditteacher").html();
					//预编译模板
					var template = Handlebars.compile(tpl);
					//匹配json内容
					var html = template(data);
					//插入模板,到ul中
					$('#editTeacher').html(html);
				}
			})
		});

		$(document).on("click", "#deleteLab", function(e) {
			var $select = $(this).parent().parent();
			var rData = $('#tableData').DataTable().row($select).data();
			var server = "/admin/adminDeleteLab";
			var datas = {};
			datas["lid"] = rData.lid;
			datas["lcontent"] = rData.lcontent;
			datas["lname"] = rData.lname;
			$.ajax({
				type : "post",
				dataType : "json",
				url : server,
				data : datas,
				success : function(result) {
					if (result.code == "0") {
						alert(result.message);
						window.location.reload();
						return false;
					} else {
						alert(result.message);
						return false;
					}
				}
			});
		});
		
		  function adminEditTLabContent(lid){	
			  var newcontent=$("#newcontent").val();
			  
			  if(newcontent=='' ){
				  alert("请输入实验室新方向 ！");
			  }
			  if(confirm("确定修改实验室方向吗？"))  
			  { 
				  
				  var server="/admin/editLabContent";
					
					var datas={};
					datas["lid"] =lid;
					datas["lcontent"] = $("#newcontent").val();
					$.ajax({
					    type: "post",
					    dataType : "json",
					    url: server,
					    data: datas,
					    success: function(result) {
					    	if(result.code=="0"){
					    		alert(result.message);
					    		window.location.reload();
					    		return false;		    		
					    	}else{
					    		alert(result.message);
					    		return false;
					    	}
					    }
			    	});
			  }else{
				  return false;
			  }
	}
		  function adminEditLabTeacher(lid){	
			  var newtid=$("#newtid").val();
			  var newlname=$("#newlname").val();
			  if(newtid ==" ")  
				{
					alert("	请输入实验室负责人的教工号！");
					return false;
				}
			 if(newlname ==" ")  
					{
						alert("	请输入实验室负责人的姓名！");
						return false;
					}
			  if(confirm("确定修改实验室负责人吗？"))  
			  { 
				  
				  var server="/admin/editLabTeacher";
					
					var datas={};
					datas["lid"] =lid;
					datas["tid"] = $("#newtid").val();
					datas["lname"] = $("#newlname").val();
					$.ajax({
					    type: "post",
					    dataType : "json",
					    url: server,
					    data: datas,
					    success: function(result) {
					    	if(result.code=="0"){
					    		alert(result.message);
					    		window.location.reload();
					    		return false;		    		
					    	}else{
					    		alert(result.message);
					    		return false;
					    	}
					    }
			    	});
			  }else{
				  return false;
			  }
	}	  		
	</script>

</body>
</html>


