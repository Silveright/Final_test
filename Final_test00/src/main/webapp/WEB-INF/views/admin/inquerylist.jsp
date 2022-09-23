<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
a{text-decoration:none; color:black}
</style>
<!-- <script src="js/jquery-3.6.0.js"></script> -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
<script>
$(document).ready(function() { 
	
	var selectedValue='${search_field}'
	if(selectedValue !='-1')
		$("#viewcount").val(selectedValue);
	
	$(".search").click(function(){
		if($('#search').val()==''){
			alert("검색어를 입력하세요");
			$('input').focus();
			return false;
		}
	})

	
	$("#viewcount").change(function(){
		selectedValue=$(this).val();
		$("input").val('');
		message=["제목", "내용"]
		$("input").attr("placeholder", message[selectedValue]+"을 입력하세요")
	})
	
	});
</script>
</head>
<style>
input{border:1px solid black}
b{font-size:0.9em}
footer{
			bottom:0px; 
			height:3rem;
			background:#ccc;
			width:100%; 
			text-align:center;
			}
			.table-active {
    --bs-table-accent-bg: #776bcc59;
    color: #000000;
}
.btn-secondary {
    --bs-btn-color: #fff;
    --bs-btn-bg: #776bcc;
    --bs-btn-border-color: #776bcc;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #5646c9;
    --bs-btn-hover-border-color: #776bcc;
    --bs-btn-focus-shadow-rgb: 49,132,253;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #776bcc;
    --bs-btn-active-border-color: #776bcc;
    --bs-btn-active-shadow: inset 0 3px 5pxrgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #776bcc;
    --bs-btn-disabled-border-color: ##776bcc;}
    .page-link {
    position: relative;
    display: block;
    padding: var(--bs-pagination-padding-y) var(--bs-pagination-padding-x);
    font-size: var(--bs-pagination-font-size);
    color: #776bcc;
    text-decoration: none;
    background-color: var(--bs-pagination-bg);
    border: var(--bs-pagination-border-width) solid var(--bs-pagination-border-color);
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.pagination {
    --bs-pagination-padding-x: 0.75rem;
    --bs-pagination-padding-y: 0.375rem;
    --bs-pagination-font-size: 1rem;
    --bs-pagination-color: var(--bs-link-color);
    --bs-pagination-bg: #fff;
    --bs-pagination-border-width: 1px;
    --bs-pagination-border-color: #dee2e6;
    --bs-pagination-border-radius: 0.375rem;
    --bs-pagination-hover-color: var(--bs-link-hover-color);
    --bs-pagination-hover-bg: #e9ecef;
    --bs-pagination-hover-border-color: #dee2e6;
    --bs-pagination-focus-color: var(--bs-link-hover-color);
    --bs-pagination-focus-bg: #e9ecef;
    --bs-pagination-focus-box-shadow: 0 0 0 0.25remrgba(13, 110, 253, 0.25);
    --bs-pagination-active-color: #fff;
    --bs-pagination-active-bg: #776bcc;
    --bs-pagination-active-border-color: #776bcc;
    --bs-pagination-disabled-color: #6c757d;
    --bs-pagination-disabled-bg: #fff;
    --bs-pagination-disabled-border-color: #dee2e6;
    display: flex;
    padding-left: 0;
    list-style: none;
}
a{text-decoration:none;
color: #776bcc;}
</style>
<title>문의 처리</title>
</head>
<body>
<br>
	<div class="container">
	<%-- <c:if test="${listcount > 0 }"> --%>
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<br>

				<table class="table table-bordered">
					<thead>
						<tr class="table-active">
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<%-- <c:set var="num" value="${listcount-(page-1)*limit }"/>
						<c:forEach var="r" items="${totallist }"> --%>
						<tr>
							<td>
								1
								<%-- <c:out value="${num }"/>
								<c:set var="num" value="${num-1 }"/> --%>
							</td>
							<td>
								<a href="noticedetail?num=">제목</a>
							<%-- <c:if test="${r.review_re_lev !=0 }">
								<c:forEach var="a" begin="0" end="${r.review_re_lev*2 }" step="1">
									&nbsp;
								</c:forEach>
								<img src="${pageContext.request.contextPath}/image/mypage/line.gif">
							</c:if> --%>
							<%-- 
							<c:if test="${r.review_re_lev ==0 }">
								&nbsp;
							</c:if>
							 --%>
							<%-- <a href="reviewdetail.pg?num=${r.review_num }">
							<c:if test="${r.review_subject.length()>=20 }">
							<c:out value="${r.review_subject.substring(0,20) }..."/>
								</c:if>
								<c:if test="${r.review_subject.length()<20 }">
								<c:out value="${r.review_subject }"/>
								</c:if>
								</a>[${r.cnt}] --%>
							</td>
							<td>작성자<%-- ${r.review_name } --%></td>
							<td>작성일<%-- ${r.review_date } --%></td>
							<td>조회수<%-- ${r.review_readcount } --%></td>
						</tr>
						<%-- </c:forEach> --%>
					</tbody>
				</table>

				<div class="center-block">
					<div class="container">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
							<%-- <c:if test="${page <=1 }">  --%>
								<!-- <li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li> -->
							<%-- </c:if>
							<c:if test="${page > 1 }"> --%>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							<%-- </c:if> --%>
							
							<%-- <c:forEach var="a" begin="${startpage }" end="${endpage }">
								<c:if test="${a==page}">  --%>
								<li class="page-item active">
									<a class="page-link">1<%-- ${a } --%></a>
								</li>
								<%-- </c:if>
								<c:if test="${a!=page}">  --%>
								<li class="page-item">
									<a href="" 
									class="page-link">2<%-- ${a } --%></a>
								</li>
								<%-- </c:if>
							</c:forEach>
								 --%>
								<%-- <c:if test="${page >=maxpage}">  --%>
								<li class="page-item">
								<a class="page-link gray"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
								<%-- </c:if> --%>
								<%-- <c:if test="${page <maxpage}"> --%> 
								<%-- <li class="page-item">
								<a class="page-link" href="reviewlist.pg?page=${page+1}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li> --%>
								<%-- </c:if> --%>
							</ul>
						</nav>
					</div>
				</div>
				<form action="reviewlist.pg" method="post">
					<div class="input-group">
						<select id="viewcount" name="search_field">
							<option value="0" selected>제목</option>
							<option value="1">내용</option>
						</select>
						 <input id="search" name="search_word" type="text"  placeholder="제목을 입력하세요" value="${search_word }">
						<button class="btn btn-secondary" class="search" type="submit">검색</button>
					</div>
				</form>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
			</div>
		</div>
	<%-- 	</c:if> --%>
		<%-- <c:if test="${listcount==0 }"> --%>
		<section class="py-5">
 		<font size=5>등록된 문의사항이 없습니다.</font><br><br>
 		<a href="main.net"><button type="button" class="btn btn-secondary float-left back">메인으로</button></a>
 		</section>
 	<%-- </c:if> --%>
	</div>
</body>
</html>