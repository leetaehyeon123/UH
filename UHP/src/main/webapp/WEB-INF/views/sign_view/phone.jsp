<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String isApi="true";
    isApi=(String)request.getParameter("api"); 
    if(isApi==null){
    	isApi="true";
    }
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JSs/ajax/ajax.js"></script>
	<script type="text/javascript">
		function send(url){
			$("#member_phone").val($("#phone_num").val());
				url=url+'?to='+$('#phone_num').val();
				ajaxDo(url,'');
				$("#phone_num").attr("readonly" ,"readonly");
				
				
			}
		
		function checkCode(url){
				url=url+"?code="+$('#code').val();

				if(ajaxDo(url,'#checkCode')=='true'){
					<%if(isApi.equals("false")&&isApi!=null){%>//api로그인 방식에서 부르지 않았을때 
						$('#signUpBtn').removeAttr("disabled");
					<%}else{%>//api로그인 방식에서  불렀을때
						$('#phone_form').submit();
					<%}%>
					
				}else{
					alert("코드 잘못 입력");
					}
			
								
			}
			
	
	</script>
<body>


		<div class="phone_div">
			<form id='phone_form' action="hasNick" method="post">
				<input name='platform' type="hidden" value='<%=request.getParameter("platform") %>' > 
				<input name='email' type="hidden" value='<%=request.getParameter("email") %>'>
				<input name="phone_num" type="text" id="phone_num" placeholder="휴대폰번호">
				<input type="button" value="인증번호 전송" onclick="send('smsPage.do')"><br>
				<input type="text" id="code" placeholder="인증번호">
				<input type="button" value="확인" onclick="checkCode('smsIsCode.do')">
			</form>
		</div>
		<div id="checkCode" style="display: none"></div>
		
		<!-- ajax로 이페이지를 부를때 phone_num의 값을 필요로 한다. 하지만 위의 phone_num은 다른 폼에 묶여 있어서 호출한 페이지 폼에서 값으로 사용할 수 없다. 그래서 임의 input상자에 phone_num을 담아 변수처럼 사용-->
		<input name="member_phone" type="hidden" id="member_phone" >
	
	

</body>
</html>