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
				<h1 class="tit">회원대출 조회</h1>
				<div class="page_help">
					<table border="1" class="tb">
						<thead>
							<tr>
								<th>회원아이디</th>
								<th>회원성명</th>
								<th>대출건수</th>
								<th>대출상태</th>
							</tr>
						</thead>
						
						
						<tbody>
						<%
							request.setCharacterEncoding("UTF-8");
						
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs;
							
							String p_id, c_name, status;
							int cnt;
							
							
							try{
								conn = DBcon.getConnection();
								String sql = "select a.p_id, a.c_name, count(b.custname) as cnt, min(status) as st ";
								sql += "from custom_01 a join reservation_tbl b ON ";
								sql += "a.p_id = b.custname group by (a.p_id, a.c_name) ";
								sql += "order by cnt desc ";
								pstmt = conn.prepareStatement(sql);
								rs = pstmt.executeQuery();
								
								while(rs.next()){
									p_id = rs.getString("p_id");
									c_name = rs.getString("c_name");
									cnt = rs.getInt("cnt");
									status = rs.getString("st");
									
									switch(status){
									case "1" :status = "대출"; break;
									case "2" :status = "반납"; break;
									}
						%>
							<tr>
								<td><%=p_id %></td>
								<td><%=c_name %></td>
								<td><%=cnt %></td>
								<td><%=status %></td>
							</tr>
						<%
								}
						%>
						</tbody>
					</table>
					<%
									
		}catch(Exception e){
			System.out.println("List error:"+e);
		}finally{
			try{
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				%>
				
				<script>
				alert("회원대출 조회 성공!");
				
				</script>
				<% 
				
				
			}catch(Exception e){
				System.out.println("DBcon error:"+e);
			}
		}
		%>
				</div>
			</section>
		</main>

<%@ include file = "footer.jsp" %>
