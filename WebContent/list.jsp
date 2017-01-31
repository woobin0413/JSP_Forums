<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>본격! 게시판 - 게시글 리스트</title>		<!-- 윈도우 상단에 뜨는 내용입니다. -->
<style type="text/css">
	table, td, th
{
	border:1px solid green;
}
	th
{
	background-color:green;
	color:white;
}
</style>
</head>
<body>											<!-- HTML문서의 주 내용이 들어가는 부분입니다. -->
	<h1>게시글 리스트</h1>						<!-- 헤드라인 글씨를 표현하는 태그입니다. -->
	<table>										<!-- 표 형식의 데이터를 표현하는 태그입니다. -->
		<tr>									<!-- table태그 내에서 행을 정의할때 쓰는 태그입니다. -->
			<th>번호</th>						<!-- Table Header의 약자로 table태그 내에서 -->
			<th>제목</th>						<!-- 강조하고싶은 컬럼을 나타낼때 쓰는 태그입니다. -->
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${articleList}" var="article">
			<tr>
				<td>${article.idx}</td>
				<td><a href='count.do?idx=${article.idx}'>${article.title} </a></td>
				<td>${article.writer}</td>
				<td>${article.regdate}</td>
				<td>${article.count}</td> 
			</tr>
		</c:forEach>
	</table> 
	
	<c:if test="${page > 0}"> 
		<a href="list.do?page=${page-10}">이전페이지</a> 
	</c:if>
	<c:if test="${page == 0}"> 
		<a href="#">이전페이지</a> 
	</c:if>
	
	<fmt:parseNumber value="${page/10+1 }" type="number"  integerOnly="True" /> 페이지 
	
	<c:if test="${fn:length( articleList ) < 10}"> 
		<a href="#">다음페이지</a>
	</c:if>
	<c:if test="${fn:length( articleList ) == 10}"> 
		<a href="list.do?page=${page+10}">다음페이지</a>
	</c:if>
	<br/><a href="write.jsp">글쓰기</a>
</body>
</html>