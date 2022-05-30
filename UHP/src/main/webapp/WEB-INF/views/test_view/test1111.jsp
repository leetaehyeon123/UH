<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn-upload").on("click", function() {
			var form = new FormData(document.getElementById('uploadForm'));
			$.ajax({
				url : "upload.do",
				data : form,
				dataType : 'json',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(response) {
					alert("success");
					console.log(response);
				},
				error : function(jqXHR) {
					alert(jqXHR.responseText);
				}
			});
		});
	}); 
	
</script>

</head>
<body>
	<div>
		<form id="uploadForm" enctype="multipart/form-data" method="POST"
			action="/pentode/upload.do">
			<label for="file1">파일 첫 번째</label>
			<div>
				<input type="file" id="file1" name="file" required="required" />
			</div>
		</form>
	</div>
	<div>
		<button id="btn-upload">파일 업로드</button>
	</div>


</body>
</html>