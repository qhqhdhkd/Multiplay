<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://kit.fontawesome.com/9945425c20.js" crossorigin="anonymous"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="글수정" name="title"/>
</jsp:include>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/board/write.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
	<section class="board-write">
	  <form action="${path}/board/update" method="post" enctype="multipart/form-data">
	  	<input type="hidden" name="bno" value="${board.bno}" />
	  	<input type="hidden" name="boardType" value="${board.boardType}" />
		<input type="hidden" name="originalFileName" value="${board.originalFileName}" />
		<input type="hidden" name="renamedFileName" value="${board.renamedFileName}" />
	    <table id="tbl-board" class="wirter">
	      <tr>
	        <td colspan="2"  class="title-area">
	          <input type="text" name="boardTitle" value="${board.boardTitle}" class="title">
	        </td>
	      </tr>
	      <tr>
	        <td style="display:none;"  colspan="2">
	          <input type="text" name="userId" value="${board.userId}" readonly>
	        </td>
	      </tr>
	      <tr>
	        <td class="file">
	          <div class="filebox bs3-primary">
	            <span class="file-header">첨부파일</span>
	            <input class="upload-name" disabled="disabled"></input>
	            <label for="ex_filename">파일 올리기</label> 
	            <input type="file" name="reloadFile" id="ex_filename" class="upload-hidden"></input>
	           	<c:if test="${!empty board.originalFileName}"><br>
					현재 업로드 파일 :<a>${board.originalFileName}</a>
				</c:if>         
	          </div>
	        </td>
	      </tr>
	      <tr>
	        <td colspan="2">
	          <div class="textarea">
	            <textarea name="boardContent" cols="80" rows="15" class="area">${board.boardContent}</textarea>
	          </div> 
	        </td>
	      </tr>
	      <tr>
	        <th colspan="2" id="writeBtns">
	          <input type="submit" value="수정" id="writeBtn">
	          <c:if test="${board.boardType=='문의사항' }">
	          	 <input type="button" value="취소" onclick="location.href='${path}/board/monlist'" id="writeBtn">
	          </c:if>
	          <c:if test="${board.boardType=='자유게시판' }">
	          	 <input type="button" value="취소" onclick="location.href='${path}/board/freelist'" id="writeBtn">
	          </c:if>
	        </th>
	      </tr>
	    </table>
	  </form>
	 </section>
	 <section>
	    <div class="bnr-bottom-wrap">
	      <div class="bnr-bottom">
	        <div class="bnr-bottom-01">
	          <div class="icon-container">
	            <i class="fa-solid fa-pen-to-square"></i>
	          </div>
	          <div class="info-container">
	            <p class="bottom-title">예매 / 취소</p>
	            <span class="bottom-sub"
	              >궁금한 사항은 공지사항 및 문의를 이용해주세요.</span
	            >
	          </div>
	        </div>
	        <div class="bnr-bottom-02">
	          <div class="icon-container">
	            <i class="fa-solid fa-phone-volume"></i>
	          </div>
	          <div class="info-container">
	            <p class="bottom-title">고객센터 이용 안내</p>
	            <span class="bottom-sub"
	              >전화(1544-1234) 또는 일대일 문의를 이용해주세요.</span
	            >
	          </div>
	        </div>
	      </div>
	    </div>
	   </section>
</body>
 <script>
 $(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');
	  fileTarget.on('change', function(){
	    if(window.FileReader){
	       var filename = $(this)[0].files[0].name;
	    } else {
	      var filename = $(this).val().split('/').pop().split('\\').pop();
	    }
	    $(this).siblings('.upload-name').val(filename);
	    });
	}); 
 </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>






