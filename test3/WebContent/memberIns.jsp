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
	<%@ include file ="nav.jsp"%>
	<main class="content">
		<section class="page" id="page1">
			<h2 class="tit">도서관 회원등록</h2>
			<div class="main_help">
				<form action="memberInsPro.jsp" name="register1" id="register1" method="get">
					<table class="tb" border="1">
						<tbody>
							<tr>
								<th><label for="p_id">회원ID</label></th>
								<td>
									<input type="text" name="p_id" id="p_id" />
									<input type="button" name="con_btn" id="con_btn" value="중복확인" style="padding:3px 6px;">
								</td>
							</tr>
							<tr>
								<th><label for="p_pw">비번</label></th>
								<td>
									<input type="password" name="p_pw" id="p_pw"/>
								</td>
							</tr>
							<tr>
								<th><label for="c_name">회원명</label></th>
								<td><input type="text" name="c_name" id="c_name"></td>
							</tr>
							<tr>
								<th><label for="c_email">회원 이메일</label></th>
								<td><input type="text" name="c_email" id="c_email"></td>
							</tr>
							<tr>
								<th><label for="c_tel">연락처</label></th>
								<td><input type="text" name="c_tel" id="c_tel"></td>
							</tr>
							<tr class="tb2">
								<td colspan="2" >
									<button type="button" id="submit_btn" >등록</button>
									<button type="button" id="search_btn" >조회</button>
									
								</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="passon" id="passon" />
				</form>
				<script>
				var form = document.register1;
				var submit_btn = document.getElementById("submit_btn");
				var search_btn = document.getElementById("search_btn");
				var con_btn = document.getElementById("con_btn");
				var p_id = form.p_id;
				var p_pw = form.p_pw;
				var c_name = form.c_name;
				var c_email = form.c_email;
				var c_tel = form.c_tel;
				var passon = form.passon;
				
				con_btn.addEventListener("click", function(){
					if(p_id.value==""){
						alert("아이디 입력란이 비어있습니다.");
						p_id.focus();
						return;
					} else {
						window.name = "parentForm";
						window.open("idcheck.jsp?c_id="+p_id.value,"chkForm", "width=500, height=300, resizable=no, scrollbars=no");
					}
				});
				submit_btn.addEventListener("click", function(){
					if(passon.value!="ok"){
						alert("아이디에 대한 중복확인을 하지 않았습니다.");	
						con_btn.focus();
						return;
					}
					if(p_id.value==""){
						alert("아이디가 입력되지 않았습니다.");
						p_id.focus();
						return;
					}

					if(p_pw.value==""){
						alert("비번이 입력되지 않았습니다.");
						p_pw.focus();
						return;
					}
					if(c_name.value==""){
						alert("회원명이 입력되지 않았습니다.");
						c_name.focus();
						return;
					}
					if(c_email.value==""){
						alert("이메일이 입력되지 않았습니다.");
						c_email.focus();
						return;
					}
					if(c_tel.value==""){
						alert("연락처가 입력되지 않았습니다.");
						c_tel.focus();
						return;
					}
					if(passon.value=="ok" && p_id.value!="" && p_pw.value!="" && c_name.value!="" && c_email.value!=""&& c_tel.value!=""){
						form.submit();
					}
				});
					
				search_btn.addEventListener("click", function(){
					location.href="memberSearch.jsp";
				});
				</script>
			</div>
		</section>
	</main>
	
	<%@ include file ="footer.jsp"%>
