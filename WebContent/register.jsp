<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
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
  <LINK rel=stylesheet type=text/css href="commfiles/css.css">
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
                      align=middle>会员注册</TD>
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
              <form action="memberReg.action" name="f1" method="post" onsubmit="return ck()">
                  <table width="100%">
                  	<tr>
                  		<td>用户名</td>
                  		<td><input type="text" id="uname" name="uname" onBlur="checkname();"> *<span id="namets"></span></td>
                  	</tr>
                  	<tr>
                  		<td>密码</td>
                  		<td><input type="password" id="upass" name="upass"> *</td>
                  	</tr>
                  	<tr>
                  		<td>重复密码</td>
                  		<td><input type="password" id="upass1" name="upass1"> *</td>
                  	</tr>
                  	<tr>
                  		<td>姓名</td>
                  		<td><input type="text" id="realname" name="realname"> *</td>
                  	</tr>
                  	<tr>
                  		<td>性别</td>
                  		<td>
                  			<select id="sex" name="sex">
                  				<option value="男">男</option>
                  				<option value="女">女</option>
                  			</select>
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>年龄</td>
                  		<td><input type="text" id="age" name="age"> </td>
                  	</tr>
                  	<tr>
                  		<td>电话</td>
                  		<td><input type="text" id="tel" name="tel"> *</td>
                  	</tr>
                  	<tr>
                  		<td>email</td>
                  		<td><input type="text" id="email" name="email"> *</td>
                  	</tr>
                  	<tr>
                  		<td>身份证号</td>
                  		<td><input type="text" id="addr" name="addr" size="60">* </td>
                  	</tr>
                  	<tr>
                  		<td colspan="2">
                  			<input type="submit" value="提交" name="regsubmit" disabled="disabled" >
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
    //定义一个变量用于存放XMLHttpRequest对象
	var xmlHttp; 
	
	//该函数用于创建一个XMLHttpRequest对象
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} 
		else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
		//这是一个启动AJAX异步通信的方法
	function checkname()
	{
	
	if(f1.uname.value=="")
		{
		alert("请输入用户名");
		return false;
		}
		//创建一个XMLHttpRequest对象
		createXMLHttpRequest();
		//将状态触发器绑定到一个函数
		

		xmlHttp.onreadystatechange = processor;
		//通过GET方法向指定的URL建立服务器的调用
		
		xmlHttp.open("GET", "check.action?uname="+f1.uname.value+"&timeStamp="+new Date().getTime());
		
		//发送请求
		xmlHttp.send(null);
		

	}
	function processor () 
	{
		//定义一个变量用于存放从服务器返回的响应结果
		var responseContext;
		if(xmlHttp.readyState == 4) 
		{ //如果响应完成
			if(xmlHttp.status == 200) 
			{//如果返回成功
				//取出服务器的响应内容
				responseContext = xmlHttp.responseText;
				//如果注册名检查有效
				if ( responseContext.indexOf("1") )
				{
					document.getElementById("namets").innerHTML="√";
					document.getElementById("namets").style.cssText="font-size:11px;color:green;";
					document.all.regsubmit.disabled=false;
				}
				else				{
					document.getElementById("namets").innerHTML="×已存在的用户名";
					document.getElementById("namets").style.cssText="font-size:11px;color:red;";
					document.all.regsubmit.disabled=true;
				}
			}
		}
	}
	
	function InitAjax() 
{ 
　var ajax=false; 
　try { 
　　ajax = new ActiveXObject("Msxml2.XMLHTTP"); 
　} catch (e) { 
　　try { 
　　　ajax = new ActiveXObject("Microsoft.XMLHTTP"); 
　　} catch (E) { 
　　　ajax = false; 
　　} 
　} 
　if (!ajax && typeof XMLHttpRequest!='undefined') { 
　　ajax = new XMLHttpRequest(); 
　} 
　return ajax; 
} 

function checkEmail(el)
{
var regu ="^(([0-9a-zA-Z]+)|([0-9a-zA-Z]+[_.0-9a-zA-Z-]*[0-9a-zA-Z-]+))@([a-zA-Z0-9-]+[.])+([a-zA-Z]|net|NET|asia|ASIA|com|COM|gov|GOV|mil|MIL|org|ORG|edu|EDU|int|INT|cn|CN|cc|CC)$"
var re = new RegExp(regu);
if(el.search(re) == -1)
{
return true; //非法
}
return false;//正确
}
    
    	function ck(){
    		var obj =document.getElementById("email");
    		if(f1.uname.value==""){
    			alert("请输入用户名");
    			return false;
    		}if(f1.upass.value==""){
    			alert("请输入密码");
    			return false;
    		}if(f1.upass1.value==""){
    			alert("请重复密码");
    			return false;
    		}if(f1.upass.value!=f1.upass1.value){
    			alert("两次密码不一致");
    		}if(f1.realname.value==""){
    			alert("请输入姓名");
    			return false;
    		}if(f1.tel.value==""){
    			alert("请输入电话");
    			return false;
    		}if(f1.email.value==""){
    			alert("请输入email");
    			return false;
    		}else if(f1.email.value!=""){
  				if(checkEmail(obj.value))
				{
					alert("E-mail格式不正确，请检查!");
					obj.focus();
					return false;
				}
  			}if(f1.addr.value==""){
    			alert("请输入身份证号");
    			return false;
    		}
    	}
    	
    	<%
		String suc = (String)request.getAttribute("suc");
		if(suc!=null){%>
		 alert("操作成功");
		 parent.location.replace("/b2csys/register.jsp");
		 <%}%>
    </script>
  </body>
</html>
