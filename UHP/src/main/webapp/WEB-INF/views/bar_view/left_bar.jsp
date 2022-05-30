<%@page import="java.net.URLDecoder"%>
<%@page import="com.uh.vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ArrayList<ArrayList<BoardVo>> returnList = (ArrayList<ArrayList<BoardVo>>)request.getAttribute("list"); 
    	String nick= (String)session.getAttribute("nick");
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="resources/CSSs/bar_css/left_bar.css" rel="stylesheet"> -->

<style type="text/css">
	@charset "UTF-8";
.context_container{
	margin-left:260px;
}
.left_bar_container{
	margin-top:77px;
	position: absolute;
	width: 250px;
	background-color: #f7f9fa;
	border: 1px solid #dae1e6;
	
}
.sign_info_container{
	width:90%;
	height: 200px;
	border:1px solid black;
	margin: 10px auto 10px auto;
	background-color: white;
}
.category_container{
	width:90%;
	border:1px solid black;
	margin: 10px auto 10px auto;
	background-color: white;
}
.board_fontsize{
	list-style:none;
	font-size: 5px;
}
.loginBtn{
	border: 1px solid #3c4790;
    background: #4a57a8;
    text-align: center;
    color: #fff;
    font-weight: bold;
    text-shadow: 0px 1px #343d8e;
    margin: auto;
    width: 95%;
    height: 40px; 
    cursor: pointer;
}

.join
{
	text-decoration: none;
	font-weight: bold;
	float: center;
	font-weight: 1px;
    color: #000000;
}
.join2
{
	margin-top: 20px;
}

.login_msg
{
	font-size: 12px;
	padding-left: 3px;
    color: black;
}

	/* 123123 */
	.board_fontsize{
	   font-size: 12px;
	   list-style: none;
	  
	}
	.board_name_style{
	   color: #3c4790;
	   margin-block-start: 1.33em;
       margin-block-end: 1.33em;
       margin-inline-start: 0px;
       margin-inline-end: 0px;
       font-weight: bold;
       
	}
	.board_name{
		cursor: pointer;
	}
	.board_name:hover {
			background-color: #f7f9fa;
	}
	.decoration_style{
	   text-decoration: none;
	}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
	.cat{
		cursor: pointer;
	}
	
</style>
<script type="text/javascript">
	function goBoardMain(post_board_name){
			location.href='board_main?post_board_name='+post_board_name;
		}

</script>

</head>
<body>

<div class="left_bar_container">

	<!-- 회원 정보창 -->
	<div class="sign_info_container">	
	<%if(nick==null){ %>
		<p class="login_msg">로그인 후에만 이용이 가능합니다.</p>
		<div class="logjoin"style="text-align: center; width: 100%;">
			<div>
				<input class="loginBtn" type="button" value="로그인" onclick='location.href="sign_in"' >
			</div>
			<div class="join2">
				<a href="sign_agree" class="join">회원가입</a>
			</div>	
		</div>
	<%}else{ %>
	<div class="join2" style="text-align: center;margin-top: 10px;">
			<p ><%=nick%>님 환영합니다.</p>	
			<br>
			<a href='board_main?post_board_name=ALL&search_mode=post_member_nick&search_str=<%=nick%>&my=my' class="join" >
				내가 쓴 게시물
			</a>
			<br><br>
			<a href="sign_out" class="join" >로그아웃</a>
			
		</div>	
	<%} %>
	</div>
	
	<!-- 카테고리 -->
	<div class="category_container">
	 <span style="font-size: 24px;">전체 게시판</span><br>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="resources/JSs/ajax/ajax.js"></script>
	<script type="text/javascript">
	
			<%Cookie cookies[]=request.getCookies();%>
			<%for(int i=0;i<cookies.length;i++){%>
				<%if(cookies[i].getName().contains("carTag")){%>
					displayTag(<%=cookies[i].getName().replaceFirst("carTag", "")%>);
				<%}%>
			<%}%>
		

		function tagClick(j){
			ajaxDo("displayTag?j="+j,"");
			displayTag(j);
			}
		function displayTag(j){			
				var tags=document.getElementsByClassName('tag'+j);
				if(tags[0].style.display=='none'){
					for(i=0;i<tags.length;i++)
						tags[i].style.display='block';
						$("#tagPluse"+j).text("-");
				}else{
					for(i=0;i<tags.length;i++)
						tags[i].style.display='none';
					$("#tagPluse"+j).text("+");
					}
			}
		
	</script>
	
	<%    
    	String str="";
		for(int j=0;j<returnList.size();j++) {
		
			for(int i=0;i<returnList.get(j).size();i++) {
				
				if(!returnList.get(j).get(i).getBoard_category().equals(str)) {
					str=returnList.get(j).get(i).getBoard_category();
					out.println("<span class='cat' onclick='tagClick("+j+")' style='color:blue;font-size:18px;'>"+returnList.get(j).get(i).getBoard_category()+"("+returnList.get(j).size()+")</span>");
					out.println("<span id='tagPluse"+j+"' style='font-size:13px'>+</span><br>");
				}
			
				out.println(" <a class='tag"+j+"' href='board_main?post_board_name="+returnList.get(j).get(i).getBoard_name()+"' style='display:none'>");
				out.println("<p> &nbsp &nbsp &nbsp &nbsp"+returnList.get(j).get(i).getBoard_name()+"</p></a>");
				
						
			}
		
			
		} %>


	</div>
	
	<!-- 광고 -->
	<div style="margin: 0px auto; width: 95%; " >
		<iframe src="https://adpick.co.kr/nativeAD/ad.php?bannerType=type8&limit=1&affid=c2a9f2&frameId=AdpickAdFrame_2020920%40223443&popup=false" width="100%" frameborder="0" scrolling="no" data-adpick_nativeAD id="AdpickAdFrame_2020920@223443" style="margin: 5px auto;"></iframe>
		<script src="https://adpick.co.kr/nativeAD/script.js" async="true"></script>
	</div>
</div>

</body>
</html>