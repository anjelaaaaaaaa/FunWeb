<%@page import="java.util.List"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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

<script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
<script type="text/javascript">
	// jQuery 준비 => 대상.함수()
	$(document).ready(function(){
	
	//  class="brown" 클릭했을때 "클릭"이라는 메세지 뜨게끔. 
		$('.brown').click(function(){
			
// 		초기화를 함 => 왜냐면 ,, 데이터불러오기 전에 초기화를 안하면 클릭할때마다 5개씩 추가가 됨 ! 	
		$('table').html('');
		
// 		 DB에서 xml을 가져올거임 
// 		<board>  데이터를  임의로 태그형태로 만든다 . 
// 			<tr><subject>제목1</subject><date>2023-01-01</date></tr>
// 			<tr><subject>제목2</subject><date>2023-01-02</date></tr>
// 			<tr><subject>제목3</subject><date>2023-01-03</date></tr>
// 		</board>

		
		
// 		// 자바스크립트 배열(json) 선언 
// 		var arr = [{"subject":"제목1","date":"2023-01-01"},
// 					{"subject":"제목2","date":"2023-01-02"},
// 					{"subject":"제목3","date":"2023-01-03"}
// 					];  // DB에서 데이터 들고올때 이런식으로 값을 들고올거임 ! 

					
		// 저위에 자바스크립트 배열같은거를,,,, json 배열을 들고올거임 jsonarr.jsp
		// 대상이 파일이기때문에 $. 
		$.ajax({
			url : 'jsonarr.jsp' ,
			dataType : 'json', 
			success : function(arr){   // function(변수)  변수명은 임의로 정하면 됨
				
				// 배열을 반복해서(for문 돌려서) 출력하는것 먼저 연습 !  .each()
				$.each(arr,function(index,item){
//		 			태그 뒤부분에 추가해서 넣기 append()
					$('table').append('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
				});		 
			}
		});    
		
					
	
		});
	});   // ready(function)
</script>
 

</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="payment">
<h3>Web Payment Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Security</span> News</h3>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
</div>

<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>
 <!--  	처음 홈페이지를 새로고침 했을때 바로 출력하게끔 하는거 !  -->
 	<%
// 	BoardDAO dao = new BoardDAO();
// 	List<BoardDTO> boardList= dao.getBoardList(1, 5);
// 	for(int i = 0; i<boardList.size();i++){
// 		BoardDTO dto = boardList.get(i);
		%>
<%-- 		<tr><td class="contxt"><a href="#"><%=dto.getSubject()%></a></td>  --%>
<%--    		 <td><%=dto.getDate() %></td></tr>	 --%>
		<%
// 	}
	%>
</table>
</div>


</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>