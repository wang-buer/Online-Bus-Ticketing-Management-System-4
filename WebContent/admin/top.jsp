<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Sysuser"%>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<LINK href="/b2csys/admin/css/test.css" rel=stylesheet>
	<script language = "JavaScript" src = "/b2csys/admin/js/test.js"></script>
	 <LINK rel=stylesheet type=text/css href="commfiles/css.css">
  </head>
  <%Sysuser admin = (Sysuser)session.getAttribute("admin");   %> 
  <body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="table2">
		  <tr>
		    <td align="left" width="7%" ><img src="/b2csys/admin/images/adminlogo.png" width="286" height="55"></td>
		    <td width="62%" background="/b2csys/admin/images/top_bg.gif">　</td>
		    <td width="31%" background="/b2csys/admin/images/top_r.gif" align="right">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		  </tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td  align="left" height="32">
		    	<!-- 如果登陆 开始-->
				<%if(admin!=null){ %>
				
				<center>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width="1008" align=center>
        <TBODY>
        <TR>
          <TD width=7><IMG src="files/me.jpg" width=7 
height=35></TD>
          <TD background=files/me1.jpg width=1000 align=right>
            <TABLE class=meun border=0 cellSpacing=0 cellPadding=0 width="96%" 
            align=center>
              <TBODY>
              <TR>
                <TD width=80 align=middle><A 
                  href="admin/notice.jsp">公告管理</A> </TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/product.jsp">车票管理</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/orders.jsp">订单管理</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/ordersth.jsp">退票管理</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/kcrecord.jsp">流水记录</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/kcview.jsp">余票盘点</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/msg.jsp">留言管理</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/member.jsp">会员管理</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/imgadv.jsp">图片广告</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="admin/adminPwdEdit.jsp">密码修改</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="adminExit.action">安全退出</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>

                </TR></TBODY></TABLE></TD>
          <TD width=7><IMG src="files/me3.jpg" width=7 
          height=35></TD></TR></TBODY></TABLE>
          
				 
				<%} %>
				<!-- 如果登陆 结束 -->
		    </td>
		  </tr>
		</table>

		<table cellspacing="1" cellpadding="3" align="center" border="0" width="98%">
		<tr>
		<td width="65%"><BR>
		>> 欢迎访问 <b>网上客车售票系统后台</b> </td>
		<td width="35%" align="right">
			
		</td></tr></table>
  </body>
</html>

