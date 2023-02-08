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
 
 <script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
 <script type="text/javascript">
//  	jQuery 준비 => 대상.함수() 
		$(document).ready(function(){   // 문서가 준비되면,,, 펑션기능하게! 

// 		id="join"   id는 join이라고 태그에 표시가 되어 있음 
// 		이 표시를 찾아가려면 #으로 찾아감 ! join이라는 id를 
		$('#join').submit(function(){   // 조인폼 서브밋을 누르면 펑션

// 			class="id"    대상('.id').함수()
			if($('.id').val()==""){     // 클래스가 id인 곳이 비어있으면 
				alert("아이디 입력하세요");  // 메세지 띄우고 
				$('.id').focus();		// 포커스 깜빡깜빡 
				// 대상 지정 => * 전체, h1 태그 , id=이름 #이름, class=이름 .이름 
				return false;}
		
			if($('.pass').val()==""){
				alert("비밀번호를 입력하세요");
				$('.pass').focus();
				return false;}
			
			if($('.pass2').val()==""){
				alert("비밀번호를 입력하세요");
				$('.pass2').focus();
				return false;}
			
			if($('.pass').val() != $('.pass2').val()){
				alert("비밀번호 틀림");
				$('.pass2').focus();
				return false;}
			
			if($('.name').val()==""){
				alert("이름을 입력하세요");
				$('.name').focus();
				return false;}
			
			if($('.email').val()==""){
				alert("이메일을 입력하세요");
				$('.email').focus();
				return false;}
			
			if($('.email2').val()==""){
				alert("이메일을 입력하세요");
				$('.email2').focus();
				return false;}
			
			if($('.email').val() != $('.email2').val()){
				alert("이메일 틀림");
				$('.email2').focus();
				return false;}
		});		// 
		
		// class="dup"를 클릭했을때 중복값이 있는지 체크해줌 
		$('.dup').click(function(){
			if($('.id').val()==""){
				alert("아이디를 입력하세요");
				$('.id').focus();
				return false; 
			}
			
			// ajax 비동기 방식 
			// 페이지 이동없이 디비에 가서 아이디 중복체크하고 결과를 가져와서 출력
			// idCheck.jsp라는 파일을 만들어서,, 그 파일에서 체크할거임. 
			$.ajax({
				url:'idCheck.jsp',
				// 예를들어 id = kim 이런식으로 파라미터 값을 들고감 ! idCheck.jsp로 가서 처리하고 result 돌아옴 
				data:{'id':$('.id').val()},   // 키 : 값 형태로 값을 넘길거임 
				success:function(result){
// 					alert(result);   어떤 result값이 넘어오는지 한번 출력 테스트 해봤음. 
					if(result.trim()=="아이디 중복"){
						$('.divresult').html(result).css('color','red');}
					else {
						$('.divresult').html(result).css('color','blue');}
					}
			}) // ajax 
		}); // click(function) 
		
 	});		// ready(function)
 </script>
 
 
 </head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="dup. check" class="dup"><br>

<label></label>
<div class="divresult">아이디 중복체크 결과</div><br>

<label>Password</label>
<input type="password" name="pass" class="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2" class="pass2"><br>
<label>Name</label>
<input type="text" name="name" class="name"><br>
<label>E-Mail</label>
<input type="email" name="email" class="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2" class="email2"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address"><br>
<label>Phone Number</label>
<input type="text" name="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>