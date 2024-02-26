<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Notice"%>
<%@page import="com.model.Msg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=stylesheet type=text/css href="commfiles/css.css">
  </head>
    <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); %>
  <body>
      <center>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=231 align=left>
              <TBODY>
              <TR>
                <TD>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width=231>
                    <TBODY>
                    <TR>
                      <TD height=35 background=files/gg.jpg>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=208 
                        align=center>
                          <TBODY>
                          <TR>
                            <TD class=ct align=left>新闻公告</TD>
                            <TD width=39 align=right></TD></TR></TBODY></TABLE></TD></TR>
                    <TR>
                      <TD>
                        <TABLE class=bb border=0 cellSpacing=0 cellPadding=0 
                        width=231>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=left>
                              <DIV style="MARGIN: 10px">
                              <TABLE style="BORDER-TOP: #cecece 1px solid" 
                              border=0 cellSpacing=0 cellPadding=0 width=208 
                              align=center>
                                <TBODY>
                                <TR>
                                <TD height=30>
                                <TABLE id=standard border=0 cellSpacing=0 
                                cellPadding=0 width="100%">
                                <TBODY>
                                <%ArrayList<Notice> noticelist = (ArrayList<Notice>)dao.findByHql(" from Notice where type='公告' order by id desc limit 0,10");
                    for(Notice notice:noticelist){
                    	String ntitle = "";
                    	if(notice.getTitle().length()>10){
                    		ntitle = notice.getTitle().substring(0,10)+"...";
                    	}else{
                    		ntitle = notice.getTitle();
                    	}
                    %>
                                <TR>
                                <TD height=30 vAlign=center 
                                background=files/lb.jpg 
                                align=left><SPAN class=lin><A title="<%=notice.getTitle() %>" 
                                href="noticeDetail.jsp?id=<%=notice.getId() %>" 
                                target=_self><%=ntitle %> </A></SPAN></TD></TR>
                                <TR id=proclass2>
                                <TD style="HEIGHT: 0px" vAlign=center 
                                align=left></TD></TR>
                                <%} %>
                                </TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height=8></TD></TR>
              <TR>
                <TD><A href="msg.jsp"><IMG border=0 
                  src="files/fe.jpg" width=231 height=48></A></TD></TR>
              <TR>
                <TD height=8></TD></TR></TBODY></TABLE>
    </center>
  </body>
</html>
