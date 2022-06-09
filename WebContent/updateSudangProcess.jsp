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
	String sql="update info0609 set name=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(2, request.getParameter("id"));
	pstmt.setString(1, request.getParameter("name"));
	pstmt.executeUpdate();
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}


try{
	String sql="update sudang0609 set gajok=?,jikchak=?,gunsok=?,gitasudang=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(5, request.getParameter("id"));
	pstmt.setString(1, request.getParameter("gajok"));
	pstmt.setString(2, request.getParameter("jikchak"));
	pstmt.setString(3, request.getParameter("gunsok"));
	pstmt.setString(4, request.getParameter("gitasudang"));

	pstmt.executeUpdate();
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}%>

<script>
alert("저장성공");
history.back(-1);
</script>

</body>
</html>