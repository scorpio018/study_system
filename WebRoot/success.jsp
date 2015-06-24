<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/ckeditor/ckeditor.js"></script>
	<script src="/ckeditor/adapters/jquery.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
		$().ready(function() {
			/* var editor = CKEDITOR.replace('ckeditor'); */
			$('textarea#ckeditor').ckeditor();
			ubbtohtml();
		})
		
		function ubbtohtml(){
			str = up($("#result").html());
			$("#htmlresult").html(str);
		}
	
		function up(str){
	
			str = str.replace(/</ig,'&lt;');
			str = str.replace(/>/ig,'&gt;');
			str = str.replace(/\n/ig,'<br />');
			str = str.replace(/\[code\](.+?)\[\/code\]/ig, function($1, $2) {return phpcode($2);});
	
			str = str.replace(/\[hr\]/ig,'<hr />');
			str = str.replace(/\[\/(size|color|font|backcolor)\]/ig,'</font>');
			str = str.replace(/\[(sub|sup|u|i|strike|b|blockquote|li)\]/ig,'<$1>');
			str = str.replace(/\[\/(sub|sup|u|i|strike|b|blockquote|li)\]/ig,'</$1>');
			str = str.replace(/\[\/align\]/ig,'</p>');
			str = str.replace(/\[(\/)?h([1-6])\]/ig,'<$1h$2>');
	
			str = str.replace(/\[align=(left|center|right|justify)\]/ig,'<p align="$1">');
			str = str.replace(/\[size=(\d+?)\]/ig,'<font size="$1">');
			str = str.replace(/\[color=([^\[\<]+?)\]/ig, '<font color="$1">');
			str = str.replace(/\[backcolor=([^\[\<]+?)\]/ig, '<font style="background-color:$1">');
			str = str.replace(/\[font=([^\[\<]+?)\]/ig, '<font face="$1">');
			str = str.replace(/\[list=(a|A|1)\](.+?)\[\/list\]/ig,'<ol type="$1">$2</ol>');
			str = str.replace(/\[(\/)?list\]/ig,'<$1ul>');
	
			str = str.replace(/\[s:(\d+)\]/ig,function($1,$2){ return smilepath($2);});
			str = str.replace(/\[img\]([^\[]*)\[\/img\]/ig,'<img src="$1" border="0" />');
			str = str.replace(/\[url=([^\]]+)\]([^\[]+)\[\/url\]/ig, '<a href="$1">'+'$2'+'</a>');
			str = str.replace(/\[url\]([^\[]+)\[\/url\]/ig, '<a href="$1">'+'$1'+'</a>');
			return str;
		}
	</script>
  </head>
  
  <body>
    	登录成功<br>
    	<div id="result" style="display: none;">${requestScope.ckeditor }</div>
    	<textarea rows="30" cols="60" class="ckeditor" id="ckeditor" name="ckeditor">${requestScope.ckeditor }</textarea>
    	<div id="htmlresult"></div>
  </body>
</html>
