<!--#include file="funciton.asp"-->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新建网页 1</title>
</head>

<body>
<p align="center"><font face="华文行楷" size="6" color="#0000FF">权 限 管 理 模 块</font></p> 
<%
ID=Request.QueryString("ID")
If ID="" Then 
	Response.End
End If
Typea=Request.QueryString("Type")
If Typea="" Then 
	Typea="LM"
End If

Allow=Request.QueryString("Allow")
OwnerID=Request.QueryString("Owner")
Sql="Select * From "
If Typea="LM" Then 
	Sql=Sql& " Res_Info where ID="&ID
ElseIf Typea="File" Then
	Sql=Sql& " File_Info where ID="&ID
End If
Set Conn=Server.Createobject("Adodb.Connection") 
Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;"&_
 			"Data Source="&Server.MapPath("user.mdb")
Conn.Open
Response.write(Sql)
Set rs=Conn.Execute(Sql)
If rs.EOF = False Then
	If Typea="LM" Then 
		Response.write("align='center'><font face='华文行楷' size='6' color='#0000FF'>"&rs("Name")&"</font></p> ")
		nCode=Cint(GetResAllow(rs("Name"),UserID,GroupID))
		If nCode>1 Then
			Response.write("<form method='POST' action=''><select size='1' name='D1'>"
			If nCode=3 Then
				Response.write("<option value=Add>增加</option>")
				Response.write("<option value=Add>修改</option>")	
			ElseIf nCode=7 Then
				Response.write("<option value=Add>删除</option>")
			End If
			Response.write(" </select> ")
%>
<p>栏目名称：<input type="text" name="T1" size="20" value=<% =rs("Name") %>></p>
<p>权限：&nbsp; <input type="checkbox" name="C4" value="ON">文件主观看<input type="checkbox" name="C5" value="ON">文件主修改<input type="checkbox" name="C6" value="ON">文件主户删除</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="C1" value="ON">同组用户观看<input type="checkbox" name="C2" value="ON">同组用户修改<input type="checkbox" name="C3" value="ON">同组用户删除</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="C7" value="ON">其他用户观看<input type="checkbox" name="C8" value="ON">其他用户修改<input type="checkbox" name="C9" value="ON">其他用户删除</p>
<p>设置其他用户对本栏目权限</p>
<p>用户：<select size="1" name="D2">

<%
			Sql="Select * From User_Info where Group>"&Cint( Session("GroupID"))
			Set rs=Conn.Execute(Sql)
			Do while rs.EOF=False
				If nCode=3 Then
					Response.write("<option value=Add>增加</option>")
					Response.write("<option value=Add>修改</option>")	
				ElseIf nCode=7 Then
					Response.write("<option value=Add>删除</option>")
				End If			
			loop
%>
</select><input type="checkbox" name="C10" value="ON">观看<input type="checkbox" name="C11" value="ON">修改<input type="checkbox" name="C12" value="ON">删除</p>
</form>	
<%
		End If 
	End If 
	If Typea="LM" Then 
	 	 
		Response.write("align='center'><font face='华文行楷' size='6' color='#0000FF'>"&rs("Name")&"</font></p> ")
		nCode=Cint(GetFileAllow(ID, CInt(Session("Id")),CInt(Session("GroupID")),OwnerID,Allow))
		If nCode>1 Then
			Response.write("<form method='POST' action=''><select size='1' name='D1'>")
			If nCode=3 Then
				Response.write("<option value=Add>增加</option>")
				Response.write("<option value=Add>修改</option>")	
			ElseIf nCode=7 Then
				Response.write("<option value=Add>删除</option>")
			End If
			Response.write(" </select> ")
%>
<p>文件内容：<input type="text" name="T1" size="50" value=<% =rs("Content") %>></p>
<p>用户：<select size="1" name="D2">

<%
			Sql="Select * From User_Info where Group>"&Cint( Session("GroupID"))
			Set rs=Conn.Execute(Sql)
			Do while rs.EOF=False
				If nCode=3 Then
					Response.write("<option value=Add>增加</option>")
					Response.write("<option value=Add>修改</option>")	
				ElseIf nCode=7 Then
					Response.write("<option value=Add>删除</option>")
				End If			
			loop
%>
</select><input type="checkbox" name="C10" value="ON">观看<input type="checkbox" name="C11" value="ON">修改<input type="checkbox" name="C12" value="ON">删除</p>
</form>	

<%
		End If
	End If
End If

%>
<p><input type="submit" value="确定" name="B1"><input type="reset" value="重置" name="B2"></p>	
</form>
</body>

</html>