<%@ page import="java.text.DecimalFormat" %>
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
<% DecimalFormat fo=new DecimalFormat("###,###"); 


%>
<br>
<h2>수당 정보 조회</h2>
<hr>
<table border="1" id="tab1">
<tr>
<th style="text-align: center;">no</th>
<th style="text-align: center;">사원번호</th>
<th style="text-align: center;">이름</th>
<th style="text-align: center;">가족수당</th>
<th style="text-align: center;">직책수당</th>
<th style="text-align: center;">근속수당</th>
<th style="text-align: center;">기타수당</th>
<th style="text-align: center;">수당합계</th>
<th style="text-align: center;">구 분</th>
</tr>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int no=0;
try{
	String sql="select i.id,i.name,s.gajok,s.jikchak,s.gunsok,s.gitasudang from info0609 i, sudang0609 s where i.id=s.id";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		int gajok=rs.getInt(3);
		int jikchak=rs.getInt(4);
		int gunsok=rs.getInt(5);
		int gitasudang=rs.getInt(6);
		int sum=gajok+jikchak+gunsok+gitasudang;
         no++;

%>
<tr>
<td><%=no %></td>
<td><%=id %></td>
<td><%=name %></td>
<td style="text-align: right"><%=fo.format(gajok) %></td>
<td style="text-align: right"><%=fo.format(jikchak) %></td>
<td style="text-align: right"><%=fo.format(gunsok) %></td>
<td style="text-align: right"><%=fo.format(gitasudang) %></td>
<td style="text-align: right"><%=fo.format(sum) %> </td>
<td style="text-align: center"><a href="updateSudang.jsp?id=<%=id%>">수정</a>/ <a href="deleteSudang.jsp?id=<%=id %>">삭제</a></td>
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