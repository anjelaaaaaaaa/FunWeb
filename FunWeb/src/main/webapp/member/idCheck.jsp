<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// member/idCheck.jsp?id=kim 이런식으로 파라미터 값이 넘어올거임,,,,,, 
String id = request.getParameter("id");

// MemberDAO 객체생성
MemberDAO dao = new MemberDAO();
// MemberDTO객체 생성하고 dao.getMember(id) 메서드 호출
MemberDTO dto = dao.getMember(id);

// dto가 null이 아니면 중복된 아이디라는 의미 
// dto가 null이면 존재하지 않는 아이디임 , 아이디 사용가능 
// => result변수에 담을거임 ! 
String result="";
if(dto != null){
	// 아이디 있음 => 아이디 중복
	result = "아이디 중복";
} else {
	// 아이디 없음 => 아이디 사용가능
	result = "아이디 사용가능";
}
%>
<%=result%>




