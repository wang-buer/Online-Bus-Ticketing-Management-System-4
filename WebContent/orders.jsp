<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Product"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Order"%>
<%@page import="com.model.Protype"%>
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
  <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); 
  Sysuser member = (Sysuser)session.getAttribute("member");
  %>
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
                      align=middle>我的订单</TD>
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
					<table width="100%" border="0" bgcolor="#cccccc" cellpadding="1" cellspacing="1">
                  	<tr align="center" bgcolor="#cccccc">
                  		<td>订单号</td>
                  		<td>订单车票</td>
                  		<td>订单价格</td>
                  		<td>付款状态</td>
                  		<td>订单时间</td>
                  		<td>操作</td>
                  	</tr>
                  <%
                  ArrayList<Order> orderlist = (ArrayList<Order>)dao.findByHql(" from Order where memberid='"+member.getId()+"' and type='0' and fhstatus is not '退票成功' order by id desc ");
                  int total = 0;
                  if(orderlist.size()!=0){
                  for(Order order:orderlist){
                  %>
                  	<tr align="center" height="30">
                  		<td bgcolor="#ffffff"><%=order.getOrderid() %></td>
                  		<td bgcolor="#ffffff" align="left">
                  		<%String proinfo = order.getProinfo();
                  		String a[] = proinfo.split("-");
                  		String p = "";
                  		for(int i=0;i<a.length;i++){
                  			String b[] = a[i].split(",");
                  			Product product = (Product)dao.findById(b[0],"Product");
                      		p+="<font color='red'>["+product.getField2()+"-"+product.getField3()+"]</font>&nbsp;时间："+product.getField1()+"&nbsp;数量："+b[1]+"<br/>";
                  		}
                  		%><%=p %>
                  		</td>
                  		<td bgcolor="#ffffff"><%=order.getPrice() %> 元</td>
                  		<td bgcolor="#ffffff"><%=order.getFkstatus() %> </td>
                  		<td bgcolor="#ffffff"><%=order.getSavetime() %></td>
                  		<td bgcolor="#ffffff">
                  		<%
                  
                  		if(order.getFkstatus().equals("未付款")){ %>
                  		<a href="/b2csys/bank.jsp?id=<%=order.getId() %>">网银付款</a>&nbsp;|&nbsp;
                  		<a href="orderDel.action?id=<%=order.getId() %>">删除</a></td>
                  		<%}if(order.getFhstatus().equals("已发货")){ %>
                  		<a href="orderTh.action?id=<%=order.getId() %>">退票</a>&nbsp;|&nbsp;
                  		<%if(order.getIsgq().equals("no")){ %>
                  		<a href="ordersgq.jsp?id=<%=order.getId() %>">改签</a>
                  		<%}else{%>
                  			已改签
                  			
                  		<%}}%>
                  	</tr>
					<%}} %>
                  </table>
                  
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    </center>
    
    <jsp:include page="foot.jsp"></jsp:include>
    <script type="text/javascript">
        	<%
		String suc1 = (String)request.getAttribute("suc1");
    	String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("目标车票余票不足，请重新选择");
		 location.replace("/b2csys/orders.jsp");
		 <%}
		if(suc1!=null){%>
		 alert("改签成功");
		 location.replace("/b2csys/orders.jsp");
		 <%}%>
    </script>
  </body>
</html>
