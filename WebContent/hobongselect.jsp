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
<h2>호봉 정보 조회</h2>
<hr>
<table border="1" id="tab1">
<tr>
<th style="text-align: center;">no</th>
<th style="text-align: center;">등급</th>
<th style="text-align: center;">급여</th>
</tr>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int no=0;
String dunggub1="";
try{
	String sql="select * from hobong0609";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String dunggub=rs.getString(1);
		 switch(dunggub){
		case "1": dunggub="1급";
		break;
		case "2": dunggub="2급";
		break;
		case "3": dunggub="3급";
		break;
		case "4": dunggub="4급";
		break;
		case "5": dunggub="5급";
		break;
		}
		 String dunggub2=rs.getString(1);
		String salary=rs.getString(2);
         no++;

%>
<tr>
<td><%=no %></td>
<td><a href="hobongupdate.jsp?dunggub=<%=dunggub2%>"><%=dunggub %></a></td>
<td><%=salary %></td>
</tr>
<% 
}
	
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<hr>


</section>
<%@ include file="footer.jsp" %>
</body>
</html>