<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Product"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Order"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Kcrecord"%>
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
  String orderid = request.getParameter("id");
  Order order = (Order)dao.findById(orderid,"Order");
  String pinfo[] = order.getProinfo().split(",");
  String productid = pinfo[0];
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
                      align=middle>订单改签</TD>
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
					<table width="100%" border="0" bgcolor="#cccccc" cellpadding="1" cellspacing="1">
                  	<tr align="center" bgcolor="#cccccc">
                  		<td>所属线路</td>
                  		<td>其它班次</td>
                  		<td>价格</td>
                  		<td>余票</td>
                  		<td>操作</td>
                  	</tr>
                  <%
                  Product product = (Product)dao.findById(productid,"Product");
                  System.out.println("11="+productid);
                  ArrayList<Product> productlist = (ArrayList<Product>)dao.findByHql("from Product where field2='"+product.getField2()+"' and field3='"+product.getField3()+"' and id not in ('"+productid+"')");
                  int total = 0;
                  if(productlist.size()!=0){
                  for(Product pp:productlist){
                  %>
                  	<tr align="center" height="30">
                  		<td bgcolor="#ffffff">
                  		<%=pp.getField2() %>-<%=pp.getField3() %>
                  		</td>
                  		<td bgcolor="#ffffff" align="left">
                  		<%=pp.getField1() %>
                  		</td>
                  		<td bgcolor="#ffffff"><%=pp.getPrice() %> 元</td>
                  		                  		<td bgcolor="#ffffff">
                  		<%
			ArrayList<Kcrecord> inlist = (ArrayList<Kcrecord>)dao.findByHql("  from Kcrecord where productid='"+pp.getId()+"' and type='in' ");
			ArrayList<Kcrecord> outlist = (ArrayList<Kcrecord>)dao.findByHql("  from Kcrecord where productid='"+pp.getId()+"' and type='out' ");
			int kc;
			if(inlist.size()!=0){
			int innum = 0;
			int outnum = 0;
			for(Kcrecord in:inlist){
				innum+=Integer.parseInt(in.getNum());
			}
			for(Kcrecord kout:outlist){
				outnum+=Integer.parseInt(kout.getNum());
			}
			kc = innum-outnum;
			}else{
				kc = 0;
			}
			%>
			<%=kc %> 张
                  		</td>
                  		<td bgcolor="#ffffff">
                  		<a href="orderGq.action?id=<%=orderid %>&newpid=<%=pp.getId() %>">选择</a>
                  		</td>
                  	</tr>
					<%}} %>
                  </table>
                  
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    </center>
    
    <jsp:include page="foot.jsp"></jsp:include>
    
  </body>
</html>
