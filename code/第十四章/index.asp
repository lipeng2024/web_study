<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="Connections/connection.asp" -->
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connection_STRING
Recordset1_cmd.CommandText = "SELECT * FROM new ORDER BY dateandtime DESC" 
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
Dim Recordset2
Dim Recordset2_cmd
Dim Recordset2_numRows

Set Recordset2_cmd = Server.CreateObject ("ADODB.Command")
Recordset2_cmd.ActiveConnection = MM_connection_STRING
Recordset2_cmd.CommandText = "SELECT * FROM new WHERE tuijian = true ORDER BY dateandtime DESC" 
Recordset2_cmd.Prepared = true

Set Recordset2 = Recordset2_cmd.Execute
Recordset2_numRows = 0
%>
<%
Dim Recordset3
Dim Recordset3_cmd
Dim Recordset3_numRows

Set Recordset3_cmd = Server.CreateObject ("ADODB.Command")
Recordset3_cmd.ActiveConnection = MM_connection_STRING
Recordset3_cmd.CommandText = "SELECT * FROM new ORDER BY hits DESC" 
Recordset3_cmd.Prepared = true

Set Recordset3 = Recordset3_cmd.Execute
Recordset3_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
Recordset1_numRows = Recordset1_numRows + Repeat1__numRows
%>
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = 10
Repeat2__index = 0
Recordset2_numRows = Recordset2_numRows + Repeat2__numRows
%>
<%
Dim Repeat3__numRows
Dim Repeat3__index

Repeat3__numRows = 5
Repeat3__index = 0
Recordset3_numRows = Recordset3_numRows + Repeat3__numRows
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>首页</title>
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE2 {font-size: 10pt}
.STYLE3 {color: #006699; font-size: 10pt; }
-->
</style>
</head>
<body leftmargin="0" topmargin="0">
<!--#include file="head.asp" -->
<table width="770" border="0" align="center" cellpadding="1" bgcolor="#6687BA">
  <tr>
    <td width="577" height="78" valign="top" bgcolor="#FFFFFF">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#6687BA">
      <tr>
        <td height="20" background="images/bg11.gif"><span class="STYLE3">最近更新 </span></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) 
%>
            <tr>
                <td><div align="left"><a href=xianshi.asp?nid=<%=(Recordset1.Fields.Item("nid").Value)%>><%=(Recordset1.Fields.Item("title").Value)%></a></div></td>
              <td><div align="left"><%=(Recordset1.Fields.Item("dateandtime").Value)%></div></td>
            </tr>
<% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>

                </table>  
          <div align="right"><a href="liulan.asp"+<%= Request.QueryString("typeid") %>>&gt;&gt;更多新闻&gt;&gt;</a> </div></td>
      </tr>
      <tr>
        <td height="20" background="images/bg11.gif" class="STYLE3">推荐新闻 </td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <% 
While ((Repeat2__numRows <> 0) AND (NOT Recordset2.EOF)) 
%>
            <tr>
              <td><div align="left"><a href=xianshi.asp?nid=<%=(Recordset2.Fields.Item("nid").Value)%>><%=(Recordset2.Fields.Item("title").Value)%></a></div></td>
              <td><div align="left"><%=(Recordset2.Fields.Item("dateandtime").Value)%></div></td>
            </tr>
            <% 
  Repeat2__index=Repeat2__index+1
  Repeat2__numRows=Repeat2__numRows-1
  Recordset2.MoveNext()
Wend
%>
        </table>  
          <div align="right"><a href="liulan.asp"+<%= Request.QueryString("typeid") %>>&gt;&gt;更多新闻&gt;&gt;</a> </div></td>
      </tr>
    </table></td>
    <td width="183" align="center" valign="top" bgcolor="#FFFFFF"><table width="164" border="0" cellpadding="0" cellspacing="1" bgcolor="#6687BA">
      <tr>
        <td height="20" background="images/bg11.gif"><div align="center"><strong><font color="#006699">站 内 搜 索</font></strong></div></td>
      </tr>
      <tr>
        <td height="88" valign="bottom" bgcolor="#FAFBFC"><form name="searchtitle" method="POST" action="search.asp" target="_blank">
            <div align="center">
              <input name="key" type="text"  value="请输入关键字" size="16">
              <br>
              <br>
              <input type="submit" name="Submit" value="搜 索">
              <input type="reset" name="Submit2" value="取 消" >
            </div>
        </form></td>
      </tr>
    </table>
      <p>&nbsp;</p>
      <table width="164" border="0" cellpadding="0" cellspacing="1" bgcolor="#6687BA"><tr><td height="88" valign="bottom" bgcolor="#FAFBFC"><form action="search.asp" method="post" name="searchtitle" target="_blank" id="searchtitle" onsubmit="if(searchtitle.ttt.value.length&lt;1){alert('搜索关键字不能为空！：）');return(false)}else{return(true)}"><div align="center">
        <table width="164" border="0" cellpadding="0" cellspacing="1" bgcolor="#6687BA">
          <tr>
            <td height="20" background="images/bg11.gif"><div align="center"><strong><font color="#006699">热点新闻</font></strong></div></td>
          </tr>
          <tr>
            <td height="88" valign="top" bgcolor="#FAFBFC"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <% 
While ((Repeat3__numRows <> 0) AND (NOT Recordset3.EOF)) 
%>
                <tr>
                    <td><div align="left"><a href=xianshi.asp?nid=<%=(Recordset3.Fields.Item("nid").Value)%>><%=(Recordset3.Fields.Item("title").Value)%></a></div></td>
                </tr>
                <% 
  Repeat3__index=Repeat3__index+1
  Repeat3__numRows=Repeat3__numRows-1
  Recordset3.MoveNext()
Wend
%>

                        </table></td>
          </tr>
        </table>
      </div>
          </form></td>
        </tr>
      </table>
    <p>&nbsp;</p></td>
  </tr>
</table>
<table width="770" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#6687BA">
  <tr>
    <td height="27" bgcolor="#FFFFFF"><div align="center" class="STYLE2">copyright&copy;new center </div></td>
  </tr>
</table>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<%
Recordset2.Close()
Set Recordset2 = Nothing
%>
<%
Recordset3.Close()
Set Recordset3 = Nothing
%>
