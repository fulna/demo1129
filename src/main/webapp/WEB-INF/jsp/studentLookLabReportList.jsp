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


<title>学生查看实验室报告列表</title>

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
				<li><a href="#">学生</a></li>
				<li><span class="glyphicon glyphicon-log-out"
					style="font-size: 0.9em; color: white; margin-left: 0px; margin-top: 18px;"></span></li>
				<li><a href="/student/relogin">安全退出</a></li>
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
									href="#collapseFour" style="text-decoration: none;">报告管理</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse">
							<div class="panel-body">
								<ul class="nav nav-sidebar">
									<li><a href="/student/studentLookMyReportList">我的报告 </a></li>
									<li><a href="/student/studentWriteReport">填写报告 </a></li>
									<li><a href="/student/studentLookLabReportList">实验室报告</a></li>
									<li ><a href="/student/studentLookShareReportList">分享报告 </a></li>
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
		aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content"
				style="width: 840px; height: 660px; margin-right: 100px; padding: 0px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="editModalLabel">查看报告</h4>
				</div>
				<div id="report" style="margin-top: 15px;"></div>

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
													url : '/student/looklabreportlist',
													dataSrc : 'data'
												},
												columns : [
														{
															data : 'rid'
														},
														{
															data : 'sname'
														},
														{
															data : 'grade'
														},
														{
															data : null,
															"render" : function(
																	data, type,
																	row, meta) {
																var html = "<button   id='toLookReport' name='toLookReport' class='btn btn-info btn-xs'  data-toggle='modal' data-target='#myModalReport' style='margin:0px;'  >查看</button>";
																return html;
															}
														}

												]
											});
						});

		$(document).on("click", "#toLookReport", function(se) {

			var $select = $(this).parent().parent();
			var rData = $('#tableData').DataTable().row($select).data();

			var server = "/student/studentGetReportByRid";
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

	</script>


</body>
</html>
