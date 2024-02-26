<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Notice"%>
<%@page import="com.model.Product"%>
<%@page import="com.model.Order"%>
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
          <TD height=25 >
            <TABLE border=0 cellSpacing=0 cellPadding=0 width=100%>
                    <TBODY>
                    <TR>
                      <TD class=ct background=files/ne.jpg width=150 
                      align=middle>网银付款</TD>
                      <TD background=files/ne1.jpg 
                      align=right>&nbsp;</TD>
                      <TD width=6><IMG src="files/ne2.jpg" width=6 
                        height=29></TD></TR></TBODY></TABLE></TD></TR>
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
                  <%String id = request.getParameter("id");
                  Order o = (Order)dao.findById(id,"Order");
                  %>
              <form action="orderFk.action" name="f1" method="post" >
              <input type="hidden" id="id" name="id" value="<%=o.getId() %>" >
                  <table width="100%">
                  	<tr>
                  		<td>付款金额</td>
                  		<td colspan="4" align="left"><%=o.getPrice() %>元</td>
                  	</tr>
                  	<tr>
                  		<td><input type="radio" id="b" name="b"><img src="/b2csys/files/bank1.jpg" width="100" height="60"> </td>
                  		<td><input type="radio" id="b" name="b"><img src="/b2csys/files/bank2.jpg" width="100" height="60"> </td>
                  		<td><input type="radio" id="b" name="b"><img src="/b2csys/files/bank3.jpg" width="100" height="60"> </td>
                  		<td><input type="radio" id="b" name="b"><img src="/b2csys/files/bank4.jpg" width="100" height="60"> </td>
                  		<td><input type="radio" id="b" name="b"><img src="/b2csys/files/bank5.jpg" width="100" height="60"> </td>
                  	</tr>
                  	
                  	<tr>
                  		<td colspan="2">
                  			<input type="submit" value="提交"  >
                  			<input type="reset" value="重置">
                  		</td>
                  	</tr>
                  </table>
                  </form>
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    </center>
    
    <jsp:include page="foot.jsp"></jsp:include>
    <script type="text/javascript">

    	
    	<%
		String suc = (String)request.getAttribute("suc");
    	String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("余票不足，请重新选择车票");
		 location.replace("/b2csys/orders.jsp");
		 <%}
		if(suc!=null){%>
		 alert("支付成功");
		 location.replace("/b2csys/orders.jsp");
		 <%}%>
    </script>
  </body>
</html>
