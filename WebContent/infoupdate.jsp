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
try{
	String sql="select * from info0609 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	rs=pstmt.executeQuery();
	if(rs.next()){
		String id=rs.getString("id");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
	
%>
<br>
<h2>인사관리 사원수정 화면</h2>
<form name="form" method="post" action="infoupdateProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>사원번호(자동생성)</th>
<td>
<input type="text" name="id" value="<%=id%>"></td>
</tr>
<tr>
<th>성명</th>
<td>
<input type="text" name="name" value="<%=name%>"></td>
</tr>
<tr>
<th>소속부서</th>
<td>
<select name="dept">
<option value="10" <%=dept.equals("10")?"selected":"" %>>인사부</option>
<option value="20" <%=dept.equals("20")?"selected":"" %>>기획부</option>
<option value="30" <%=dept.equals("30")?"selected":"" %>>홍보부</option>
<option value="40" <%=dept.equals("40")?"selected":"" %>>영업부</option>
<option value="50" <%=dept.equals("50")?"selected":"" %>>경리부</option>
</select></td>
</tr>
<tr>
<th>직급</th>
<td>
<select name="position">
<option value="1" <%=position.equals("1")?"selected":"" %>>1급</option>
<option value="2" <%=position.equals("2")?"selected":"" %>>2급</option>
<option value="3" <%=position.equals("3")?"selected":"" %>>3급</option>
<option value="4" <%=position.equals("4")?"selected":"" %>>4급</option>
</select></td>
</tr>
<tr>
<th>직책</th>
<td>
<input type="text" name="duty" value="<%=duty%>"></td>
</tr>
<tr>
<th>연락처</th>
<td>
<input type="text" name="phone" value="<%=phone%>"></td>
</tr>
<tr>
<th>주소</th>
<td>
<input type="text" name="address" value="<%=address%>"></td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="submit" value="수정하기"  style="width:30%; ">
<input type="button" value="취소" onclick="history.back(-1)" style="width:30%; ">
</table>
<% 
}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}%>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>