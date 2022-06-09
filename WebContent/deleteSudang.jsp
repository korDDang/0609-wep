<%@page import="java.sql.SQLException"%>
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
String sql="delete from sudang0609 where id=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, request.getParameter("id"));
pstmt.executeUpdate();
%><script>
alert("삭제완료");
history.back(-1);
</script>
<%
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>