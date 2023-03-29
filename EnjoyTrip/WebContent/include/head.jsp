<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="commonCss" value="${root}/assets/css" />
<c:set var="commonJs" value="${root}/assets/js" />
<c:set var="commonImg" value="${root}/assets/img" />
<meta charset="UTF-8">
<title>SSAFY 9th KDP&LDK</title>

<%-- 부트스트랩 사용을 위한 코드 --%>
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