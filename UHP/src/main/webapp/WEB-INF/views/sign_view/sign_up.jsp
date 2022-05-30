<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	if(request.getMethod().equals("GET"))
	{
		response.sendRedirect("sign_agree");
	}
	
%>
<title>회원가입 화면</title>
  <style>
        #wrap{
            width:880px;
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
  			padding:30px 10px;
         
			border: 1px solid #dae1e6;
			margin-top: 40px;
        }
        
        table{
            border:3px solid #BDBDBD;
            width:770px;
            margin: auto;
            table-layout: fixed;
            font-size: 20px;
        }
        
        td{
            border:1px solid #BDBDBD
        }
        
        #title{
            background-color:##FFFFFF
        }
        .input1, .input2, .input3,.input4,.input5,.input6{
        	float: left;
        	margin: 3px;
        }
        .span1{
        	font-size:16px;
        	float: left;
        	margin-left:6px;
        	color: blue;
        }
    </style>
</head>
<body>
<!-- top bar  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_top_bar.js"></script><div id="top_bar" ></div>

<script src="resources/JSs/ajax/ajax.js"></script>
<script type="text/javascript">

	
	
function checkId(){
	var returnAjax=ajaxDo("checkId.do?id="+$('#member_id').val(),"");
	
	if(returnAjax=='true'){
		ajaxDo("phone?api=false","#phone_container");
		$('#member_id').attr("readonly","readonly");
		alert("사용 가능한 아이디");
	}else{
		alert("사용 불가 아이디");
		}
}


function Sb(){
	if ($('#checkPw').val()==$('#pw').val()){
			return true;
		}
		alert('비밀번호 잘못입력');
		return false;
	
}

</script>


<div class="context_main" style="margin: auto; width: 1260px;" >
 <div id="wrap">
        <font size="6" color="gray">회원가입</font>
        <br><br><br>
        
        <form action="sign_up.do" onsubmit="return Sb()">
            <table>
                <tr>
                    <td id="title" width="1">아이디</td>
                    <td width="9">
                        <input id="member_id" class="input1" type="text" name="member_id" maxlength="20" >
                        <input class="input1" type="button" value="중복확인" onclick="checkId()">   
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input class="input3" type="text" name="member_name" maxlength="15">
                    </td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input id="pw" class="input4" type="password" name="member_pw" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input id="checkPw" class="input5" type="password"  maxlength="15" >
                    </td>
                </tr>  
    
             
                      <tr>
                    <td id="title">문자 인증</td>
                    <td>
                        <div id="phone_container" style="text-align: left" > 아이디 중복확인을 먼저 해주세요</div>
                    </td>
                </tr>    
            </table>
              
	          
            <br>
            <input id="signUpBtn" type="submit" value="가입" disabled="disabled">  <input type="button" value="취소" onclick='location.href="sign_in"'>
        </form>
    </div>
</div>
</body>
</html>