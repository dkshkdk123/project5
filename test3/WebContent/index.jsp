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
	.text{font-szie:16px; font-weight:bold; line-height:30px;}
	.lst2 li{font-size:14px; font-weight:bold;}

</style>
</head>
<body>

<%@ include file = "nav.jsp" %>

		<main class="content">
			<section class="page">
				<h1 class="tit">도서관 회원관리 프로그램</h1>
				<div class="page_help">
					<p class="text">도서관 회원정보와 회원대출정보 데이터베이스를 구축하고 도서관 회원관리 프로그램을 작성하는 포로그램이다.</p>
					<p class="text">프로그램 작성순서</p>
					<ul class="lst2">
						<li>1.회원정보 테이블을 생성한다.</li>
						<li>2.대출정보 테이블을 생성한다.</li>
						<li>3.회원정보, 대출정보 테이블에 제시된 무제지의 참조데이터를 추가 생성한다.</li>
						<li>4.회원정보 입력 화면 프로그램을 작성한다.</li>
						<li>5.회원정보 조회 프로그램을 작성한다.</li>
						<li>6.회원대출정보 조회 프로그램을 작성한다.</li>
					</ul>
				</div>
			</section>
		</main>

<%@ include file = "footer.jsp" %>

