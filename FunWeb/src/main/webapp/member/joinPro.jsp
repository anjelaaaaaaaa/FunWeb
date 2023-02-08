<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// member/joinPro.jsp

// request 한글처리 
request.setCharacterEncoding("utf-8");

// 서버에 request 저장
// request 파라미터값 가져오기 id, pass, name 가져오기 
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

// 현재날짜는 Timestamp형으로 가져옴 => date 변수 저장
Timestamp date = new Timestamp(System.currentTimeMillis());

// member 패키지를 만들고 MemberDAO, MemberDTO 가져오기 

// MemberDTO 객체생성해서 
// set호출해서 값을 저장함 (ip,pass,name, 날짜)
MemberDTO dto = new MemberDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setDate(date);

// WEB-inf - lib -mysql-connector 넣기 
// META-INF => context.xml 파일 가져오기 
// MemberDAO 객체생성
// insertMember(dto) 메서드 호출 
MemberDAO dao = new MemberDAO();
dao.insertMember(dto);

// login.jsp로 이동 
response.sendRedirect("login.jsp");

%>
