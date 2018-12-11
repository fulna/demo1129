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
    <script src="/js/echarts/echarts.min.js"></script>
    <script src="/js/echarts/infographic.js"></script>
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

        	<div  id="div1" style="background-color:#FFFFE0;padding-top:60px;padding-left:50px; height:543px;">
				  <div id="main" style="width:950px;height:550px;"></div>  
				  <div id="main2" style="width:800px;height:500px;;margin-left:30px;margin-top:40px;"></div> 
			</div>		
		</div>	
	</div>
	</div>

  <script type="text/javascript">
   $(function(){
<%-- 	   	<%  HttpSession s = request.getSession();%>
	   	var AdminSuper='<%=s.getAttribute("AdminSuper") %>';
	   	var AdminData='<%=s.getAttribute("AdminData") %>';

	   	if(AdminSuper=='0' && AdminData=='0'){
	   		alert("无管理权限！");
	   		window.location.href="http://www.lsdfj.com/wx/adminIndex.jsp";    
	   	}else{ --%>
	        // 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'),'roma');
		var myChart2 = echarts.init(document.getElementById('main2'),'roma');
		// 指定图表的配置项和数据
		
	    myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
	       
	    myChart2.showLoading(); 
	    var server="/teacher/countReport";
	    var names=[];    //类别数组（实际用来盛放X轴坐标值）   饼图
	    var nums=[];    //销量数组（实际用来盛放Y坐标值）
	    
	    var names2=[];    //类别数组（实际用来盛放X轴坐标值）  条形图
	    var nums2=[]; 
	    
	    $.ajax({
	    type : "post",
	    async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
	    url : server ,   //请求发送到TestServlet处
	    data : {},
	    dataType : "json",        //返回数据形式为json
	    success : function(result) {
	        //请求成功时执行该函数内容，result即为服务器返回的json对象
	        if (result) {
	        	
	        		//饼图
	               for(var i=0;i<result.length;i++){       
	                  names.push(result[i].name);    //挨个取出类别并填入类别数组                
	                  nums.push({
	                    name: result[i].name,
	                    value: result[i].number
	                });
	                }
	
	               myChart.hideLoading();    //隐藏加载动画
	               myChart.setOption({        //加载数据图表
	            	   title : {
	           	        text: '周报告管理系统数据',
	           	        subtext: '评分分布',
	           	        x:'center'
	           	    },
	           	    tooltip : {
	           	        trigger: 'item',
	           	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	           	    },
	           	    legend: {
		           	     type: 'scroll',
		                 orient: 'vertical',		                 
		                 right: 0,
		                 top: 100,
		                 bottom: 20,
	           	         data: names                 //填充类别数据
	           	    },
            	    toolbox: {
            	    	  show : true,
	            	        feature : {
	            	            mark : {show: true},
	            	            dataView : {show: true, readOnly: false},
	            	            magicType : {
	            	                show: true,
	            	                type: ['pie', 'funnel']
	            	            },
	            	            saveAsImage : {show: true}
	            	        }
            	    },
	           	    series : [
	           	        {
	           	            name: '周报告管理系统',
	           	            type: 'pie',             //设置为饼图
	           	            radius : '70%',           //设置饼图半径
	           	            center: ['49%', '52%'],   //设置饼图的位置
	           	            data:nums				  //填充数量数据
	           	        }]       	   
	               });
	               
	               //条形图
	               for(var i=0;i<result.length;i++){       
	                   names2.push(result[i].name);    //挨个取出类别并填入类别数组
	                 }
	                for(var i=0;i<result.length;i++){       
	                    nums2.push(result[i].number);    //挨个取出销量并填入销量数组
	                  }
	                myChart2.hideLoading();    //隐藏加载动画
		       		myChart2.setOption({   //条形图
		    			 color: ['#569854'],
		    			 title: {
		    			        text: '评分分布',
		    			        subtext: ''
		    			    },
		    			    tooltip: {
		    			        trigger: 'axis',
		    			        axisPointer: {
		    			            type: 'shadow'
		    			        }
		    			    },
		    			    legend: {
		    			       
		    			    },
		    			    grid: {
		    			        left: '3%',
		    			        right: '4%',
		    			        bottom: '3%',
		    			        containLabel: true
		    			    },
		    			    xAxis: {
		    			        type: 'category',
		    			        data: names2
		    			    },
		    			    yAxis: {

		    			        type: 'value',
		    			        boundaryGap: [0, 0.01]
		    			    },
		            	    toolbox: {
		            	    	  show : true,
			            	        feature : {
			            	            mark : {show: true},
			            	            dataView : {show: true, readOnly: false},
			            	            magicType : {
			            	                show: true,
			            	                type: ['pie', 'funnel']
			            	            },
			            	            saveAsImage : {show: true}
			            	        }
		            	    },
		    			    series: [{	  
		    			            name: '评分',
		    			            type: 'bar',
		    			            data: nums2
		    			    	}
		    			    ]
		    		
	                });        
               
        }
    
   },
    error : function(errorMsg) {
        //请求失败时执行该函数
    alert("图表请求数据失败!");
    myChart.hideLoading();
    myChart2.hideLoading();
    }
   
})
/*  } */
   	
   }); 
</script>

 
  </body>
</html>


