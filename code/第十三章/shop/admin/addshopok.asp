<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/connection.asp" -->
<%
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
' IIf implementation
Function MM_IIf(condition, ifTrue, ifFalse)
  If condition = "" Then
    MM_IIf = ifFalse
  Else
    MM_IIf = ifTrue
  End If
End Function
%>
<%
If (CStr(Request("MM_insert")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_connection_STRING
    MM_editCmd.CommandText = "INSERT INTO shop (sp_title, sp_pic, sp_leibie, sp_price, sp_pinpai, sp_keyword, sp_shuoming) VALUES (?, ?, ?, ?, ?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 50, Request.Form("title")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 202, 1, 50, Request.Form("picture")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 202, 1, 50, Request.Form("select")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param4", 5, 1, -1, MM_IIF(Request.Form("price"), Request.Form("price"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param5", 202, 1, 50, Request.Form("pinpai")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param6", 202, 1, 50, Request.Form("keyword")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param7", 203, 1, 1073741823, Request.Form("abtract")) ' adLongVarWChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "addshopok.asp"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connection_STRING
Recordset1_cmd.CommandText = "SELECT * FROM fenlei" 
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset1_numRows = Recordset1_numRows + Repeat1__numRows
%>
<html>
<head>
<title>网上购物网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
a {
	font-family: 宋体;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.STYLE1 {
	color: #0000FF;
	font-size: 36px;
}
.STYLE2 {	color: #0000FF;
	font-size: 14px;
}
-->
</style></head>

<body>
<table width="100%" height="606" border="0" cellpadding="0" cellspacing="0" background="image/bg_top2.gif">
  <tr>
    <td height="89" align="left" valign="top" background="../image/bg_top2.gif">
     <table width="644" height="75" border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td height="20" colspan="6">&nbsp;</td>
         <td width="104" colspan="2"><div align="right"><a href="admin/login.asp"><img src="images/con_contact.gif" border="0"></a></div></td>
       </tr>
        <tr>
           <td width="190" height="28"><img src="../image/obj_title.gif" width="190" height="28"></td>
          <td colspan="7">&nbsp;</td>
        </tr>
       <tr>
          <td>&nbsp;</td>
          <td width="86"><a href="index.asp"><img src="images/bt9.gif" width="86" height="18" border="0"></a></td>
          <td width="86"><a href="che.asp"><img src="images/bt1.gif" width="86" height="18" border="0"></a></td>
          <td width="83"><a href="index.asp"><img src="images/bt3.gif" width="86" height="18" border="0"></a></td>
          <td width="55"><img src="images/bt.gif" width="86" height="18"></td>
          <td><img src="images/bt14.gif" width="86" height="18"></td>
          <td><a href="sousuo.asp"><img src="images/bt5.gif" width="86" height="18" border="0"></a></td>
          <td><a href="dingdan.asp"><img src="images/bt7.gif" width="86" height="18" border="0"></a></td>
       </tr>
    </table>
   </td>
  </tr>
  <tr>
    <td height="154" align="left" valign="top">
    <table width="100%" height="449" border="0" cellpadding="0" cellspacing="0" bgcolor="#E7E7E7">
      <tr>
        <td height="449" align="center" valign="top"><div align="left">商品添加成功，请<a href="javascript:history.go(-1)">返回</a></div>
          <p>&nbsp;</p>
          <p>&nbsp;</p></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="38" background="../image/bg_bottom.gif"><img src="../image/transparent.gif" height="1"></td>
  </tr>
</table>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
