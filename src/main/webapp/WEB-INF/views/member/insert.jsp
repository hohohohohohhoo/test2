<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>회원 정보 입력 화면</h1>
<form action="/member/insert" method="post">
	ID : <input name="id"> <button>아이디 중복 체크</button> <br>
	PW : <input type="password" name="pw"><br>
	이름 : <input name="name"><br>
	번호 : <input name="phone"><br>
	생일 : <input name="birth" type="date"><br>
	<input type="submit" value="입력 완료">


</form>
</body>
</html>