<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<!--------------- slider section Start -------------------->
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<!-- slide forEach start -->
							<c:choose>
								<c:when test="${not empty randomList}" >
									<c:forEach var="randomList" items="${randomList}" varStatus="cnt">
											<div class="item <c:if test='${cnt.index eq 0}'>active</c:if>">
												<div class="col-sm-6">
													<h1><span>${randomList.b_title }</span></h1>
													<h2>${randomList.b_author}</h2>
													<p>이 달의 기대작 모음</p>
													<button type="button" class="btn btn-default get">자세히보기</button>
												</div>
												<div class="col-sm-6">
													<img src="/images/bookImg/${randomList.isbn}.jpg" class="img-responsive" alt="현재 이미지 준비중입니다." />
												</div>
											</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<h1>아아아아 안나온다</h1>
								</c:otherwise>
							</c:choose>
							
						</div>
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section>
	<!----------------------- slider section End-------------------->
</html>