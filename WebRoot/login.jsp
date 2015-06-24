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
	<script type="text/javascript">
	$().ready(function() {
		var editor = CKEDITOR.replace('ckeditor');
        /* CKEDITOR.replace('ckeditor',
		{
		    extraPlugins: 'bbcode',
		    removePlugins: 'bidi,button,dialogadvtab,div,filebrowser,flash,format,forms,horizontalrule,iframe,indent,justify,liststyle,pagebreak,showborders,stylescombo,table,tabletools,templates',
		    toolbar:
		    [
		        ['Source', '-', 'Save', 'NewPage', '-', 'Undo', 'Redo'],
		        ['Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
		        ['Link', 'Unlink', 'Image'],
		        '/',
		        ['FontSize', 'Bold', 'Italic', 'Underline'],
		        ['NumberedList', 'BulletedList', '-', 'Blockquote'],
		        ['TextColor', '-', 'Smiley', 'SpecialChar', '-', 'Maximize']
		    ],
		    smiley_images:
		    [
		        'regular_smile.gif', 'sad_smile.gif', 'wink_smile.gif', 'teeth_smile.gif', 'tounge_smile.gif',
		        'embaressed_smile.gif', 'omg_smile.gif', 'whatchutalkingabout_smile.gif', 'angel_smile.gif', 'shades_smile.gif',
		        'cry_smile.gif', 'kiss.gif'
		    ],
		    smiley_descriptions:
		    [
		        'smiley', 'sad', 'wink', 'laugh', 'cheeky', 'blush', 'surprise',
		        'indecision', 'angel', 'cool', 'crying', 'kiss'
		    ]
		}); */
	});
	</script>
  </head>
  
  <body>
    <form action="<%=basePath%>login" method="post">
    	<textarea rows="30" cols="60" class="ckeditor" id="ckeditor" name="ckeditor"></textarea>
    	<input type="submit" value="登录">
    </form>
  </body>
</html>
