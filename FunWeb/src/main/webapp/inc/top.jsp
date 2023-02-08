<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id = (String)session.getAttribute("id");
// 로그인 성공시 => 세션값 "id"를 생성했음. 
// 로그인 실패시 => 세션값 "id" 없음
if(id != null){
	// 로그인 성공 => 세션값 id 있음 => ...님 로그인했습니다, 회원정보 수정 등 아이콘 뜨게함 
		%>
	<div id="login"> <%=id %>님 |
	<a href="../member/logout.jsp">logout</a> | 
	<a href="../member/Update.jsp">update</a></div>	
		
	<%
}else {
	// 로그인 실패(로그인 하지 않은 상태) => 세션값 id 없음 => 로그인 or 회원가입 아이콘 뜨게함 
	%>
	<div id="login"><a href="../member/login.jsp">login</a> | 
	<a href="../member/join.jsp">join</a></div>	
	<%
}
%>

<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">회사소개</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>