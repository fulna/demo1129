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
	<script type="text/javascript" src="/js/handlebars-1.0.0.beta.6.js"></script>
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
           <li><a href="#" >学生</a></li>
          <li><span class="glyphicon glyphicon-log-out"style="font-size:0.9em;color:white;margin-left:0px;margin-top:18px;"></span></li>
          <li><a href="/student/relogin" >安全退出</a></li>
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
			               		<li><a href="/student/studentLookMyReportList">我的报告 </a></li>
			               		<li ><a href="/student/studentWriteReport">填写报告 </a></li>
			            		<li ><a href="/student/studentLookLabReportList">实验室报告 </a></li>
			            		<li ><a href="/student/studentLookShareReportList">分享报告 </a></li>
			          		</ul>
			            </div>
			        </div>
			    </div>
			</div>
        </div>
        <div class="col-sm-9  col-md-10  main"  style="margin-top:40px;" >
        	<div  id="report" style="background-color:#FFFFE0;padding-top:15px;padding-left:40px; height:563px;">

			</div>		
		</div>	
	</div>
	</div>
	<script type="text/template" id="reportdetail">   	
					   <div id="div2" style="padding-top:10px;width:100%; height:40px;font-size:26px;font-weight:bold;margin-bottom:10px;	">填写报告</div>
				   <div id="div3" style="border:1px solid #000;width:100%; height:480px;padding:15px;">
				   		<div id="div4" style="width:48%;height:95%;padding:25px;padding-left:30px;float:left;"> 
				   			<div id="div6" style="width:100%;height:45%;">
				   					<form role="form">
										<div class="form-group">
											<label for="name">1.上周计划：</label>
											<textarea class="form-control" rows="6" id="lastplan" name="lastplan" readonly="readonly">{{lastplan}}</textarea>
										</div>
									</form>
				   			</div>
				   			<div id="div7" style="width:100%;height:45%;">
								<form role="form">
										<div class="form-group">
											<label for="name">2.上周困难：</label>
											<textarea class="form-control" rows="6" id="lastproblem" name="lastproblem" readonly="readonly">{{lastproblem}}</textarea>
										</div>
									</form>
				   			</div>
				   		</div>
				   		<div id="div5" style="width:48%;height:95%;padding:10px;padding-top:25px;float:left;"> 
				   			<div id="div8" style="width:100%;height:33%;">
				   					<form role="form">
										<div class="form-group">
											<label for="name">3.本周完成情况：</label>
											<textarea class="form-control" rows="4" id="thistask"></textarea>
										</div>
									</form>
				   			</div>
				   			<div id="div9" style="width:100%;height:33%;">
				   					<form role="form">
										<div class="form-group">
											<label for="name">4.本周遇到困难 ：</label>
											<textarea class="form-control" rows="4" id="thisproblem"></textarea>
										</div>
									</form>
				   			</div>
				   			<div id="div10" style="width:100%;height:33%;"> 
				   					<form role="form">
										<div class="form-group">
											<label for="name">5.下周计划：</label>
											<textarea class="form-control" rows="4" id="nextplan"></textarea>
										</div>
									</form>
				   			</div>
				   		</div>	
				   		<div id="div11" style="width:100%; height:20px;padding-left:40%;">
						 		 <button type="button" class="btn btn-primary" onclick="writereport()">提交报告</button>
				   		</div>			   		
				   </div>
		
</script>	
	
<script type="text/javascript">
		$(document).ready( function () {
			var server = "/student/studentGetLastReport";
			var datas = {};
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
		}
		);

		function writereport(){					
			
			var thistask=$("#thistask").val();
			var thisproblem=$("#thisproblem").val();	
			var nextplan=$("#nextplan").val();
			if(thistask=="")
			{
				alert("请输入本周已完成的任务！");
				return false;				
			}
			
			if(thisproblem=="")
				{
				alert("请输入本周遇到的困难！");
				return false;
				}
			if(nextplan=="")
			{
			alert("请输入下周计划！");
			return false;
			}
			var server="/student/writereport";
			var datas={};			
			datas["thistask"] = $("#thistask").val();
			datas["thisproblem"] =  $("#thisproblem").val();		
			datas["nextplan"] =  $("#nextplan").val();	
			$.ajax({
	    	    type: "post",
	    	    dataType : "json",
	    	    url: server,
	    	    data: datas,    	   
	    	    success: function(result) {
	    	    	if(result.code==0){
	    	    		alert(result.message);
	    	    		window.location.href="/student/studentIndex";
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


