<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="serviceKey" value="32LhEcAt92tVnlXIsGrJ6fSn2BqC1XtzUqxU432qhzk3Lu8%2BU5TEwxJTzLsAW7xmu3JCvM3CfPxBYO7nu82Pqg%3D%3D"/>

<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="commonCss" value="${root}/assets/css" />
<c:set var="commonJs" value="${root}/assets/js" />
<c:set var="commonImg" value="${root}/assets/img" />
<meta charset="UTF-8">
<title>SSAFY 9th KDP&LDK</title>

<%-- 부트스트랩 사용을 위한 코드 --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />

<!-- CSS only -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css" />
<link rel="stylesheet" href="${commonCss}/header.css" />
<link rel="stylesheet" href="${commonCss}/main.css" />
<link rel="stylesheet" href="${commonCss}/footer.css" />
<link rel="stylesheet" href="${commonCss}/signup.css" />
<link rel="stylesheet" href="${commonCss}/login.css" />
<link rel="stylesheet" href="${commonCss}/memberPage.css" />
<link rel="stylesheet" href="${commonCss}/search.css" />

<style>
@font-face {
	font-family: "TheJamsil5Bold";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2")
		format("woff2");
	font-weight: 700;
	font-style: normal;
}
</style>