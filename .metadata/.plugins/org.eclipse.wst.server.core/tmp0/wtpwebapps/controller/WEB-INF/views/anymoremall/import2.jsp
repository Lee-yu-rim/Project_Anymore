<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

	.join_form{
		font-family: NanumSquareNeo;
	}
	
	.ftco-section .contactForm .label{
		font-size:15px;
	}
	
	.join_form .btn{
		background-color:#AD8B73;
		color:white;
		margin-top:30px;
	}
	
	.join_form .btn_2{
		margin-top:35px;
	}
	
	.join_form .col-md-1{
		margin-top:50px;
		margin-left:10px;
	}
	
	.join_form .form-group{
		margin-bottom:50px;
	}

</style>


<section class="ftco-section bg-light">
	<div class="container join_form">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">결제 페이지</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<div class="row no-gutters terms_content">
						<div class="col-md-12">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">정보 입력</h3>
								<form method="POST" action="/anymoremall/import" id="joinform" name="joinform" class="joinform">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="name">이름</label>
												<input type="text" class="form-control" name="name" id="name" maxlength="10" placeholder="이름을 입력하세요.">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="phone">휴대폰 번호</label>
												<input type="text" class="form-control" name="phone" id="phone" maxlength="11" placeholder="- 을 제외하고 입력해주세요.">
											</div>
										</div>
										<div class="col-md-10">
											<div class="form-group">
												<label class="label" for="address_1">주소</label>
												<input type="text" class="form-control" name="address_1" id="address_1" placeholder="우편번호 검색을 진행해주세요." readonly>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<input type="button" class="btn btn_2" onclick="open_Postcode()" value="우편번호 검색">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group" for="postcode">
												<input type="text" class="form-control" name="postcode" id="postcode" maxlength="7" placeholder="우편번호"> 
											</div>
										</div>
										<div class="col-md-8">
											<div class="form-group">
												<input type="text" class="form-control" name="address_2" id="address_2" maxlength="100" placeholder="상세 주소를 입력해주세요.">
											</div>
										</div>
										<input type="hidden" id="address" name="address" value="">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="deli_ask">배송요청사항</label>
												<input type="text" class="form-control" name="deli_ask" id="deli_ask" maxlength="11" placeholder="배송요청사항을 작성해주세요">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<a href="#"><input type="button" value="이전" class="btn btn-primary"></a>
												<input type="submit" value="완료" id="submit" class="btn btn-primary" onclick="return validation()">
												<div class="submitting"></div>
											</div>
										</div>
										
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 모달창 -->
<div class="modal fade" id="alertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family: 'NanumSquareNeo';">
	<div class="modal-dialog modal-dialog-centered text-center">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModal">알림</h5>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script>
	
	//주소 합치기
	$("#address_1").change(function(){
		address();	
	});
	
	$("#address_2").change(function(){
		address();	
	});
	
	function address() {
		var address_1 = $("#address_1").val();
		var address_2 = $("#address_2").val();
		if(address_1 != "" && address_2 != "") {
			$("#address").val(address_1 + " " + address_2);
		}
	};
	
	//전체 값 유효성 검사
	function validation(){
	 
		var name = document.getElementById("name");
		var phone = document.getElementById("phone");
		var address_1 = document.getElementById("address_1");
		var address_2 = document.getElementById("address_2");
		var idChkVal = $("#id_check").val();
		
		if(name.value == ""){
			$(".modal-body").html("이름을 입력해주세요.");
			$("#alertModal").modal("show");
			name.focus();
			return false;
		}
		
		//이름 유효성 검증
		if (!name_varify.test(name.value)) {
			$(".modal-body").html("이름을 확인해주세요.");
			$("#alertModal").modal("show");
		 	name.focus();
		    return false;
		};
		
		if(phone.value == ""){
			$(".modal-body").html("휴대폰 번호를 입력해주세요.");
			$("#alertModal").modal("show");
			phone.focus();
			return false;
		}
		
		//휴대폰 번호 유효성 검증
		if (!phone_varify.test(phone.value)) {
			$(".modal-body").html("휴대폰 번호를 확인해주세요.");
			$("#alertModal").modal("show");
		 	phone.focus();
		    return false;
		};
		
		if(address_1.value == ""){
			$(".modal-body").html("우편번호 검색을 진행해주세요.");
			$("#alertModal").modal("show");
			address_1.focus();
			return false;
		}
		
		if(address_2.value == ""){
			$(".modal-body").html("상세 주소를 입력해주세요.");
			$("#alertModal").modal("show");
			address_2.focus();
			return false;
		}
		
		if(deli_ask.value == ""){
			$(".modal-body").html("상세 주소를 입력해주세요.");
			$("#alertModal").modal("show");
			deli_ask.focus();
			return false;
		}
		
	}
	
	//우편번호 검색
	function open_Postcode(){  
	  new daum.Postcode({ 
	    oncomplete: function(data) { 
	 
	       document.getElementById("address_1").value = data.jibunAddress; 
	       document.getElementById("postcode").value = data.zonecode;
	  	} 
	  }).open(); 
	} 
	
</script>

<%@include file="../includes/footer.jsp"%>