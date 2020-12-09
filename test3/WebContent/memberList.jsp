<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "test3.DBcon" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*, java.lang.*, java.net.*, java.util.*" %>

<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/footer.css" />
<%@ include file = "header.jsp" %>
<style>
	a{color:black;}
	.content{clear: both; width: 100%; height: 830px; background: yellow;}
	.page{clear: both; width: 1800px; margin: 0 auto;}
	.tit{font-szie:20px; font-weight:bold; text-align:center; padding: 30px;}
	.text{font-szie:16px; font-weight:bold; line-height:30px;}
	.lst2 li{font-size:14px; font-weight:bold;}
	table{width: 960px; text-align:center; margin: 25px auto;}
	.tb th, .tb td{padding: 20px;}
</style>
</head>
<body>

<%@ include file = "nav.jsp" %>

		<main class="content">
			<section class="page">
				<h1 class="tit">회원목록조회/수정</h1>
				<div class="page_help">
					<table border="1" class="tb">
						<thead>
							<tr>
								<th>회원아이디</th>
								<th>회원명</th>
								<th>회원 이메일</th>
								<th>연락처</th>
							</tr>
						</thead>
							<%
							request.setCharacterEncoding("UTF-8");
						
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs;
							
							String p_id, c_name, c_email, c_tel;
							try{
								conn = DBcon.getConnection();
								String sql = "select * from custom_01 ";
								pstmt = conn.prepareStatement(sql);
								rs = pstmt.executeQuery();
								
								while(rs.next()){
									
								p_id = rs.getString("p_id");
								c_name = rs.getString("c_name");
								c_email = rs.getString("c_email");
								c_tel = rs.getString("c_tel");
							
						%>
						<tbody>
					
							<tr>
								<td><a href="memberEdit.jsp?p_id=<%=p_id %>"><%=p_id %></a></td>
								<td><%=c_name %></td>
								<td><%=c_email %></td>
								<td><%=c_tel %></td>
							</tr>
						<%
								}
						%>
						</tbody>
					</table>
				
				</div>
			</section>
		</main>
	<%
									
		}catch(Exception e){
			System.out.println("List error:"+e);
		}finally{
			try{
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				System.out.println("DBcon error:"+e);
			}
		}
		%>
<%@ include file = "footer.jsp" %>
