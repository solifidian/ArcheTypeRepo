<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<div class="col-sm-3">
		<!--
			Category Tab Start (Left)
			부트스트랩의 collapse를 이용함
			컨트롤 영역의 CategoryController로부터 Category리스트를 받아옴.
			Attribute에 추가 되어있어야 데이터가 표시됨.
			
			@cateList	List<CategoryVO>
			@cate	대분류 item
			@root	각 대분류에 대응하는 중분류를 뽑아 태그를 작성하기 위해 대분류를  c:out 으로 변수 선언 함
					중분류의 forEach가 끝나면 remove됨
			@cate2	중분류 item
			@root2	각 중분류에 대응하는 소분류를 뽑아 태그를 작(생략)
			
			@collapse_set 	첫번째 카테고리 탭만 최초에 펼쳐져 있도록 하기 위해 사용됨
							중분류 작성 마지막에 remove됨
			@aria_set		상동
			@in_set			상동
			
			현재 카테고리 DB가 입력이 되어있는 3, 7, 28번 분류만 표시되도록 해놓음
		 -->
		 
		<div class="left-sidebar">
			<h2>Category</h2>
			<div class="panel-group category-products" id="bookCategoryTab"  role="tablist">
				<c:if test="${empty cateList }">
					No DATA
				</c:if>
				<c:forEach var="cate" items="${cateList}">
					<c:choose>
						<c:when test="${cate.cat_step == 1}">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="panel-heading" role="tab" id="heading${cate.cat_no}">
										<a data-toggle="collapse" data-parent="#bookCategoryTab" href="#collapse${cate.cat_no}" aria-expanded="true">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											<c:out value="${cate.cat_name}"/>
											<c:set var="root" value="${cate.cat_no}"/>
										</a>
									</div>
								</div>
								<ul><li>
								<div id="collapse${root}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${root}">
									<div class="panel-body">
									<div class="panel-group" id="tab${root}" role="tablist" aria-multiselectable="true">
									<c:forEach var="cate2" items="${cateList}">
										<c:choose>
											<c:when test="${cate2.cat_step == 2 && cate2.cat_root == root && (cate2.cat_no == 3 || cate2.cat_no == 7 || cate2.cat_no == 28) }">					
												<div class="panel panel-default">
														<c:choose>
															<c:when test="${cate2.cat_no ==3 }">
																<c:set var="collapse_set" value="collapsed"/>
																<c:set var="aria_set" value="true"/>
																<c:set var="in_set" value=""/>
															</c:when>
															<c:otherwise>
																<c:set var="collapse_set" value="collapsed"/>
																<c:set var="aria_set" value="false"/>
																<c:set var="in_set" value=""/>
															</c:otherwise>
														</c:choose>
														<div class="panel-heading" role="tab" id="heading${cate2.cat_no}">
															<a data-toggle="collapse" class="${collapse_set}" data-parent="#tab${root}" href="#collapse${cate2.cat_no}" aria-expanded="${aria_set}" aria-controls="collapse${cate2.cat_no}">
																<span class="badge pull-right"><i class="fa fa-plus"></i></span>
																<c:out value="${cate2.cat_name}"/>
																<c:set var="root2" value="${cate2.cat_no}"/>
																
															</a>
														
														</div>
														<div id="collapse${root2}" class="panel-collapse collapse ${in_set}" role="tabpanel" aria-labelledby="heading${root2}">
															<div class="panel-body">
																<c:forEach var="cate3" items="${cateList}">
																	<c:choose>
																		<c:when test="${cate3.cat_step == 3 && cate3.cat_root == root2}">		
																			<ul><li><a href="/book/bookSearch.do?cat_no=${cate3.cat_no}">
																				<c:out value="${cate3.cat_name}"/>
																			</a></li></ul>
																		</c:when>
																	</c:choose>
																</c:forEach>
															</div>
														</div>
												</div><!-- /class : panel panel-default -->
												<c:remove var="collapse_set"/>
												<c:remove var="aria_set"/>
												<c:remove var="in_set"/>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:remove var="root"/>
									</div>
									</div><!-- /class : panel-body -->
								</div>
								</li></ul>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>		
			</div>
		</div><!--  /class : left-sidebar -->
	</div><!-- /class : col-sm-3 -->
	<!------- Category Tab End (Left) -------->

</html>