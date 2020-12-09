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


<%
							request.setCharacterEncoding("UTF-8");
						
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs;
							
							String p_id = request.getParameter("p_id");
							String p_pw, c_name, c_email, c_tel;
							try{
								conn = DBcon.getConnection();
								String sql = "update custom_01 set p_pw=?, c_name=?, c_email=?, c_tel=? where p_id=?";
								pstmt = conn.prepareStatement(sql);	
								pstmt.setString(1, request.getParameter("p_pw"));
								pstmt.setString(2, request.getParameter("c_name"));
								pstmt.setString(3, request.getParameter("c_email"));
								pstmt.setString(4, request.getParameter("c_tel"));
								pstmt.setString(5, p_id);
								rs = pstmt.executeQuery();

						%>
						
										<%		
		}catch(Exception e){
			System.out.println("List error:"+e);
		}finally{
			try{
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				%>
				<script>
				alert("회원정보 수정 완료!");
				location.href="memberList.jsp";
				</script>
				<% 
			}catch(Exception e){
				System.out.println("DBcon error:"+e);
			}
		}
		%>
</body>
</html>