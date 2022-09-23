<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>
<jsp:include page="../include/header.jsp"/>
<%--<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script> --%>
<style>

</style>
<script>
</script>
<body>
<section class="bg-light">
    <div class="container py-5">
        <div class="row align-items-center justify-content-between">
            <div class="contact-header col-lg-4">
                <h1 class="h2 pb-3 text-primary">Chting</h1>
                <h4 class="h5 regular-400">다양한 모임들을 둘러보고 가입하세요!</h4>
                <p class="light-300">
                    마음에 드는 모임이 없다면 모임을 만들어보세요 :)
                </p>
            </div>
            <div class="col-lg-3 col-12 pt-4">
                <a href="${pageContext.request.contextPath}/calendar/view"><input type="button" value="일정관리"
                       class="btn btn-primary rounded-pill btn-block shadow px-4 py-2"></a>

            </div>
            <div class="col-lg-3 col-12 pt-4">
                <input type="button" onclick="newGroup()" value="내 모임 만들러 가기"
                       class="btn btn-primary rounded-pill btn-block shadow px-4 py-2">

            </div>
        </div>
    </div>
</section>
<section class="py-5 mb-5">
    <div class="w-100">
        <%-- 가입한 모임 --%>
        <div class="container">
            <div class="row gy-5 g-lg-5 mb-4" id="joinGroupContainer">
                <h4 class="h4 typo-space-line"><i class="bx bx-user-check"></i>&nbsp;가입한 모임</h4>
                <%-- <c:forEach var="i" items="${groupListAll}"> --%>
                    <%-- <c:choose> --%>
                       <%--  <c:when test="${not empty i.group_name}"> --%>
                            <div class="col-md-4 mb-3">
                                <a href="board_main.do?group_no=${i.group_no}"
                                   class="recent-work card border-0 shadow-lg overflow-hidden">
                                    <img class="recent-work-img card-img img-responsive"
                                    <%-- <c:choose>
                                    <c:when test="${empty i.group_img}"> --%>
                                         src="${pageContext.request.contextPath}/resources/img/work-slide-05-small.jpg"
                                   <%--  </c:when>
                                    <c:otherwise> --%>
                                         src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}"
                                   <%--  </c:otherwise>
                                    </c:choose> --%>
                                         alt="Card image">
                                    <div class="recent-work-vertical card-img-overlay d-flex">
                                       <%--  <c:if test="${i.group_no == adminGroup.group_no}">
                                            <i class="fas fa-crown"></i>
                                        </c:if> --%>
                                        <div id="icon-${i.group_no}" class="alarmicon ms-auto"></div>
                                        <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                                            <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                                                <h3 class="card-title light-300">모임이름${i.group_name}</h3>
                                                <p class="card-text">
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                       <%--  </c:when> --%>
                    <%-- </c:choose> --%>
               <%--  </c:forEach> --%>
            </div>

            <div class="col-lg-3">
                <h4 class="h4 py-5 typo-space-line"><i class="bx bxs-group"></i>&nbsp;추천 모임</h4>
                <p>회원님의 지역과 관심사에 맞는 모임</p>
            </div>

            <div class="service-tag py-5 bg-secondary">
                <div class="col-md-12">
                    <ul class="nav d-flex justify-content-center">
                        <li class="nav-item mx-lg-4">
                            <a class="filter-btn nav-link btn-outline-primary active shadow rounded-pill text-light px-4 light-300"
                               href="#" data-filter=".project" id="allclick">ALL</a>
                        </li>
                        <li class="filter-btn nav-item mx-lg-4">
                            <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300"
                               href="#" data-filter=".new">New</a>
                        </li>
                        <li class="filter-btn nav-item mx-lg-4">
                            <a class="filter-btn nav-link btn-outline-primary rounded-pill text-light px-4 light-300"
                               href="#" data-filter=".best">Best</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <section class="container overflow-hidden py-5">
            <div class="row gx-5 gx-sm-3 gx-lg-5 gy-lg-5 gy-3 pb-3 projects">

               <%--  <c:forEach var="i" items="${bestGroupList}"> --%>
                    <div class="col-xl-3 col-md-4 col-sm-6 all best project">
                        <a href="board_main.do?group_no=${i.group_no}"
                           class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                            <img class="service card-img"
                                 src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}"
                                 alt="Card image">
                            <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                                <div class="service-work-content text-left text-light">
                                    <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300"> ${i.area_name} | ${i.catename} </span>
                                    <p class="card-text">${i.group_name}<br>
                                    <hr>
                                </div>
                            </div>
                        </a>
                    </div>
               <%--  </c:forEach> --%>
                <c:forEach var="i" items="${newGroupList}">
                    <div class="col-xl-3 col-md-4 col-sm-6 all new project">
                        <a href="board_main.do?group_no=${i.group_no}"
                           class="service-work card border-0 text-white shadow-sm overflow-hidden mx-5 m-sm-0">
                            <img class="service card-img"
                                 src="${pageContext.request.contextPath}/upload/groupimg/${i.group_img}"
                                 alt="Card image">
                            <div class="service-work-vertical card-img-overlay d-flex align-items-end">
                                <div class="service-work-content text-left text-light">
                                    <span class="btn btn-outline-light rounded-pill mb-lg-3 px-lg-4 light-300"> ${i.area_name} | ${i.catename} </span>
                                    <p class="card-text">${i.group_name}<br>
                                    <hr>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </section>

</body>
</html>