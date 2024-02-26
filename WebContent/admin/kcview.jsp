<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Product"%>
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
  <%        
  CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
  String hql = " from Product where  delstatus=0 ";
  String url ="/b2csys/admin/kcview.jsp?1=1"; 
  String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
  String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
  String f = request.getParameter("f");
  if(f==null)
  {
	  key1 = Info.getUTFStr(key1);
	  key2 = Info.getUTFStr(key2);
  }
  if(!key1.equals(""))
  {
  hql+=" and (field2 like '%"+key1+"%'  )";
  url+="&key1="+key1;
  }
  if(!key2.equals(""))
  {
  hql+=" and (field3 like '%"+key2+"%'  )";
  url+="&key2="+key2;
  }
  hql+="  order by id desc"; %>
  <body onLoad="MM_preloadImages('/b2csys/admin/images/index_on.gif','/b2csys/admin/images/reg_on.gif','/b2csys/admin/images/order_on.gif','/b2csys/admin/images/top/topxmas/jp_on.gif','/b2csys/admin/images/top/topxmas/download_on.gif','/b2csys/admin/images/top/topxmas/bbs_on.gif','/b2csys/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        
        <form action="/b2csys/admin/kcview.jsp?f=f" name="f1" method="post">
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/b2csys/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>网上售票系统</a> →余票盘点
					<img border="0" src="/b2csys/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=right>
                线路：
                       <input type="text" id="key1" name="key1" value="<%=key1 %>">-
                 <input type="text" id="key2" name="key2" value="<%=key2 %>">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="搜索"/>
                </td>
                </tr>
		</table>
		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" ><font color="#ffffff"><b>序号</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" ><font color="#ffffff"><b>车票编号</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" ><font color="#ffffff"><b>线路</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" ><font color="#ffffff"><b>车票时间</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" ><font color="#ffffff"><b>余票</b></font></td>
		</tr>
        <%
        PageManager pageManager = PageManager.getPage("/b2csys/admin/kcview.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Product> list=( ArrayList<Product>)bean.getCollection(); 
	   
	   	int i=0;
	    for(Product product :list)
	    {
	    	i++;
        %>
		<tr>
			<td class=tablebody2 valign=middle align=center width=""><%=i %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=product.getProno() %></td>
			<td class=tablebody1 valign=middle align=center width="">
			<%=product.getField2() %>-<%=product.getField3() %>
			</td>
			<td class=tablebody1 valign=middle align=center width=""><%=product.getField1() %></td>
			<td class=tablebody1 valign=middle align=center width="">
			<%
			ArrayList<Kcrecord> inlist = (ArrayList<Kcrecord>)dao.findByHql("  from Kcrecord where productid='"+product.getId()+"' and type='in' ");
			ArrayList<Kcrecord> outlist = (ArrayList<Kcrecord>)dao.findByHql("  from Kcrecord where productid='"+product.getId()+"' and type='out' ");
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
			<%=kc %>
		</tr>
        <%} %>     
		</table>
		<br>
		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
			<tr>
			<td height=25 valign=middle align=middle>${page.info }</td>
	        </tr>
		</table>
		</form>
        <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
<SCRIPT language=javascript src="/b2csys/commfiles/js/popup.js"></SCRIPT>
<script type="text/javascript">
	function add()
	{
		pop("/b2csys/admin/productadd.jsp","新增车票",800,450);
	}
	function edit(id)
	{
		pop("/b2csys/admin/productedit.jsp?id="+id,"编辑车票",800,450);
	}
	function settj(id){
		pop("/b2csys/admin/productsettj.jsp?id="+id,"设置特价",300,100);
	}
	function rk(id){
		pop("/b2csys/admin/productrk.jsp?id="+id,"入库",300,100);
	}
</script>