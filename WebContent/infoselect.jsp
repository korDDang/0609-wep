<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<br>
<h2>사원 정보 조회</h2>
<hr>
<table border="1" id="tab1">
<tr>
<th style="text-align: center;">no</th>
<th style="text-align: center;">성명</th>
<th style="text-align: center;">사번</th>
<th style="text-align: center;">직급</th>
<th style="text-align: center;">직책</th>
<th style="text-align: center;">연락처</th>
<th style="text-align: center;">소속부서</th>
<th style="text-align: center;">주소</th>
</tr>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int no=0;
try{
	String sql="select * from info0609";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		String dept=rs.getString(3);
		String position=rs.getString(4);
		String duty=rs.getString(5);
		String phone=rs.getString(6);
		String address=rs.getString(7);
         no++;

%>
<tr>
<td><%=no %></td>
<td><a href="infoupdate.jsp?id=<%=id %>"><%=id %></a></td>
<td><%=name %></td>
<td><%=dept %></td>
<td><%=position %></td>
<td><%=duty %></td>
<td><%=phone %></td>
<td><%=address %></td>
</tr>
<% 
}
	
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>



</section>
<%@ include file="footer.jsp" %>
</body>
</html>