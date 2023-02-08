<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// main/jsonarr.jsp

	BoardDAO dao = new BoardDAO();

//	boardList 에 1번부터 5개를 담음 
 	List<BoardDTO> boardList= dao.getBoardList(1, 5);
 	
//  	자바를 json으로 변경하는 프로그램 설치
// 		WEB-INF - lib - json-simple-1.1.1.jar 설치

//  	자바배열데이터 => json으로 바꾸는 작업 (나중에 스프링에서는 자동으로 바뀔거임)
//		JSON배열 => JSONArray
		JSONArray arr = new JSONArray();
// 		날짜를 형식에 맞게 변환해줌. dateFormat.format(date())이런식으로,, 사용하면 됨. 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");

 		for(int i = 0; i<boardList.size();i++){
 			BoardDTO dto = boardList.get(i);
 		
// 		BoardDTO랑 같은역할을 함 => JSONObject 
 			JSONObject object = new JSONObject();   
		
	 		object.put("num",dto.getNum());
	 		object.put("subject", dto.getSubject());
			object.put("date",dateFormat.format(dto.getDate()));
			
// 		배열 한 칸에 저장 (object하나 배열한칸~, 또 다른 object하나 배열한칸~ 하나씩 저장됨 배열에.)
			arr.add(object);
 			}
%>
<%= arr %>
