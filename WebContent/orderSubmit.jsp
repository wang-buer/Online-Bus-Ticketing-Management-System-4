<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
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
          <TD height=25 >
            <TABLE border=0 cellSpacing=0 cellPadding=0 width=100%>
                    <TBODY>
                    <TR>
                      <TD class=ct background=files/ne.jpg width=150 
                      align=middle>订单填写</TD>
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
                  		<td>总价</td>
                  	</tr>
                  <%
                  String carid = request.getParameter("carid");
                  ArrayList<Car> carlist = (ArrayList<Car>)dao.findByHql(" from Car where memberid='"+member.getId()+"' and id='"+carid+"'  order by id desc ");
                  int total = 0;
                  String proinfos = "";
                  if(carlist.size()!=0){
                  for(Car car:carlist){
                  Product product = (Product)dao.findById(car.getProductid(),"Product");
                  proinfos = car.getProductid()+","+car.getNum();

                  String  price = product.getPrice();
                  
                  total += Integer.parseInt(price)*Integer.parseInt(car.getNum());
                  %>
                  	<tr align="center" >
                  		<td bgcolor="#ffffff"><%=product.getProno() %></td>
                  		<td bgcolor="#ffffff"><%=product.getField2() %>-<%=product.getField3() %></td>
                  		<td bgcolor="#ffffff"><%=product.getField1() %></td>
                  		<td bgcolor="#ffffff"><%=product.getPrice() %>元</td>
                  		<td bgcolor="#ffffff"><%=car.getNum() %> 张</td>
                  		<td bgcolor="#ffffff"><%=total %> 元</td>
                  	</tr>
					<%}
                  //System.out.println(proinfos);
                  } 
					%>
                  </table>
                  <form action="orderAdd.action" method="post" name="f1" >
                  <input type="hidden" id="price" name="price" value="<%=total %>">
                  <input type="hidden" id="memberid" name="memberid" value="<%=member.getId() %>">
                  <input type="hidden" id="proinfo" name="proinfo" value="<%=proinfos %>">
                  <input type="hidden" id="carids" name="carids" value="<%=carid %>">
                  <table width="100%" border="0" bgcolor="#ffffff" cellpadding="1" cellspacing="1">
                  	<tr bgcolor="#cccccc">
                  		<td >预订人姓名</td>
                  		<td bgcolor="#ffffff"><input type="text" id="realname" name="realname" value="<%=member.getRealname() %>" >*</td>
                  	</tr>
                  	<tr bgcolor="#cccccc">
                  		<td >电话</td>
                  		<td bgcolor="#ffffff"><input type="text" id="tel" name="tel" value="<%=member.getTel() %>">*</td>
                  	</tr>
                  	<tr>
                  		<td bgcolor="#cccccc">身份证号</td>
                  		<td bgcolor="#ffffff"><input type="text" id="addr" name="addr" value="<%=member.getAddr() %>" size="60">*</td>
                  	</tr>
                  	<tr>
                  		<td colspan="2"><input type="submit" value="提交订单"> </td>
                  	</tr>
                  </table>
                  </form>
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    </center>
    
    <jsp:include page="foot.jsp"></jsp:include>
    
  </body>
</html>
