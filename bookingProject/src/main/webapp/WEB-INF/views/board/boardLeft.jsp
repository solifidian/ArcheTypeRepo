<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
			<div class="col-sm-3">
				<div class="left-sidebar">
					<h2>Category</h2>
					<div class="panel-group category-products" id="accordian"><!-- 카테고리  -->
					
						<!-- 포럼 게시판 패널 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#bookAndPeople">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
										북&피플
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="bookAndPeople" class="panel-collapse collapse">
								<div class="panel-body">
										<ul>
											<li><a href="/board/boardList.do?bd_forum_no=1">자유 포럼</a></li>
											<li><a href="/board/boardList.do?bd_forum_no=2">국내도서 포럼</a></li>											
											<li><a href="/board/boardList.do?bd_forum_no=3">해외도서 포럼</a></li>
											<li><a href="/board/boardList.do?bd_forum_no=4">전문서적 포럼</a></li>
										</ul>
								</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->				
						</div><!--class: panel panel-default 끝  -->
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#powerBook">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
										파워북로거
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="powerBook" class="panel-collapse collapse">
								<div class="panel-body">
										<ul>
											<li><a href="/board/boardList.do?bd_forum_no=11">도서 이야기</a></li>
											<li><a href="/board/boardList.do?bd_forum_no=12">국내도서 평가 포럼</a></li>											
											<li><a href="/board/boardList.do?bd_forum_no=13">해외도서 평가 포럼</a></li>
											<li><a href="/board/boardList.do?bd_forum_no=14">전문서적 평가 포럼</a></li>
										</ul>
								</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->				
						</div><!--class: panel panel-default 끝  -->
						
						
						<!-- 문의 게시판 패널 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#support">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											문의 게시판
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="support" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="/board/cusService.do">고객센터</a></li>
											<li><a href="/board/boardList.do?bd_forum_no=31">묻고 답하기 게시판</a></li>
											<li><a href="/board/boardList.do?bd_forum_no=32">도서 질문 게시판</a></li>											
										</ul>
									</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->							
						</div><!--class: panel panel-default 끝  -->
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordian" href="#event">
										<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											이벤트
									</a>
								</h4>
							</div><!--class: panel-heading끝  -->
							<div id="event" class="panel-collapse collapse">
								<div class="panel-body">
									<ul>
										<li><a href="/board/boardList.do?bd_forum_no=51">진행중 이벤트 게시판</a></li>
									</ul>
								</div><!--class: panel-body끝  -->
							</div><!-- id:review 끝 -->
						</div><!--class: panel panel-default 끝  -->	
							
	<!--우선 딱히 쓸것같진 않아서 우선 주석처리함  -->
					<!-- 	<div class="price-range">price-range
								<h2>Price Range</h2>
								<div class="well">
									 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
									 <b>$ 0</b> <b class="pull-right">$ 600</b>
								</div>
						</div>/price-range -->
						
<!--현재 하는 이벤트 이미지 첨부  -->
						<div class="shipping text-center"><!--이벤트-->
								<img src="/resources/images/home/shipping.jpg" alt="" />
						</div><!--/이벤트-->
													
					</div><!--/카테고리 class: panel-group category-products  -->
				</div><!--/class:  left-sidebar -->	
			</div><!--/class: col-sm-3  -->


<!-- ===========================================================================  -->
</html>