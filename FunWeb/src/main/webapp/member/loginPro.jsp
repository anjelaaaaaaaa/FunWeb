<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// member/loginPro.jsp
// 폼에서 입력한 내용을 서버에 전달하면 request 내장객체에 저장됨
// request에 저장된 id, pass ㅍㅏ라미터값을 가져와서 변수 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");

// MemberDAO에 정의해놓은 DB연결정보를 가져올거임. 
// MemberDAO 객체생성
// 리턴받은 값 저장할 변수선언(MemberDTO dto) = userCheck(id, pass) 메서드 호출
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.userCheck(id, pass);

// dto null 아니면 아이디 비밀번호 일치 의미 => 페이지 상관없이 값을 유지하게끔 세션값을 생성해줌 
//                         			=> "이름" , 값   "id", id
//									=> main.jsp로 이동함 (main폴더 안에 있음)
// dto null이면 아이디,비밀번호 불일치를 의미 => 자바스크립트 사용 "아이디 비번 틀림" 출력
//									 => 뒤로 이동 !! 

if(dto != null){
	// null이 아니라는건 아이디, 비밀번호 일치한다 ! 
	session.setAttribute("id", id);
	response.sendRedirect("../main/main.jsp");
} else {
	%>
	<script type="text/javascript">
	alert("아이디, 비밀번호 불일치");
	history.back();	
	</script>
	<%
}


%>
