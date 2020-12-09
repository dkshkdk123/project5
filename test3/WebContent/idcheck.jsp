<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "test3.DBcon" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*, java.lang.*, java.net.*, java.util.*" %>


<%@ include file = "header.jsp"%>

<style>
	#wrap{width: 490px; text-align:center; margin: 0 auto 0 auto;}
	#chk{text-align:center;}
	#msg{text-align:center; min-width:480px; min-height:100px;}
</style>
</head>
<body>

<div id="wrap">
	<br>
	<div id="msg"></div>
	<strong style="font-szie:12px; color:gray">아이디 중복 체크</strong>
	<hr size="1" width="460" >
	<br>
	<div id="chk">
		<form  id="checkForm" name="checkForm">
			<input type="text" name="c_id" id="c_id"/>
			<input type="button" value="중복확인" id="chk_btn" onclick="idCheck()" />
			<br><br><p></p>
			<div class="btn_grp">
				<input type="button" value="취소" onclick="window.close()" class="btn" id="cancelBtn" />&nbsp;&nbsp;
				<input type="button" value="사용하기" onclick="sendCheckValue()" class="btn" id="usebtn" />
			</div>
		</form>
	</div>
</div>
<script>
	<%request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	boolean idck = false;
	String data, str;
	%>
	
	var chk_btn = document.getElementById("chk_btn");
	var use_btn = document.getElementById("use_btn");
	var id, msg;
	var p_id;
	
	window.addEventListener("load", function loading(){
			document.getElementById("c_id").value = "<%=request.getParameter("c_id")%>";
	});
	chk_btn.addEventListener("click",function(){
		location.href = "idcheck.jsp?c_id="+document.getElementById("c_id").value;
		id = document.getElementById("c_id").value;

		if(!id){
			alert("아이디가 비어 있어요.");
			document.getElementById("c_id").focus();
			return;
		}else{
			<%
			String p_id =request.getParameter("p_id");
			try{
				conn = DBcon.getConnection();
				String sql = "select p_id from custom_01 where p_id=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_id);
				rs =pstmt.executeQuery();

				while(rs.next()){
					p_id = rs.getString("p_id");
						
				}
				if(idck){
					str = "사용이 불가능한 아이디 입니다.";
				} else{
					str = "사용이 가능한 아이디 입니다.";
				}
				%>
				alert("<%=str%>");
				<%
			}catch(Exception e){
				System.out.println("ProductBean erro:"+e);
			}finally{
				try{
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				}catch(Exception e){
					System.out.println("DB close error:"+e);
				}
			}
			%>
		}
	});
	usebtn.addEventListener("click", function(){
		opener.document.register1.passon.value = "ok";
		opener.document.register1.p_id.value = document.getElementById("c_id").value;
		self.close();
	});
</script>
