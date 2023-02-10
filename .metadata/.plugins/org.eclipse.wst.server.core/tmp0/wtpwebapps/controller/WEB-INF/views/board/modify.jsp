<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>



<form role = "form" action = "/board/modify" method = "post">
	<input type='hidden' name ='pageNum' value = '<c:out value="${cri.pageNum }"/>'>
	<input type='hidden' name ='amount' value = '<c:out value="${cri.amount }"/>'>
	<!-- 아래 코드 두줄이 없으면 수정 후 list, 삭제, 수정완료 후 이전창이 아니라 바로 board/list의 첫 화면으로 돌아가게 된다. -->
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>

	<div class = "form-group">
		<label>Bno</label>
		<input class="form-control" name='bno' value='<c:out value = "${board.bno }"/>' readonly="readonly">
	</div>
		
	<div class = "form-group">
		<label>Title</label>
		<input class="form-control" name='title' value='<c:out value = "${board.title }"/>'>
	</div>
	
	<div class = "form-group">
		<label>Text Area</label>
		<textarea class="form-control" rows="3" name='content'><c:out value = "${board.content }" /> </textarea>
	</div>
	
	<div class = "form-group">
		<label>Writer</label>
		<input class="form-control" name='writer' value='<c:out value = "${board.writer }"/>' readonly="readonly">
	</div>
	
	<div class = "form-group">
		<label>RegDate</label>
		<input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.regdate }" />' readonly="readonly">
	</div>
	
	<div class = "form-group">
		<label>Update Date</label>
		<input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.updateDate }" />' readonly="readonly">
	</div>
	
	<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
	<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
	<button type="submit" data-oper='list' class="btn btn-info">List</button>
</form>


	<div class = 'bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
	
	<style>
		.uploadResult {
		  width:100%;
		  background-color: gray;
		}
		.uploadResult ul{
		  display:flex;
		  flex-flow: row;
		  justify-content: center;
		  align-items: center;
		}
		.uploadResult ul li {
		  list-style: none;
		  padding: 10px;
		  align-content: center;
		  text-align: center;
		}
		.uploadResult ul li img{
		  width: 100px;
		}
		.uploadResult ul li span {
		  color:white;
		}
		.bigPictureWrapper {
		  position: absolute;
		  display: none;
		  justify-content: center;
		  align-items: center;
		  top:0%;
		  width:100%;
		  height:100%;
		  background-color: gray; 
		  z-index: 100;
		  background:rgba(255,255,255,0.5);
		}
		.bigPicture {
		  position: relative;
		  display:flex;
		  justify-content: center;
		  align-items: center;
		}
		
		.bigPicture img {
		  width:600px;
		}
	
	</style>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Files</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="form-group uploadDiv">
						<input type="file" name='uploadFile' multiple>
					</div>
					<div class='uploadResult'>
						<ul>
						</ul>
					</div>
				</div>
				<!-- end panel-body -->
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->






	<div class='row'>
		<div class="col-lg-12">
		<!-- 
			<div class="ponel panel-default">
				<i class="fa fa-conmments fa-fw"></i>Reply
			</div> -->
			
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>Reply
				<button id = 'addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			<div class="panel-body">
				<ul class="chat">
					
				</ul>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>



<script type="text/javascript">
	   $(function(){
			var formObj = $("form");
			
			$("button").on("click", function(e){
				
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				if(operation === 'remove'){
					formObj.attr("action", "/board/remove");
				}else if(operation === 'list'){
					//move to list
					formObj.attr("action", "/board/list").attr("method","get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					
					formObj.empty();
					formObj.append(pageNumTag);
					formObj.append(amountTag);
					//keywordTag, typeTag가 주솟값에 들어가게 된다면 빠져나와도 검색했던 이전으로 돌아가게 된다.
					formObj.append(keywordTag); //검색어
					formObj.append(typeTag); //검색유형(ex: 제목, 내용...)
				}else if(operation == 'modify'){
					console.log("submit clicked");
					
					var str = "";
					$(".uploadResult ul li").each(function(i, obj){
						var jobj = $(obj);
						console.dir(jobj);
						
						str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
					});
					
					formObj.append(str).submit();
				}
				formObj.submit();
		});
   }); 
	   
</script>

<script>

$(document).ready(function(){
    (function(){
       var bno = '<c:out value="${board.bno}"/>';
       
       $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
          console.log(arr);
          
          var str ="";
          
          $(arr).each(function(i, attach){
             
             if(attach.fileType){  
                var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
              
                str += "<li data-path='" + attach.uploadPath + "' data-uuid='" 
                   + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
                str += "<span>" + attach.fileName + "</span>";
                str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'"
                str += "class='btn btn-warning btn-circle'><t class='fa fa-times'></i></button><br>";
                str += "<img src='/display?fileName=" + fileCallPath + "'>";
                str += "</div>";
                str += "</li>";
              }else {  
                str += "<li data-path='" + attach.uploadPath + "' data-uuid='" 
                   + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
                str += "<span>" + attach.fileName + "</span><br/>";
                str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'"
                str += "class='btn btn-warning btn-circle'><t class='fa fa-times'></i></button><br>";
                str += "<img src='/resources/Img/attach.png'>";
                str += "</li>";
              } 
          });
          
          $(".uploadResult ul").html(str);
          
       }); //end getJSON
    })(); //end function
	
	
	$(".uploadResult").on("click","button", function(e){
		console.log("delete file");
		if(confirm("remove this file? ")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); 
    var maxSize = 5242880;
    
    function checkExtension(fileName, fileSize){ 
        
        if(fileSize >= maxSize){
           alert("파일 사이즈 초과");
           return false;
        }
        
        if(regex.test(fileName)){ 
           alert("해당 종류의 파일은 업로드할 수 없습니다.");
           return false;
        }
        return true;
     }
	
	
	$("input[type='file']").change(function(e){
		 var formData = new FormData();
		 var inputFile = $("input[name='uploadFile']");
		 var files = inputFile[0].files;
		 
		 for(var i=0; i<files.length; i++){
			 if(!checkExtension(files[i].name, files[i].size)){
				 return false;
			 }
			 formData.append("uploadFile",files[i]);
		 }
		 
		 $.ajax({
			 url: '/uploadAjaxAction',
			 processData: false,
			 contentType: false,data:
			 formData, type:'POST',
			 dataType:'json',
			 	success: function(result){
			 		console.log(result);
			 		showUploadResult(result);
			 	}
		 });//$.ajax
	 });
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}
		var uploadUL = $(".uploadResult ul");
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj){
              if(obj.image){
                  var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
                  str += "<li data-path='"+obj.uploadPath+"'";
               	  str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
               	  str +" ><div>";
                  str += "<span> "+ obj.fileName+"</span>";
                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                  str += "<img src='/display?fileName="+fileCallPath+"'>";
                  str += "</div>";
                  str +"</li>";
                }else{
                  var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
                  var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
                      
                  str += "<li data-path='"+obj.uploadPath+"'";
                  str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
                  str +" ><div>";
                  str += "<span> "+ obj.fileName+"</span>";
                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
                  str += "<img src='/resources/Img/attach.png'></a>";
                  str += "</div>";
                  str +"</li>";
                }
          });

		
		uploadUL.append(str);
	}
	
});

</script>



<%@ include file="../includes/footer.jsp" %>
```