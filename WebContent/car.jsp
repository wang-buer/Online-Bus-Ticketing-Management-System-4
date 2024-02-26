<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Notice"%>
<%@page import="com.model.Product"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Car"%>
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
          <TD height=10 width=787></TD></TR>
        <TR>
          <TD height=25 >
            <TABLE border=0 cellSpacing=0 cellPadding=0 width=100%>
                    <TBODY>
                    <TR>
                      <TD class=ct background=files/ne.jpg width=150 
                      align=middle>待确认订单</TD>
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
                  		<td>车票编号</td>
                  		<td>所属线路</td>
                  		<td>车票时间</td>
                  		<td>单价</td>
                  		<td>购买数量</td>
                  		<td>总金额</td>
                  		<td>操作</td>
                  	</tr>
                  <%
                  ArrayList<Car> carlist = (ArrayList<Car>)dao.findByHql(" from Car where memberid='"+member.getId()+"' order by id desc ");
                  
                  if(carlist.size()!=0){
                  for(Car car:carlist){
                	  int total = 0;
                  Product product = (Product)dao.findById(car.getProductid(),"Product");
                  String price = "";
                  price = product.getPrice();
                  total += Integer.parseInt(price)*Integer.parseInt(car.getNum());
                  %>
                  	<tr align="center" >
                  		<td bgcolor="#ffffff"><%=product.getProno() %></td>
                  		<td bgcolor="#ffffff">
                  		<%=product.getField2() %>-<%=product.getField3() %>
                  		</td>
                  		<td bgcolor="#ffffff"><a href="/b2csys/productDetail.jsp?id=<%=product.getId() %>"><%=product.getField1() %></a></td>
                  		<td bgcolor="#ffffff"><%=product.getPrice() %>元</td>
						<SCRIPT language=javascript src="/b2csys/commfiles/js/popup.js"></SCRIPT>
                  		<td bgcolor="#ffffff"><%=car.getNum() %> 张&nbsp;&nbsp;<a href="javascript:numedit(<%=car.getId() %>)">修改</a></td>
                  		<td bgcolor="#ffffff"><%=total %>元</td>
                  		<td bgcolor="#ffffff"><a href="orderSubmit.jsp?carid=<%=car.getId() %>">购买</a>|<a href="carDel.action?id=<%=car.getId() %>">移出</a></td>
                  	</tr>
					<%}} %>
					
                  </table>
                  
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    </center>
    <script type="text/javascript">
    	function numedit(carid){
		pop("/b2csys/carNumEdit.jsp?id="+carid,"修改数量",300,100);
		}
    </script>
    <jsp:include page="foot.jsp"></jsp:include>
    
  </body>
</html>
