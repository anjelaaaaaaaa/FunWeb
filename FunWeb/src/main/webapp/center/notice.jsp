<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
BoardDAO dao = new BoardDAO();
// 한페이지에서 보여줄 글 갯수 
int pageSize = 3;
// 현 페이지 번호 가져오기 => 페이지 번호가 없으면 1페이지 설정 
// http://localhost:8080/webProject/board/list.jsp
// 1페이지 클릭해보면
// http://localhost:8080/webProject/board/list.jsp?pageNum=1 이렇게 pageNum=1 뜸 
String pageNum = request.getParameter("pageNum"); // pageNum값 받ㅇㅏ옴

// 페이지 넘버값 없는 경우 지정해줘야함
if(pageNum == null){
	// 페이지번호가 없으면 1페이지로 설정
	pageNum = "1";
}
// pageNum을 숫자로 변경 해야함 ! 
int currentPage = Integer.parseInt(pageNum);
// ㅅㅣ작하는 행번호 구하기 
// pageNum(currentPage) pageSize => 		startRow	 	 endRow
//		1					10	 =>		(1-1)*10 + 1 => 1	~	10
//		2					10	 =>		(2-1)*10 + 1 => 11	~	20
//		3					10	 =>		(3-1)*10 + 1 => 21	~	30
//		4					10	 =>		(4-1)*10 + 1 => 31	~	40
int startRow = (currentPage-1) * pageSize + 1 ;
// 끝나는 행번호 구하기
// startRow		pageSize		=> 	endRow
//		1			10			=>	 10 => 1+10-1 => 10
//		11			10			=>	 20 => 11+10-1 => 20
//		21			10			=>	 30 => 21+10-1 => 30
int endRow = startRow + pageSize-1;

ArrayList<BoardDTO> boardlist = dao.getBoardList(startRow, pageSize);

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");


%>




<!-- 게시판 -->
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    
    <%
    for(int i=0; i< boardlist.size();i++){
    	BoardDTO dto = boardlist.get(i);
    	%>
    	<tr><td><%=dto.getNum()%></td><td class="left"><%=dto.getSubject() %></td>
    <td><%=dto.getName()%></td><td><%=dateFormat.format(dto.getDate()) %></td><td><%=dto.getReadcount() %></td></tr>
    	<%
    }
    %>
    


</table>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">

<%
// 한 화면에 보여줄 페이지 개수 
int pageBlock = 3;
// 시작하는 페이지 번호 구하기
// int startPage = 계산식;
// currentPage			pageBlock	=> 				startPage
//	1~10 (0~9)				10		=>	(-1)/10*10 + 1 =>	0*10 + 1 => 0+1 => 1
//	11~20 (10~19)			10		=>	(-1)/10*10 + 1 =>	1*10 + 1 => 10+1 => 11
//	21~30 (20~29)			10		=>	(-1)/10*10 + 1 =>	2*10 + 1 => 20+1 =>21
int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
// 끝나는 페이지 번호 구하기
// int endPage = 계산식;
// startPage	pageBlock	=> endPage
//	1				10		=>	1+10 - 1 =>  10
//	11				10		=>	11+10 - 1 => 20
//	21				10		=>	21+10 - 1 => 30
int endPage = startPage + pageBlock - 1;

// 전체 페이지 구하는 작업......ㅎ 
// 전체글의개수 13/ 글개수 10 => 1.3 임 (0.3남아있으면 1페이지 추가)
// int count = 13;
// 전체글 개수 구하는 sql구문   select count(*) from board; 이걸 DAO에 정의해야함 
int count = dao.getBoardCount();

// 끝나는 페이지 (endPage)=10 전체페이지(pageCount)=2 
int pageCount = count/pageSize+(count%pageSize==0?0:1);
if(endPage > pageCount){
	endPage=pageCount;
}


%>
<%
if(currentPage > 1){
	%>
	<a href = "notice.jsp?pageNum=<%=currentPage-1 %>">[이전]</a>	
	<%
} 
// 10페이지 이전 이동
if(startPage > pageBlock){
	%>
	<a href = "notice.jsp?pageNum=<%=startPage-pageBlock %>">[3페이지 이전]</a>	
	<%
}
// 페이지 이동
for(int i=startPage; i<=endPage;i++){
	%>
	<a href="notice.jsp?pageNum=<%=i%>"><%=i %></a>
	<%
}
//다음 페이지 (1페이지씩) 전체페이지보다 현재페이지가 작은경우 다음버튼활성화 
if(currentPage < pageCount){
	%>
	<a href = "notice.jsp?pageNum=<%=currentPage+1 %>">[다음]</a>
	<%
}

// 10페이지 다음 이동
if(endPage < pageCount){
	%>
	<a href = "notice.jsp?pageNum=<%=startPage + pageBlock %>">[3페이지 다음]</a>
	
		<%
}
%>


</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
    