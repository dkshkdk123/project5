<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "test3.DBcon" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*, java.lang.*, java.net.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String p_id, p_pw, c_name, c_email, c_tel;
	try{
		conn = DBcon.getConnection();
		String sql = "insert into custom_01 values(?, ?, ?, ?, ?) ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("p_id"));
		pstmt.setString(2, request.getParameter("p_pw"));
		pstmt.setString(3, request.getParameter("c_name"));
		pstmt.setString(4, request.getParameter("c_email"));
		pstmt.setString(5, request.getParameter("c_tel"));
		pstmt.executeQuery();
	}catch(Exception e){
		System.out.println("ProductBean erro:"+e);
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			%>
			<script>
				alert("회원 등록 완료!");
				location.href="memberList.jsp";
			</script>
			<%
		}catch(Exception e){
			System.out.println("DB close error:"+e);
		}
	}
	%>
	<script>
	location.href="index.jsp";
	</script>
</body>
</html>