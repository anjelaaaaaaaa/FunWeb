<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// member/updatePro.jsp
// 폼에서 입력한 내용이 서버에 전달 - > request 내장객체에 저장
// request 한글처리
request.setCharacterEncoding("utf-8");
// request 태그이름에 해당하는 값을 가져오기 => 변수에 저장(id, pass, name)
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
// 현시스템 날짜 Timestamp 가져오기 => date 변수 저장
// 추가 email address phone mobile
String email = request.getParameter("email");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");


//MemberDAO 객체생성
MemberDAO dao = new MemberDAO();

//MemberDTO dto = userCheck(id,pass) 메서드 호출
MemberDTO dto = dao.userCheck(id, pass);


// 수정할 내용을 바구니 객체 생성 => 바구니에 저장
MemberDTO updateDto = new MemberDTO();
updateDto.setId(id);
updateDto.setPass(pass);
updateDto.setName(name);
updateDto.setEmail(email);
updateDto.setAddress(address);
updateDto.setPhone(phone);
updateDto.setMobile(mobile);



// 아이디 비번 일치 => 바구니 주소 가져오기
// dao.updateMember(updateDto) 메서드 호출 => main 이동

// 아이디 비번 불일치 => 빈 바구니 주소 가져오기
// 데이터 없으면 false => 아이디 비번 불일치
// => script 아이디 비번틀림. 뒤로이동 

if(dto != null){
	dao.updateMember(updateDto);
	response.sendRedirect("../main/main.jsp");
}else {
	%>
	<script>
	alert("아이디, 비밀번호 틀림");
	history.back();
	</script>
	<%
}


%>