<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Notice"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上客车售票系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="网上客车售票系统">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <LINK rel=stylesheet type=text/css href="commfiles/css.css">
<LINK rel=stylesheet type=text/css href="files/style.css">
<STYLE type=text/css>.STYLE3 {
	COLOR: #ffffff
}
</STYLE>

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold
}
.STYLE2 {
	FONT-WEIGHT: bold
}
BODY {
	BACKGROUND-COLOR: #ffffff
}
</STYLE>

<STYLE type=text/css>.STYLE5 {
	FONT-SIZE: 9px
}
</STYLE>

 <LINK rel=stylesheet type=text/css href="files/css.css">
<STYLE type=text/css>BODY {
	MARGIN: 0px
}
</STYLE>
  </head>
  <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); %>
  <body>
    <jsp:include page="top.jsp"></jsp:include>
    <center>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=1006 align=center>
  <TBODY>
  <TR>
    <TD vAlign=top width=188>
    <jsp:include page="left.jsp"></jsp:include>
      </TD>
    <TD vAlign=top width=787>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" height=5>
        <TBODY>
        <TR>
          <TD height=5></TD></TR></TBODY></TABLE>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        
        <TR>
          <TD height=25>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width=100%>
                    <TBODY>
                    <TR>
                      <TD class=ct background=files/ne.jpg width=150 
                      align=middle>新闻详情</TD>
                      <TD background=files/ne1.jpg 
                      align=right>&nbsp;</TD>
                      <TD width=6><IMG src="files/ne2.jpg" width=6 
                        height=29></TD></TR></TBODY></TABLE>
            </TD></TR>
        <TR>
          <TD height=180 vAlign=top>
            <STYLE type=text/css>.style4 {
	COLOR: #ff0000
}
</STYLE>

            <TABLE class=bb border=0 cellSpacing=0 cellPadding=0 align=center>
              <TBODY>
              <TR>
                <TD height=10 vAlign=top></TD></TR>
              <TR>
                <TD>
                  <DIV style="WIDTH: 800px">
                  <%
                  String id = request.getParameter("id");
                  Notice notice = (Notice)dao.findById(id,"Notice"); %>
                  <table width="100%">
                  	<tr>
                  		<td align="center"><%=notice.getTitle() %></td>
                  	</tr>
                  	<tr>
                  		<td align="center"><%=notice.getSavetime() %></td>
                  	</tr>
                  	<tr>
                  		<td><%=notice.getContent() %></td>
                  	</tr>
                  	
                  </table>
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    </center>
    
    <jsp:include page="foot.jsp"></jsp:include>
    <script type="text/javascript">
    	function ck(){
    		if(f1.uname.value==""){
    			alert("请输入用户名");
    			return false;
    		}if(f1.upass.value==""){
    			alert("请输入密码");
    			return false;
    		}
    	}
    	
    	<%
		String suc = (String)request.getAttribute("suc");
    	String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("用户名或密码错误");
		 location.replace("/b2csys/login.jsp");
		 <%}
		if(suc!=null){%>
		 //alert("登陆成功");
		 location.replace("/b2csys/index.jsp");
		 <%}%>
    </script>
  </body>
</html>
