<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Protype"%>
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
<%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); %>
<form action="productAdd.action" method=post name="f1" onsubmit="return ck()" >
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TD width="" height=24 align="center" class=forumrow>车票编号</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input type="text" id="prono" name="prono" >
    </label></TD>
    <TD width="" height=24 align="center" class=forumrow>车票时间</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input type="text" id="field1" name="field1" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});">
      <script type="text/javascript" src="/b2csys/commfiles/js/calendar/WdatePicker.js"></script>
    </label></TD>
   
    </TR>
    
    <TR>
    <TD width="" height=24 align="center" class=forumrow>价格</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input type="text" id="price" name="price" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
    </label></TD>
    <TD width="" height=24 align="center" class=forumrow>所属线路</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
       <input type="text" id="field2" name="field2" size="6">- <input type="text" id="field3" name="field3" size="6">
    </label></TD>
   
    </TR>
    <tr>
    <TD class=forumrowhighlight width="" colspan="4" align="center"
      height=24><label>
      <input type="submit" value="提交" >
      <input type="reset" value="重置">
    </label></TD>
    </tr>
    
 
  </TBODY></TABLE>
  </form>
</BODY></HTML>
<SCRIPT language=javascript>


		function ck(){
     		if(f1.prono.value==""){
     			alert("车票编号不能为空");
     			return false;
     		}if(f1.field1.value==""){
     			alert("车票时间不能为空");
     			return false;
     		}if(f1.price.value==""){
     			alert("价格不能为空");
     			return false;
     		}if(f1.field2.value==""){
     			alert("起始地点不能为空");
     			return false;
     		}if(f1.field3.value==""){
     			alert("终止地点不能为空");
     			return false;
     		}
     	}
     	
		<%
		String suc = (String)request.getAttribute("suc");
		if(suc!=null){%>
		 alert("操作成功");
		 parent.location.replace("/b2csys/admin/product.jsp");
		 <%}%>
</script>
