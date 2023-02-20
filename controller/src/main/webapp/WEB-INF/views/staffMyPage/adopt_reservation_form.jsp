<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
</script>

<style>
	select, input {
		font-size:15px;
		height:40px;
	}
	a{
		color:black;
	}
	table {
		text-align:center;
	}
</style>
  
<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
    	<div class="container">
    		<div class="row justify-content-center" >
    			<div class="col-md-2">
					<h5>관리자 메뉴</h5>
					<div class="select_menu">
			      		<!-- <span style="color:#CDBBA7">회원목록</span><br/> -->
			      		<span><a href="/staffMyPage/member_list">회원목록</a></span><br/>
			      		<span><a href="/staffMyPage/visit_reservation_form">방문신청 폼 확인</a></span><br/>
			      		<span><a href="/staffMyPage/adopt_reservation_form" style="color:#CDBBA7">입양신청 폼 확인</a></span><br/>
			      		<span><a href="/staffMyPage/protect_animal_write">보호동물 등록</a></span><br/>
			      		<span><a href="/staffMyPage/protect_animal">보호동물 리스트</a></span><br/>
			      		<span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/>
<!-- 			      		<span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
		      		<span><a href="/staffMyPage/product_manage">상품관리</a></span><br />
		      		<span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		      		<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
			      	</div>
				</div>
				
				<div class="col-md-10">
				<h3 style="margin-bottom: 30px"><b>입양신청 조회</b></h3>
				
				<container>
			        <div class="container">
			          <div class="row no-gutters slider-text align-items-end">
			            <div class="col-md-12 ftco-animate pb-5">
			            <form id='searchForm' action="/staffMyPage/adopt_reservation_form" method='get'>
			              <div style="text-align: right;">
			                <select name='type'>
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="N" <c:out value="${pageMaker.cri.type eq 'N' ? 'selected':''}"/>>이름</option>
			                    <option value="P" <c:out value="${pageMaker.cri.type eq 'P' ? 'selected':''}"/>>전화번호</option>
							</select>
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
							<button class='btn btn-default'>Search</button>	
			              </div>
			              </form>
			            </div>
			          </div>
			        </div>
			      </container>
			  <!-- 테이블 시작 -->
			  <div class="wrap">
			      <div class="container">
					 <table class="table table-bordered table-striped table-hover">
					    <tr>
					       <th>글번호</th>
					       <th>신청자 이름</th>
					       <th>전화번호</th>
					       <th>생년월일</th>
					       <th>거주지</th>
					       <th>상세보기</th>
					    </tr>
					    
					    <c:forEach items="${adopt_list }" var="adopt">
					    <tr>
					       <td><c:out value="${adopt.adoptnum }"></c:out></td>
					       <td><c:out value="${adopt.name }"></c:out></td>
					       <td><c:out value="${adopt.phone }"></c:out></td>
					       <td><c:out value="${adopt.birthday_Date }"></c:out></td>
					       <td><c:out value="${adopt.address }"></c:out></td>
					       <td><a class='move' href='<c:out value="${adopt.adoptnum }" />'>상세보기</a></td>
					    </tr>
					    </c:forEach>
					    <c:if test="${empty adopt_list}">
				        	<tr>
				        		<td colspan="12"><p style="margin-top: 16px; font-size: 15px; text-align:center;">검색 결과가 존재하지 않습니다.</p></td>
				        	</tr>
				        </c:if>
					 </table>
					</div>
				<form id='actionForm' action="/staffMyPage/adopt_reservation_form" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>				
				</form>
				</div>
			</div>
		</div>
	</div>
</section>

<container>
	<div class="row mt-5" style="display: flex; justify-content: center;">
	  <div class="row text-center">
	    <div class="block-27">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">&lt;</a></li>
				</c:if>
				
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num }">${num}</a></li>   
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">&gt;</a></li>
				</c:if>
			</ul>
		</div>
	  </div>
	</div>
	<br>
</container>



<script>
	$(function(){
		
		var actionForm = $("#actionForm");
		
		//페이지 이동
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			
			console.log("click");
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			
			actionForm.append("<input type ='hidden' name='adoptnum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/staffMyPage/adopt_reservation_form_watch");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		//선택이나 검색어 입력이 없을 시에 띄워주는 경고창(alert)
		$("#searchForm button").on("click",function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
		
		
	});
</script>


<%@include file="../includes/footer.jsp"%>
