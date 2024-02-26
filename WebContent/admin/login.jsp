<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上客车售票系统后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<LINK href="/b2csys/admin/css/test.css" rel=stylesheet>
	<script language = "JavaScript" src = "/b2csys/admin/js/test.js"></script>
  </head>
  
  <body onLoad="MM_preloadImages('/b2csys/admin/images/index_on.gif','/b2csys/admin/images/reg_on.gif','/b2csys/admin/images/order_on.gif','/b2csys/admin/images/top/topxmas/jp_on.gif','/b2csys/admin/images/top/topxmas/download_on.gif','/b2csys/admin/images/top/topxmas/bbs_on.gif','/b2csys/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <jsp:include page="top.jsp"></jsp:include>



<!--文件体开始-->

		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/b2csys/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>网上售票系统</a> → 管理员登录
                </td>
                </tr>
		</table>
              <br>

	<form action="adminLogin.action" method=post name="login" onsubmit="return ck()">
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle colspan=2 align=center height=25 background="/b2csys/admin/images/bg2.gif" ><font color="#ffffff"><b>输入您的用户名、密码登录</b></font></td>
		</tr>
		<tr>
		<td valign=middle class=tablebody1>请输入您的用户名</td>
			<td valign=middle class=tablebody1><INPUT type=text id="uname" name="uname"  > &nbsp;
			</td>
		</tr>
		<tr>
			<td valign=middle class=tablebody1>请输入您的密码</td>
			<td valign=middle class=tablebody1><INPUT type=password id="upass" name="upass" > &nbsp; </td>
		</tr>
		<tr>
			<td class=tablebody2 valign=middle colspan=2 align=center><input type=submit value="登 录" ></td>
		</tr>
		</table>
	</form>
<!--文件尾开始-->
<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
     <script type="text/javascript">
     	function ck(){
     		if(f1.uname.value==""){
     			alert("用户名不能为空");
     			return false;
     		}if(f1.upass.value==""){
     			alert("密码不能为空");
     			return false;
     		}
     	}
     	
		<%
		String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("用户名或密码错误");
		 <%}%>
     </script>