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
    <title>Home | E-Shopper</title>

</head><!--/head-->

<body>
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script>
	 var id="${sessionScope.memSession.m_id}";
	 if(id=="")id=0;
	 
		$(function(){
			
			
		});
	 
	</script>
	<section>
		<div class="container">
			<%-- category tab making experiment --%>
			<%-- <div class="row">
				<c:if test="${empty cateList }">
					No DATA
				</c:if>
				<c:forEach var="cate" items="${cateList}">
					<ul><li>
						<c:choose>
							<c:when test="${cate.cat_step == 1}">
								1 : cat_no : ${cate.cat_no} / cat_name : ${cate.cat_name}
								<c:set var="root" value="${cate.cat_no}"/>
								<c:forEach var="cate" items="${cateList}">
									<ul><li>
										<c:choose>
											<c:when test="${cate.cat_step == 2 && cate.cat_root == root}">
												2 : cat_no : ${cate.cat_no} / cat_name : ${cate.cat_name}
											 	<c:set var="root2" value="${cate.cat_no}"/>
											 	<c:forEach var="cate" items="${cateList}">
													<ul><li>
														<c:choose>
															<c:when test="${cate.cat_step == 3 && cate.cat_root == root2}">
																3 : cat_no : ${cate.cat_no} / cat_name : ${cate.cat_name}
															 	<c:set var="root3" value="${cate.cat_no}"/>
															</c:when>
														</c:choose>
													</li></ul>
												</c:forEach>
												<c:remove var="root2"/>
											</c:when>
										</c:choose>
									</li></ul>
								</c:forEach>
								<c:remove var="root"/>
							</c:when>
						</c:choose>
					</li></ul>
				</c:forEach>
				<p>cat_no : ${cate.cat_no} / cat_name : ${cate.cat_name} / cat_root : ${cate.cat_root} / cat_step : ${cate.cat_step}</p> 
			</div> --%>
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"  role="tablist" aria-multiselectable="true">
							<c:if test="${empty cateList }">
								No DATA
							</c:if>
							<div class="panel-group">
							<c:forEach var="cate" items="${cateList}">
								<c:choose>
									<c:when test="${cate.cat_step == 1}">
										<div class="panel panel-default">
											<div class="panel-body">
													<a data-toggle="collapse" data-parent="#accordian" href="#${cate.cat_no}">
														<span class="badge pull-right"><i class="fa fa-plus"></i></span>
														<c:out value="${cate.cat_name}"/>
														<c:set var="root" value="${cate.cat_no}"/>
													</a>
											</div>
											<div id="${root}" class="panel-collapse collapse in">
												<div class="panel-body">
												<c:forEach var="cate2" items="${cateList}">
												<c:choose>
													<c:when test="${cate2.cat_step == 2 && cate2.cat_root == root && (cate2.cat_no == 3 || cate2.cat_no == 7 ||cate2.cat_no == 28 )}">									
																<ul><li>
																	<a data-toggle="collapse" data-parent="#${root}" href="#${cate2.cat_no}">
																		<span class="badge pull-right"><i class="fa fa-plus"></i></span>
																		<c:out value="${cate2.cat_name}"/>
																		<c:set var="root2" value="${cate2.cat_no}"/>
																	</a>
																	<div id="${root2}" class="panel-collapse collapse">
																		<div class="panel-body">
																		<c:forEach var="cate3" items="${cateList}">
																		<c:choose>
																		<c:when test="${cate3.cat_step == 3 && cate3.cat_root == root2}">		
																			<ul><li><a href="#">
																				<c:out value="${cate3.cat_name}"/>
																			</a></li></ul>
																		</c:when>
																		</c:choose>
																		</c:forEach>
																		</div>
																	</div>		
																</li></ul>
														
													</c:when>
												</c:choose>
												</c:forEach>
											</div>
											<c:remove var="root"/>
											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
							</div>
					</div>
				</div>
				</div>
		</div>
		</div>
		</section>

</body>
</html>