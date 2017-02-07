<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">


<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style type="text/css">
*{margin:0;padding:0;list-style:none;}

.option { padding: 10px 10px 0; }
.option ul > li { padding-bottom: 10px; }
.option ul > li > div { border: 2px solid #242424; position: relative; overflow: hidden; height: 40px; background: #fff; }
.option ul > li > div > span { display: block; height: 40px; padding: 0 40px 0 15px; }
.option ul > li > div > span > strong { font-family: "crn-md", "NanumBarunGothicBold", "돋움", Dotum, sans-serif; }
.option ul > li > div > span > span { position: absolute; top: 0; right: 0; width: 31px; background: transparent url("img/bullet-arrow-selectbox.png") no-repeat 0 center; padding: 20px 15px; }
.option ul > li > div select { position: absolute; top: 0; left: 0; width: 100%; height: 40px; border: 0; margin: 0; padding: 15px; filter: alpha(opacity=0); -ms-filter: alpha(opacity=0); -moz-opacity: 0; -khtml-opacity: 0; opacity: 0; cursor: pointer; }
.option ul > li > div > span > strong { line-height: 3; }
</style>

</head><!--/head-->

<body>

<h1>아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ</h1>
    <table class="table table-borderded">
							<colgroup>
								<col width="15%" />
								<col width="15%" />
								<col width="30%" />
								<col width="13%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<th>주문일자</th>
								<th>주문번호</th>
								<th>주문내역</th>
								<th>주문자명</th>
								<th>배송</th>
							</thead>
							<tbody id="list">
								<!-- 데이터 출력 -->
								<%-- <c:choose>
									<c:when test="${not empty purchase }">
										<c:forEach var="purchase" items="${purchase }">
											<tr class="tac" data-num="${purchase.p_no}">
												<td>${purchase.p_date }</td>
												<td>${purchase.p_no }</td>
												<td><input type="button" class="btn btn-default goDetail" value="상세보기"> </td>
												<td>${purchase.m_name}</td>
												<td><input type="button" class="btn btn-default goDelivery" value="배송추적"></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4" class="tac">주문내역이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise> 
								</c:choose>--%>
								
							</tbody>
						</table>
</body>



</html>