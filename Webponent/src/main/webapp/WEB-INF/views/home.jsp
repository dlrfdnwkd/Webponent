<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Home</title>
	</head>
	<body>
		<h1>Hello world!</h1>
		<P>  The time on the server is ${serverTime}. </P>
		<a href="/chartPage">차트페이지 이동</a>
	</body>
</html>
