<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {margin: 0 auto;}
a {color:#333; text-decoration: none;}
    
.find {text-align:center; 
    width:600px;
    height:350px;
    padding: 20px 10px;
    margin-top: 40px;"; 
    }
    
    .btn1{
        width:282px;
    }
    .btn2{
        width:50px;
    }
    .btn3{
        width:230px;
    }
.modal_wrap{
        display: none;
        width: 500px;
        height: 300px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
        text-align: center;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    .modal_wrap2{
        display: none;
        width: 500px;
        height: 300px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
        text-align: center;
    }
    .black_bg2{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_close2{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    }
    .modal_close2> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }
    td{
    text-align: left;
    }

</style>
	
<script>
 
  function check() {
        alert('인증');
  }

    
  window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
  
 
    function onClick2() {
        document.querySelector('.modal_wrap2').style.display ='block';
        document.querySelector('.black_bg2').style.display ='block';
    }   
    function offClick2() {
        document.querySelector('.modal_wrap2').style.display ='none';
        document.querySelector('.black_bg2').style.display ='none';
    }
 
    document.getElementById('modal_btn2').addEventListener('click', onClick2);
    document.querySelector('.modal_close2').addEventListener('click', offClick2);
 
  };

  
  var idV = "";
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/userSearch?inputName_1="
					+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}
</script>


</head>
<body>
<!-- top bar  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script><script src="resources/JSs/bar_js/get_top_bar.js"></script><div id="top_bar" ></div>

  <div class="find">
    <form method="post" action="member_find_id.php" >
        <fieldset >
          <legend>아이디 찾기</legend>
            <table>
              <tr>
                <td>이름</td>
                <td><input class="btn1" type="text"  name="name" placeholder="이름"></td>
              </tr>
              <tr>
                <td>핸드폰번호</td>
                <td><input type="text" class="btn1" name="name" placeholder="핸드폰번호">
              </tr>
            </table>
          <input type="button" value="아이디 찾기" id="modal_btn"/>
      </fieldset>
    </form>
  </div>
  <div class="find"style="width:600px; height:100px;margin-top: -180px;padding:20px 10px;">
      <form method="post" action="">
        <fieldset >
          <legend>비밀번호 찾기</legend>
            <table>
              <tr>
                <td>아이디</td>
                <td><input type="text" class="btn1" name="userid" placeholder="아이디"></td>
              </tr>
              <tr>
                <td>이름</td>
                <td><input type="text" class="btn1" name="name" placeholder="이름">
              </tr>
              <tr>
                <td>핸드폰번호</td>
                <td><select name="emadress" class="btn2"><option value="SKT">SKT</option>
                <option value="KT">KT</option><option value="LGU+">LGU+</option></select><input type="text" placeholder="핸드폰 번호"  class="btn3" >
                <input type="button" value="인증 " onclick="check();" ></td>
              </tr>
              <tr>
                <td>인증번호</td>
                <td><input type="text" class="btn1"name="name" placeholder="인증번호">
                    <input type="button" value="인증 확인 " onclick="check();" />
              </tr>
            </table>
          <input  type="button" value="비밀번호  찾기 " id="modal_btn2" />
        </fieldset>
   	</form>
  </div>
  <div class="black_bg"></div>
    <div class="modal_wrap">
	    <div class="modal_close"><a href="">close</a></div>
		    <div>
		        <h1>ID 찾기</h1>
			        <table>
			            <tr>
			                <td id="id_value"></td>
			            </tr>
			        </table>
		    </div>
    </div>

   <div class="black_bg2"></div>
    <div class="modal_wrap2">
	    <div class="modal_close2"><a href="">close</a></div>
		    <div>
		        <h1 >비밀번호변경</h1>
            <div class="modal_text">
    <table>
              <tr>
                <td>새 비밀번호</td>
                <td><input type="text" name="userid" placeholder="비밀번호"></td>
              </tr>
              <tr>
                <td>새 비밀번호 확인</td>
                <td><input type="text" name="name" placeholder="비밀번호 확인">
              </tr>
</table>
            </div>
            <a href="http://localhost:9101/uhBoard/sign_in"><input type="button" value="로그인" ></a>
            
        </div>
    </div>
</div>

</body>
</html>