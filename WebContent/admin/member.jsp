<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Sysuser"%>
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
  String hql = " from Sysuser where type='会员' and delstatus=0 ";
  String url ="/b2csys/admin/member.jsp?1=1"; 
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)
  {
  key = Info.getUTFStr(key);
  }
  if(!key.equals(""))
  {
  hql+=" and (uname like'%"+key+"%'  )";
  url+="&key="+key;
  }
  hql+="  order by id desc"; %>
  <body onLoad="MM_preloadImages('/b2csys/admin/images/index_on.gif','/b2csys/admin/images/reg_on.gif','/b2csys/admin/images/order_on.gif','/b2csys/admin/images/top/topxmas/jp_on.gif','/b2csys/admin/images/top/topxmas/download_on.gif','/b2csys/admin/images/top/topxmas/bbs_on.gif','/b2csys/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        
        <form action="/b2csys/admin/member.jsp?f=f" name="f1" method="post">
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/b2csys/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>网上售票系统</a> →会员管理
					<img border="0" src="/b2csys/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=right>
                 用户名：<input type="text" id="key" name="key" value="<%=key %>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="搜索"/>
                </td>
                </tr>
		</table>
		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>序号</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>用户名</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>密码</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>姓名</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>性别</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>年龄</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>电话</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>地址</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>是否黑名单</b></font></td>
			<td valign=middle align=center height=25 background="/b2csys/admin/images/bg2.gif" width=""><font color="#ffffff"><b>操作</b></font></td>
		</tr>
        <%
        String inid = request.getParameter("inid");
        String outid = request.getParameter("outid");
        if(inid!=null){
        	Sysuser s1 = (Sysuser)dao.findById(inid,"Sysuser");
        	s1.setBlackname("yes");
        	dao.update(s1);
        }if(outid!=null){
        	Sysuser s2 = (Sysuser)dao.findById(outid,"Sysuser");
        	s2.setBlackname("no");
        	dao.update(s2);
        }
        PageManager pageManager = PageManager.getPage("/b2csys/admin/member.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Sysuser> list=( ArrayList<Sysuser>)bean.getCollection(); 
	   
	   	int i=0;
	    for(Sysuser sysuser :list)
	    {
	    	i++;
        %>
		<tr>
			<td class=tablebody2 valign=middle align=center width=""><%=i %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getUname() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getUpass() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getRealname() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getSex() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getAge() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getTel() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getAddr() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getBlackname() %></td>
			<td class=tablebody1 valign=middle align=center width="">
			<%if(sysuser.getBlackname().equals("no")) {%>
				<a href="/b2csys/admin/member.jsp?inid=<%=sysuser.getId() %>">加入黑名单</a>
			<%}else{ %>
				<a href="/b2csys/admin/member.jsp?outid=<%=sysuser.getId() %>">移出黑名单</a>
			<%} %>
			</td>
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
		pop("/b2csys/admin/noticeadd.jsp","新增公告",710,350);
	}
	function edit(id)
	{
		pop("/b2csys/admin/noticeedit.jsp?id="+id,"编辑公告",710,350);
	}
</script>