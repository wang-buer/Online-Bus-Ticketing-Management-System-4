<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Protype"%>
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
  String hql = " from Protype where delstatus=0 ";
  String url ="/b2csys/admin/protype.jsp?1=1"; 
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)
  {
  key = Info.getUTFStr(key);
  }
  if(!key.equals(""))
  {
  hql+=" and (typename like'%"+key+"%'  )";
  url+="&key="+key;
  }
  hql+="  order by id desc"; %>
  <body onLoad="MM_preloadImages('/b2csys/admin/images/index_on.gif','/b2csys/admin/images/reg_on.gif','/b2csys/admin/images/order_on.gif','/b2csys/admin/images/top/topxmas/jp_on.gif','/b2csys/admin/images/top/topxmas/download_on.gif','/b2csys/admin/images/top/topxmas/bbs_on.gif','/b2csys/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        
        <form action="/b2csys/admin/protype.jsp?f=f" name="f1" method="post">
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/b2csys/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>网上售票系统</a> →线路管理
					<img border="0" src="/b2csys/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=right>
                 线路名称：<input type="text" id="key" name="key" value="<%=key %>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="搜索"/>
                 &nbsp;&nbsp;<input type="button" value="新增" onclick="add()">
                </td>
                </tr>
		</table>
		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width="10%"><font color="#ffffff"><b>序号</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>线路名称</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width="15%"><font color="#ffffff"><b>操作</b></font></td>
		</tr>
        <%
        PageManager pageManager = PageManager.getPage("/b2csys/admin/notice.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Protype> list=( ArrayList<Protype>)bean.getCollection(); 
	   
	   	int i=0;
	    for(Protype protype :list)
	    {
	    	i++;
        %>
		<tr>
			<td class=tablebody2 valign=middle align=center width=""><%=i %></td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;<%=protype.getTypename() %></td>
			<td class=tablebody1 valign=middle align=center width=""><a href="javascript:edit(<%=protype.getId() %>)">编辑</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="typeDel.action?id=<%=protype.getId() %>">删除</a></td>
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
		pop("/b2csys/admin/protypeadd.jsp","新增线路",400,150);
	}
	function edit(id)
	{
		pop("/b2csys/admin/protypeedit.jsp?id="+id,"编辑线路",400,150);
	}
	<%
		String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("有关联到此线路的车票，不能删除！");
		 parent.location.replace("/b2csys/admin/protype.jsp");
		 <%}%>
</script>