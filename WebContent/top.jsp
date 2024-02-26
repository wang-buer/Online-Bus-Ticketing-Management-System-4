<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Protype"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Imgadv"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=stylesheet type=text/css href="files/style.css">
<LINK rel=stylesheet type=text/css href="commfiles/css.css">
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
<script language="javascript"> 
function show(aa)
{  
       document.all.div4.style.display="none";
       aa.style.display="block";

}
		function cleardiv(aa)
		{
		document.all.div4.style.display="none";
		aa.style.display="none";
		}
</script>
  </head>
  <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); %>
  <%Sysuser member = (Sysuser)session.getAttribute("member");   %> 
  <body>

    <TABLE border=0 cellSpacing=0 cellPadding=0 width=1008 align=center 
  height=100><TBODY>
  <TR>
    <TD width=1008 >
    <%Imgadv imgadv = (Imgadv)dao.findByHql(" from Imgadv where type='HEAD' ").get(0); %>
	<img src="/b2csys/upfile/<%=imgadv.getImgurl() %>" width="100%" height="150">
    </TD></TR></TBODY></TABLE>

    
    <form action="/b2csys/search.jsp" method="post">
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
                  href="index.jsp">首页</A> </TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="/b2csys/notices.jsp">新闻公告</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="/b2csys/productmore.jsp">车票查询</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="/b2csys/otherinfo.jsp">其它信息</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=90 align=middle><A 
                  href="/b2csys/msg.jsp">留言交流</A></TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>
                <TD width=150 align=middle>
                <input type="text" id="field2" name="field2" size="3" value="起始">-<input type="text" id="field3" name="field3" size="3" value="终点"> 
                
                </TD>
                <TD align=middle><IMG src="files/me2.jpg" width=2 
                  height=28></TD>

                <TD width=90 align=middle>
                
                  &nbsp;<input type="submit" value="search">&nbsp;
                </TD></TR></TBODY></TABLE></TD>
          <TD width=7><IMG src="files/me3.jpg" width=7 
          height=35></TD></TR></TBODY></TABLE>
    <!--  
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
      background=files/bgtop.gif height=37>
        <TBODY>
        <TR>
          <TD vAlign=center width="75%">
            
            <TABLE class=9 border=0 cellSpacing=0 cellPadding=0 width="100%" 
            align=center>
              <TBODY>
              <TR>
                <TD class=b vAlign=top width="96%" align=left>
                  <DIV align=left>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <A href="index.jsp" class="menu" onmouseover="cleardiv(div4)" ><FONT color=#ffffff>首页</FONT></A>
                  | <A href="/b2csys/notices.jsp" onmouseover="cleardiv(div4)"><FONT color=#ffffff>新闻公告</FONT></A>
                  | <A href="" id="nav4" class="menu" onmouseover="show(div4)"><FONT color=#ffffff>车票查询</FONT></A>
                  | <A href="/b2csys/otherinfo.jsp" onmouseover="cleardiv(div4)"><FONT color=#ffffff>其它信息</FONT></A>  
                  | <A href="/b2csys/msg.jsp" onmouseover="cleardiv(div4)"><FONT color=#ffffff>留言交流</FONT></A>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <select id="protype" name="protype">
                  		<option value="">--全部线路--</option>
                  		<%//ArrayList<Protype> protypelist1 = (ArrayList<Protype>)dao.findByHql(" from Protype where delstatus=0 order by id desc"); 
                  		//for(Protype protype1:protypelist1){
                  		%>
                  		<option value="<%//protype1.getId() %>"><%//protype1.getTypename() %></option>
                  		<%//} %>
                  </select>
                  &nbsp;<input type="submit" value="search">&nbsp;&nbsp;
                   </DIV></TD></TR></TBODY></TABLE>
                   
                   </TD>
          <TD width="125%">
            </TD></TR>
        <TR>
          <TD height=4 vAlign=center colSpan=3></TD></TR></TBODY></TABLE>
          -->
          </center>
          </form>
         

  <TABLE border=0 cellSpacing=0 cellPadding=0 width=1008 align=center >
  	<tr>
  		<td>
			<DIV align=right>
            <%if(member==null){ %>
            <A href="/b2csys/login.jsp"><FONT color=#000000>登陆</FONT></A> &nbsp;&nbsp;&nbsp;
            <A href="/b2csys/register.jsp"><FONT color=#000000>注册帐号</FONT></A> &nbsp;&nbsp;&nbsp; 
            <%}else{ %>
            会员：<%=member.getUname() %> &nbsp;&nbsp;&nbsp; 
            <A href="/b2csys/orders.jsp"><FONT color=#000000>我的订单</FONT></A> &nbsp;&nbsp;&nbsp; 
            <A href="/b2csys/car.jsp"><FONT color=#000000>待确认订单</FONT></A> &nbsp;&nbsp;&nbsp; 
            <A href="/b2csys/memberinfo.jsp"><FONT color=#000000>个人信息</FONT></A> &nbsp;&nbsp;&nbsp; 
            <A href="memberExit.action"><FONT color=#000000>安全退出</FONT></A> &nbsp;&nbsp;&nbsp; 
            <%} %>
             </DIV>
		</td>
  	</tr>
  </table>
  
  </body>
</html>
