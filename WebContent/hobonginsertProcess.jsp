<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
PreparedStatement pstmt=null;
try{
	String sql="insert into hobong0609 values(?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("dunggub"));
	pstmt.setString(2, request.getParameter("salary"));

	pstmt.executeUpdate();
	%><script>
	alert("저장성공");
	history.back(-1);
	</script><%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}%>



</body>
</html>