<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Notice"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>

<LINK href="/b2csys/commfiles/css/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/b2csys/commfiles/js/Admin.js"></SCRIPT>
<script language=javascript src="/b2csys/fckeditor/fckeditor.js"></script>
<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<%
String id = request.getParameter("id");
%>
<form action="msgReply.action" method=post name="f1" onsubmit="return ck()">
<input type="hidden" id="id" name="id" value="<%=id %>">
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TD width="10%" height=24 align="center" class=forumrow>回复内容</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <textarea rows="5" cols="60" name="reply" id="reply"></textarea>
    </label></TD></TR>
    <TR>
	    <TD colspan="2" height=24 align="center" class=forumrow>
	    	<input type="submit" value="提交">	
	    	<input type="reset" value="重置">	
	    </TD>
    </TR>
  </TBODY></TABLE>
  </form>
</BODY></HTML>
<SCRIPT language=javascript>

		function ck(){
     		if(f1.reply.value==""){
     			alert("回复内容不能为空");
     			return false;
     		}
     	}
     	
		<%
		String suc = (String)request.getAttribute("suc");
		if(suc!=null){%>
		 alert("操作成功");
		 parent.location.replace("/b2csys/admin/msg.jsp");
		 <%}%>
</script>
