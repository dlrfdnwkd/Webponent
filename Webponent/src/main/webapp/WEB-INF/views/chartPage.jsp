<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Chart Page</title>
		<script>
			var excelData;
			//Receive excel data
			function getExcelData(index){
				$.ajax({
					type: "POST",
					dataType: "json",
					data: {"excelIndex":index},
					url: "/webponent/getExcelData",
					success: function(data){
						excelData = data;
						alert("엑셀데이터를 성공적으로 받아왔습니다!");
					},
					error: function(xhr, status, error){
						alert(error);
					}
				});
			}
		</script>
		<script src="/resources/js/jquery-3.4.1.min.js"></script>
	</head>
	<body>
		<p>Chart Service</p>
		<button id="excelBtn1" onClick="getExcelData(1);">인공지능 엑셀 데이터 받아오기</button>
		<button id="excelBtn2" onClick="getExcelData(2);">딥러닝 엑셀 데이터 받아오기</button>
	</body>
</html>