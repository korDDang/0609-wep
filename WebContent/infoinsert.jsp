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
<%@ include file="DBConn.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<%
int ma=0;
ResultSet rs=null;
PreparedStatement pstmt=null;
try{
	String sql="select max(id) from info0609";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}else{
		ma=1;
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<br>
<h2>인사관리 사원등록 화면</h2>
<form name="form" method="post" action="infoinsertProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>사원번호(자동생성)</th>
<td>
<input type="text" name="id" value="<%=ma%>"></td>
</tr>
<tr>
<th>성명</th>
<td>
<input type="text" name="name"></td>
</tr>
<tr>
<th>소속부서</th>
<td>
<select name="dept">
<option value="10">인사부</option>
<option value="20">기획부</option>
<option value="30">홍보부</option>
<option value="40">영업부</option>
<option value="50">경리부</option>
</select></td>
</tr>
<tr>
<th>직급</th>
<td>
<select name="position">
<option value="1">1급</option>
<option value="2">2급</option>
<option value="3">3급</option>
<option value="4">4급</option>
</select></td>
</tr>
<tr>
<th>직책</th>
<td>
<input type="text" name="duty"></td>
</tr>
<tr>
<th>연락처</th>
<td>
<input type="text" name="phone"></td>
</tr>
<tr>
<th>주소</th>
<td>
<input type="text" name="address"></td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="submit" value="등록"  style="width:30%; ">
<input type="button" value="취소" onclick="history.back(-1)" style="width:30%; ">
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>