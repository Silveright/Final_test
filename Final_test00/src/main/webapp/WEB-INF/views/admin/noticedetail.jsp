<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/reviewview.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/view.css">
<style>
#upfile{display:none}

table td {
  position: relative;
}

table td input {
  position: absolute;
  top:0;
  left:0;
  margin: 0;
  height: 100%;
  width: 100%;
  border: none;
}

[readonly]{
  background-color:#fff !important;
}
.table-active {
    --bs-table-accent-bg: rgb(119 107 204 / 15%);
    color: var(--bs-table-active-color);
}
.btn-primary {
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
 .container{
 	margin-top:10%
 }
</style>
</head>
<title>공지사항-글 보기</title>
</head>
<body>
	<input type="hidden" id="loginid" value="${id }" name="loginid">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-sm-9 ">
				<table class="table table-bordered ">
					<tr>
						<td class="table-active text-center" style="width: 20%">작성자</td>
						<td><input value="" type="text" class="form-control" ReadOnly></td>
					</tr>
					<tr>
						<td class="table-active text-center">제목</td>
						<td><input type="text" value="" class="form-control" ReadOnly></td>
					</tr>
					<tr>
						<td colspan="2"><div id="ta1" contentEditable="false" style="white-space:pre;">

	  					<%-- <c:if test="${!empty reviewdata.review_file }">
	  					<c:set var='src' value='${"reviewupload/"}${reviewdata.review_file}'/>
	  					<br><img src="${src}" width="30%" alt="reviewfile">
	  					</c:if> --%>
						
						</div></td>
					</tr>
					<%-- <c:if test="${reviewdata.review_re_lev==0}"> --%>
					<tr>
						<td class="table-active text-center">구매제품</td>
						<td></td>
					</tr>
					<%-- </c:if> --%>
					<tr>
					<%-- <c:if test="${reviewdata.review_re_lev==0}">
						<c:if test="${!empty reviewdata.review_file }"> --%>
						<td class="table-active text-center">첨부파일</td>
						<td><img src="${pageContext.request.contextPath}/image/mypage/down.png" width="10px">
						<a href="reviewfiledown.pg?filename=${reviewdata.review_file}" style="color:blue">${reviewdata.review_file}</a></td>
						<%-- </c:if>
					</c:if> --%>
					</tr>
				</table>
			<%-- 	<c:if test="${reviewdata.review_name == id || id == 'admin' }"> --%>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">삭제하기</button>
					<a href="noticemodify?num="><button type="button" class="btn btn-primary">수정하기</button></a>
				<%-- </c:if> --%>
					<%-- <c:if test="${!empty id }"> --%>
					<%-- <a href="reviewreplyview.pg?num=${reviewdata.review_num }">
					<button type="button" class="btn btn-dark float-sm-end ms-1">답변달기</button>
					</a></c:if> --%>
					<a href="reviewlist.pg"><button type="button" class="btn btn-primary float-sm-end">글목록</button></a><br><br><br>
					<div class="modal" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="modal-header">
														<h4 class="modal-title">리뷰가 삭제됩니다.</h4>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal"></button>
													</div>
													<form name="deleteForm" action="reviewdeleteaction.pg" method="post">
													<!-- Modal body -->
													<div class="modal-body">
													<input type="hidden" name="num" value="${param.num}" id="comment_review_num">
											     	  <div class="form-group">
											           <label for="pwd">비밀번호</label>
									           			<input type="password" 
									           					class="form-control" id=" review_pass" 
									                  placeholder="Enter password" name="review_pass">
									       			  </div></div>
																						
													<!-- Modal footer -->
													<div class="modal-footer">
														<button type="submit" class="btn btn-sm btn-primary"
															>삭제하기</button>
														<button type="button" class="btn btn-sm btn-primary"
															data-bs-dismiss="modal">뒤로가기</button>
													</div>
													</form>
												</div>
											</div>
										</div>
										
					<div class="comment-area">
			<div class="comment-head">
				<h3 class="comment-count">
					댓글<sup id="count"></sup><%--superscript(윗첨자) --%>
				</h3>
				<div class="comment-order">
					<ul class="comment-order-list">
					</ul>
				</div>
			</div><!-- comment-head end-->
			<ul class="comment-list">
			</ul>
			<c:if test="${!empty id }">
			<div class="commnet-write">
				<div class="comment-write-area">
					<b class="comment-write-area-name" >${id}</b> <span
						class="comment-write-area-count">0/200</span>
					<textarea placeholder="댓글을 남겨보세요" rows="1"
						class="comment-write-area-text" maxLength="200"></textarea>
					
				</div>
				<div class="register-box" >
					<div class="button btn-cancel" >취소</div><%-- 댓글의 취소는 display:none, 등록만 보이도록 합니다.--%>
					<div class="button btn-register" >등록</div>
				</div>
			</div><%--commnet-write end--%>
			</c:if>
		</div><%-- comment-area end--%>
										
			</div>
		</div>
	</div>
</body>
</html>