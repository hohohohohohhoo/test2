<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<c:choose>
    	<c:when test="${empty login}">
    	<a href="/item/list">쇼핑몰가기</a> 
    	<a href="/member/insert">회원가입</a>
    	  <a href="/member/login">Login</a>
    	</c:when>
    	<c:otherwise>
    		${login.id}님, 환영합니다.
    		<a href="/member/logout">로그아웃</a>
    		<a href="/item/list">쇼핑몰가기</a> 
    	</c:otherwise>
    </c:choose>

<h1>회원 목록 화면</h1>

<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>번호</th>
			<th>생일</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${list}" var="dto">
		<tr>
			<td><a href="/member/read/${dto.id}">${dto.id}</a></td>
			<td>${dto.name}</td>
			<td>${dto.phone}</td>
			<td>${dto.birth}</td>
		</tr>
		</c:forEach>
	</tbody>

</table>





</body>
</html>