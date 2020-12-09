<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "test3.DBcon" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*, java.lang.*, java.net.*, java.util.*" %>

<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/footer.css" />
<%@ include file = "header.jsp" %>
<style>
	
	.content{clear: both; width: 100%; height: 830px; background: yellow;}
	.page{clear: both; width: 1800px; margin: 0 auto;}
	.tit{font-szie:20px; font-weight:bold; text-align:center; padding: 30px;}
	.tb{width: 960px;  margin: 25px auto;}
	.tb tr{display: table-row;}
	.tb tr, .tb td{padding: 20px;}
	.tb2, .tb3{text-align:center;}
	input{height: 25px;}
	
	button{width: 200px; height: 50px; margin-left: 25px; margin-right: 25px; font-size:16px; font-weight:bold;
	text-align:center; }
</style>
</head>
<body>

<%@ include file = "nav.jsp" %>

	<%
							request.setCharacterEncoding("UTF-8");
						
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs;
							
							String p_id = request.getParameter("p_id");
							String p_pw, c_name, c_email, c_tel;
							try{
								conn = DBcon.getConnection();
								String sql = "select * from custom_01 where p_id=?";
								pstmt = conn.prepareStatement(sql);	
								pstmt.setString(1, p_id);
								rs = pstmt.executeQuery();
							
								while(rs.next()){
									p_pw = rs.getString("p_pw");
									c_name = rs.getString("c_name");
									c_email = rs.getString("c_email");
									c_tel = rs.getString("c_tel");
						%>
		<main class="content">
			<section class="page">
				<h1 class="tit">도서관 회원 정보수정</h1>
				<div class="page_help">
					<form action="memberEditPro.jsp" id="register" name="register" method="post">
						<table border="1" class="tb">
							<tbody>
								<tr>
									<td class="tb3"><label for="p_id">회원ID</label></td>
									<td><input type="text" id="p_id" name="p_id" value="<%=p_id %>"/></td>
								</tr>
								<tr>
									<td class="tb3"><label for="p_pw">비번</label></td>
									<td><input type="password" id="p_pw" name="p_pw" value="<%=p_pw %>"/></td>
								</tr>
								<tr>
									<td class="tb3"><label for="c_name">회원명</label></td>
									<td><input type="text" id="c_name" name="c_name" value="<%=c_name %>"/></td>
								</tr>
								<tr>
									<td class="tb3"><label for="c_email">회원 이메일</label></td>
									<td><input type="text" id="c_email" name="c_email" value="<%=c_email %>"/></td>
								</tr>
								<tr>
									<td class="tb3"><label for="c_tel">연락처</label></td>
									<td><input type="text" id="c_tel" name="c_tel" value="<%=c_tel %>"/></td>
								</tr>
								<tr>
									<td colspan="2" class="tb2">
										<button type="button" id="submit_btn" name="submit_btn">수정</button>
										<button type="button" id="search_btn" name="search_btn">조회</button>
									</td>
								</tr>	
							</tbody>
						</table>
					</form>
					<script>
						var form = document.register;
						var submit_btn = document.getElementById("submit_btn");
						var search_btn = document.getElementById("search_btn");
						var p_id = form.p_id;
						var p_pw = form.p_pw;
						var c_name = form.c_name;
						var c_email = form.c_email;
						var c_tel = form.c_tel;
						
						submit_btn.addEventListener("click",function(){
							if(p_id.value==""){
								alert("회원아이디가 비어있습니다.");
								p_id.focus();
								return;
							}
							if(p_pw.value==""){
								alert("비밀번호가 비어있습니다.");
								p_pw.focus();
								return;
							}
							if(c_name.value==""){
								alert("회원 성명이 비어있습니다.");
								c_name.focus();
								return;
							}
							if(c_email.value==""){
								alert("회원 이메일이 비어있습니다.");
								c_email.focus();
								return;
							}
							if(c_tel.value==""){
								alert("회원 전화번호가 비어있습니다.");
								c_tel.focus();
								return;
							}
							if(p_id.value!="" && p_pw.value!="" && c_name.value!="" && c_email.value!="" && c_tel.value!=""){
								form.submit();
							}
						});
						search_btn.addEventListener("click",function(){
							location.href="memberList.jsp";
						});
					</script>
					
				</div>
			</section>
		</main>
				
						<%		
								}
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

