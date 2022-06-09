<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<% 

ResultSet rs=null;
PreparedStatement pstmt=null;
try{
	String sql="select name from info0609 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
	


try{
	sql="select * from sudang0609 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	rs=pstmt.executeQuery();
	if(rs.next()){
	  String id=rs.getString("id");
	  String gajok=rs.getString("gajok");
	  String jikchak=rs.getString("jikchak");
	  String gunsok=rs.getString("gunsok");
	  String gitasudang=rs.getString("gitasudang");
	
	
	
		
		%>
<section id="sec1">
<br>
<h2>수당 정보 등록</h2>
<br>
<form name="form" method="post" action="updateSudangProcess.jsp">
<table border="1" id="tab1">
<tr>
<th style="background: orange;" >사원번호</th>
<td>
<input type="text" name="id" value="<%=id %>" onchange="check()"></td>
<th style="background: orange;">이름</th>
<td>
<input type="text" name="name" value="<%=name%>"></td>
</tr>
<tr>
<th style="background: orange;">가족수당</th>
<td>
<input type="text" name="gajok" value="<%=gajok %>"></td>
<th style="background: orange;">직책수당</th>
<td>
<input type="text" name="jikchak" value="<%=jikchak %>"></td>
</tr>
<tr>
<th style="background: orange;">근속수당</th>
<td>
<input type="text" name="gunsok" value="<%=gunsok %>"></td>
</tr>
<tr>
<th style="background: orange;">기타수당</th>
<td colspan="3">
<input type="text" name="gitasudang" style="width: 80%;" value="<%=gitasudang %>"></td>
</tr>
<tr>
<td colspan="4" id="td1">
<input type="button" value="목록" onclick="location.href='selectSudang.jsp'" style="background: gray; color: white;">
<input type="submit" value="저장"  style="background: gray; color: white;"></td>
<% 
	}
}catch(SQLException e){
	e.printStackTrace();
}
		
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
		
		%>
</tr>
</table>
</form>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>