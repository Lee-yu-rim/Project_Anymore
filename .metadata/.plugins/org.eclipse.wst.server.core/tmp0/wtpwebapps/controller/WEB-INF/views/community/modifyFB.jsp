<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("community").setAttribute("class", "nav-item dropdown active");
</script>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2>수정하기</h2>
			</div>
		</div>

		<form role="form" action="/community/modifyFB" method="post" style="color:black">
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
			
 			<div class="form-group">
				<input type="hidden" class="form-control" name="bno" readonly="readonly" value='<c:out value="${freeBoard.bno}"></c:out>'>
			</div>
			
			<div class="form-group">
				<input type="hidden" class="form-control" name="regdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${freeBoard.regdate}"></fmt:formatDate>'>
			</div>
			
			<div class="form-group">
				<input type="hidden" class="form-control" name="updatedate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${freeBoard.updatedate}"></fmt:formatDate>'>
			</div>
			
			<div class="form-group">
				<input type="hidden" class="form-control" name="id" readonly="readonly" value='<c:out value="${freeBoard.id}" />'>
			</div>
			
			<div class="form-group">
	            <label>카테고리</label>
	            <select class="form-control" id="field" name="field" >
					<option value="" selected>카테고리를 선택해주세요.</option>
				 	<option value="반려동물 자랑">반려동물 자랑</option>
				 	<option value="사료/간식 추천">사료/간식 추천</option>
				 	<option value="병원후기">병원후기</option>
				 	<option value="투병일기">투병일기</option>
				 	<option value="산책회">산책회</option>
				</select>
	         </div> 
			
			<div class="form-group">
				<label>제목</label> 
				<input class="form-control" id="title" name="title" value='<c:out value="${freeBoard.title}" />'>
			</div>
			
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" id="content" name="content" rows="14""><c:out value="${freeBoard.content}" /></textarea>
			</div>
			
       	
			<div class="form-group">
				<label class="form-label">파일첨부</label>
				<input class="form-control" name="fileupload" type="file">
			</div>
        	

        	
			<button type="submit" data-oper="modify" class="btn btn-primary">수정</button>
			<button type="submit" data-oper="remove" class="btn btn-primary">삭제</button>
			<button type="submit" data-oper="list" class="btn btn-primary">목록</button>
		</form>
	</div>
</section>

<!-- Modal -->
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



<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form"); 
	
	$('button').on("click", function(e){ 
		e.preventDefault(); 
		
		var operation = $(this).data("oper"); 
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/community/removeFB");
			
		}else if(operation === 'list'){
			
			formObj.attr("action", "/community/freeBoard").attr("method","get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);	
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
			
		}else if(operation == 'modify'){
			
			e.preventDefault();
			
			if($('#field > option:selected').val() == ""){
			    alert("카테고리를 선택해주세요");
			    $("#filed").focus();
			    return false;
			}

			if($("#title").val() == ""){
			    alert("제목을 입력해주세요.");
			    $("#title").focus();
			    return false;
			}

			if($("#content").val() == ""){
			    alert("내용을 입력해주세요.");
			    $("#content").focus();
			    return false;
			}
			
// 			console.log("submit clicked");
			
// 			var str="";
			
// 			$(".uploadResult ul li").each(function(i, obj){
				
// 				var jobj = $(obj);
				
// 				console.dir(jobj);
				
// 				str += "<input type='hidden' name='attachList["+i+"].fileName' value='" + jobj.data("filename")+"'>";
// 				str += "<input type='hidden' name='attachList["+i+"].uuid' value='" + jobj.data("uuid")+"'>";
// 				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='" + jobj.data("path")+"'>";
// 				str += "<input type='hidden' name='attachList["+i+"].fileType' value='" + jobj.data("type")+"'>";
// 			});
// 			formObj.append(str).submit();
		}
		formObj.submit();
// 		formObj.append(pageNumTag);
// 		formObj.append(amountTag);
	
	
	
	
	
	});

});
</script>

<%@include file="../includes/footer.jsp"%>