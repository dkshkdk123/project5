<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "test3.DBcon" %>
    <%@ page import = "java.util.*, java.text.*" %>
<%@ include file ="header.jsp"%>

<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/footer.css" />
<style>
	.content{clear: both; width: 100%; height: 830px; background: yellow;}
	.page{clear: both; width: 1800px; margin: 0 auto;}
	.tit{font-szie:20px; font-weight:bold; text-align:center; padding: 30px;}
	.main_help { width: 960px; margin: 25px auto; font-size:14px;}
	.main_help ol{padding-top:5px;}
	.tb{display: table; border:1; width: 960px;}
	.tb tr{display: table-row;}
	.tb td, .tb th{display: table-cell; padding: 10px;}
		button{display: block; float: left; width: 120px; line-height:36px; text-align:center; margin-right:25px; margin-left:25px; border-radius:5px; background-color:#999; color:#fff;}
	input, select{border:1px solid #999; line-height:24px; padding-left:5px;}
</style>
</head>
<body>
	<%@ include file ="nav.jsp"%>
		<main class="content">
			<section class="page" id="page1">
				<h2 class="tit">검색결과조회</h2>
				<div class="main_help">
					<table class="tb"  border="1">
						<thead>
							<tr>
								<th class="p_id">회원아이디</th>
								<th class="c_name">회원비밀번호</th>
								<th class="cnt">회원명</th>
								<th class="">대출상태</th>
								<th class="">도서코드</th>
								<th class="">작가</th>
								<th class="">도서이름</th>
							</tr>
						</thead>
						<tbody>
						

					<%
					request.setCharacterEncoding("utf-8");
	
					DBcon db;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs;
					
					String p_id, p_pw, c_name, status,bookno, author, bookname;
					try{
						conn = DBcon.getConnection();
						
						String sql = "select a.p_id, a.p_pw, a.c_name, b.status,c.bookno, c.author, c.bookname ";
						sql += "from custom_01 a inner join reservation_tbl b on a.p_id = b.custname ";
						sql += "inner join bookinfo_tbl c on b.bookno = c.bookno order by a.p_id asc ";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while(rs.next()){
							
							p_id = rs.getString("p_id");
							p_pw = rs.getString("p_pw");
							c_name = rs.getString("c_name");
							status = rs.getString("status");
							bookno = rs.getString("bookno");
							author = rs.getString("author");
							bookname = rs.getString("bookname");
							
							
							switch(status){
							case "1" : status = "대출"; break;
							case "2" : status = "반납"; break;
							}
						%>
						<tr>
							<td class="p_id"><%=p_id %></td>
							<td class="c_name"><%=p_pw %>-<%=p_pw %>-<%=p_pw %></td>
							<td class="cnt"><%=c_name %></td>
							<td class="status"><%=status %></td>
							<td class="status"><%=bookno %></td>
							<td class="status"><%=author %></td>
							<td class="status"><%=bookname %></td>
						</tr>
						<% 
						}
						%>
						</tbody>
					</table>
					<%
					}catch(Exception e){
						System.out.println("DB Connection error :"+e);
						%>
						<script>
						alert("데이터베이스 연결이 실패되어 회원매출정보 조회 작업이 완료되지 못했습니다.");
						location.href = "memberIns.jsp";
						</script>
						<%
					}finally{
						try{
							if(pstmt!=null) pstmt.close();
							if(conn!=null) conn.close();
						%>
						<script>
						alert("검색결과 조회 성공!");
						</script>
						<%
						}catch(Exception e){
							//핸들 에러 프린트
							System.out.println("DB Close error:"+e);
						}
					}
						%>
				</div>
			</section>
		</main>
	<%@ include file ="footer.jsp"%>
