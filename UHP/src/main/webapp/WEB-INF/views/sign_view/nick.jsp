<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%String isApi="true";
    isApi=(String)request.getParameter("api"); 
    if(isApi==null){
    	isApi="true";
    }
    %>
    <% 
    	String platform=(String)request.getAttribute("platform");
    	String email=(String)request.getAttribute("email");
    	String phone_num=(String)request.getAttribute("phone_num"); 
    	String member_name=(String )request.getAttribute("member_name");
    	String member_id=(String )request.getAttribute("member_id");
    	String member_pw=(String )request.getAttribute("member_pw");
    	if(platform==null)
    		platform="";
    	if(email==null)
    		email="";
    	if(phone_num==null)
    		phone_num="";
    	if(member_name==null)
    		member_name="";
    	if(member_id==null)
    		member_id="";
    	if(member_pw==null)
    		member_pw="";
   
    
    %>
    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JSs/ajax/ajax.js"></script>
	<script type="text/javascript">
	//닉네임을 사용자가 다시칠때 서브밋을 사용불가로 만듬. 중복확인을 해야만 서브밋 다시 풀림
	function disSubmit(){
			$("#sub").attr("disabled","disabled");
		}
	

	//닉네임 중복확인 ajax
	function checkNick(){
			var nick=$("#nick").val();
			var check=ajaxDo("checkNick?nick="+nick,"");
			if(check=="true"){				
				alert('사용할 수 있는 닉네임');
				
				$("#sub").removeAttr("disabled");
			}else{
				alert('사용할 수 없는 닉네임');
			}		
		}
	function go(){
			alert("가입완료");
			<%if(isApi.equals("false")&&isApi!=null){%>//api로그인 방식에서 부르지 않았을때 
				alert(123);
				$('#nickform').attr('action','sign_up_nick.do');
				return true;
			<%}else{%>//api로그인 방식에서 이페이지를  불렀을때
				return true;
			<%}%>


		}
	

	</script>
</head>
<body>
<div>
	<form id="nickform" action="noNick" method="post" onsubmit="return go();">
		<input type="hidden" name="platform" value='<%=platform %>'>
		<input type="hidden" name="email" value='<%=email %>'>
		<input type="hidden" name="phone_num" value='<%=phone_num %>'>
		<input type="hidden" name="member_name" value='<%=member_name %>'>
		<input type="hidden" name="member_id" value='<%=member_id %>'>
		<input type="hidden" name="member_pw" value='<%=member_pw %>'>
		<input id="nick" type="text"  name="nick" placeholder="사용할 닉네임"  onkeyup="disSubmit()">
		<input type="button" value="중복확인" onclick="checkNick()">
		<input id="sub" type="submit" value="닉네임 사용" disabled="disabled">
	
	</form>
</div>

</body>
</html>