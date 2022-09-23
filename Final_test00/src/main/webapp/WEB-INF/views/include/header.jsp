<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet"> -->
<!-- Custom CSS -->
<!-- Select2 CSS -->
<!-- Sweetalert2 CSS -->
<%-- <link href="${pageContext.request.contextPath}/resources/css/sweetalert2.css" rel="stylesheet"/> --%>
<style>

</style>
<script>
</script>
<body>
<nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-white shadow">
    <div class="container d-flex justify-content-between align-items-center" id="logoBox">
            <a class="navbar_logo" href="${pageContext.request.contextPath}/index.do">
                <img class="logo_img" src="${pageContext.request.contextPath}/resources/img/demo_logo1.png" width="100px" alt="logo">
            </a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbar-toggler-success" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="align-self-center collapse navbar-collapse flex-grow-1" id="navbar-toggler-success">
            <div class="navbar flex-fill mx-xl-5 d-flex justify-content-center">
                <div class="pe-lg-5" id="nav search">
                    <form class="form-inline" action="${pageContext.request.contextPath}/search.do" method="get">
                        <div class="input-group input-group-navbar justify-content-center" id="searchGroup">
                            <select name="category" class="form-control form-select-sm search" aria-label="Search"
                                    id="searchSelect">
                                <option value="">전체</option>
                                <c:forEach items="${applicationScope.search_areaList}" var="area">
                                    <c:choose>
                                        <c:when test="${search_category != area.area_name}">
                                            <option value="${area.area_name}">${area.area_name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${area.area_name}" selected>${area.area_name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                            <input name="search" id="searchValue" type="search"
                                   class="form-inline form-control form-control-sm"
                                   placeholder="Search…" aria-label="Search"
                                   value="<c:out value="${search_keyword}"></c:out>">
                            <button id="searchButton" class="btn btn-sm btn-outline-secondary" type="submit">검색</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="navbar align-self-center d-flex justify-content-center">
                    <a class="navbar-btn btn btn-primary" href="${pageContext.request.contextPath}/myPage.do">MyPage</a>&emsp;|&emsp;
                    <a class="navbar-btn btn btn-primary" href="${pageContext.request.contextPath}/logout">Logout</a>
                    <a class="navbar-btn btn btn-primary" href="${pageContext.request.contextPath}/admin/dashboard">관리자</a>
            </div>
        </div>
    </div>
</nav>
</body>
</html>