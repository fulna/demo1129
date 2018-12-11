var server = "http://localhost:8080/wx/";


function goback(){
	/*window.history.go(-1);
	location.reload();*/
	self.location=document.referrer;
}

function scrollTOEnd(){
	var h=$(document).height()-$(window).height();
	$(document).scrollTop(h);
}

function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return decodeURI(r[2]);
	return null;
}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var strHour=date.getHours();
    var strMinute = date.getMinutes();
    var strSeconds=date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if(strHour>=0&&strHour<=9){
 	   strHour="0"+strHour
    }
    if(strMinute>=0&&strMinute<=9){
 	   strMinute="0"+strMinute;
    }
    if(strSeconds>=0&&strSeconds<=9){
 	   strSeconds="0"+strSeconds;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + strHour + seperator2 + strMinute
            + seperator2 + strSeconds;
    return currentdate;
} 
function groupParams(params){
	alert(params.length);
	var result = {};
	for(var i = 0;i<params.length;i++){
		  if(params[i].name!=undefined){	  
			  result[params[i].name] = params[i].value;
			  alert(params[i].name+" "+params[i].value);
		  }
	}
	return result;
}
function groupParams2(params){
	alert(params.length);
	var result = {};
	for(var i = 0;i<params.length;i++){
		  if(result[params[i].name]==undefined){	  
			  result[params[i].name] = params[i].value;
		  }else{
			  result[params[i].name] = result[params[i].name] + params[i].value;
		  }
	}
	return result;
}