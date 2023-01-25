<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="멀티플레이::공연" name="title" />
</jsp:include>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link id="style-switch" rel="stylesheet" type="text/css" href="${path}/resources/css/show.css">
<link id="style-switch" rel="stylesheet" type="text/css" href="${path}/resources/css/location.css">

<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Bootstrap based News, Magazine and Blog Theme">

	<!-- Favicon -->
	<link rel="shortcut icon" href="${path}/resources/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;700&family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/tiny-slider/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/plyr/plyr.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="${path}/resources/css/style.css">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Geeks is a fully responsive and yet modern premium bootstrap 5 template & snippets. Geek is feature-rich components and beautifully designed pages that help you create the best possible website and web application projects. Bootstrap Snippet " />
<meta name="keywords" content="Geeks UI, bootstrap, bootstrap 5, Course, Sass, landing, Marketing, admin themes, bootstrap admin, bootstrap dashboard, ui kit, web app, dash ui, admin dashboard, HTML5, multipurpose" />



<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="${path}/resources/fonts/feather/feather.css" rel="stylesheet">
<link href="${path}/resources/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
<link href="${path}/resources/libs/dragula/dist/dragula.min.css" rel="stylesheet" />
<link href="${path}/resources/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="${path}/resources/libs/dropzone/dist/dropzone.css" rel="stylesheet" />
<link href="${path}/resources/libs/magnific-popup/dist/magnific-popup.css" rel="stylesheet" />
<link href="${path}/resources/libs/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<link href="${path}/resources/libs/@yaireo/tagify/dist/tagify.css" rel="stylesheet">
<link href="${path}/resources/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet">
<link href="${path}/resources/libs/tippy.js/dist/tippy.css" rel="stylesheet">
<link href="${path}/resources/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="${path}/resources/libs/prismjs/themes/prism-okaidia.min.css" rel="stylesheet">
<link href="${path}/resources/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">
<link href="${path}/resources/libs/nouislider/dist/nouislider.min.css" rel="stylesheet">
<link href="${path}/resources/libs/glightbox/dist/css/glightbox.min.css" rel="stylesheet">



<!-- Theme CSS -->

<link rel="stylesheet" href="${path}/resources/css/theme.min.css">
<link id="style-switch" rel="stylesheet" type="text/css"
	href="${path}/resources/css/mymain.css">
</head>
<body>

<section class="container content">
	
<form action="${path}/submain/showMainDetail" method="get">
<input type="text" name="searchValue" class="center" placeholder="검색어를 입력해주세요" value="${searchValue}">
<input type="submit" class="btn_color" value="검색"/>
<table class="table" border="1" >
  <tr >
    <th rowspan="2"><h3>장르</h3></th>
    <th noWrap><label><input type="checkbox" name="genre" value="연극" ${fn:contains(genre, '연극') ? 'checked':''}> 연극</label></th>
    <th noWrap><label><input type="checkbox" name="genre" value="미술" ${fn:contains(genre, '콘서트') ? 'checked':''}> 콘서트</label></th>

  </tr>
  <tr>
     <th noWrap><label><input type="checkbox" name="genre" value="클래식" ${fn:contains(genre, '클래식') ? 'checked':''}> 클래식</label></th>
    <th noWrap><label><input type="checkbox" name="genre" value="무용" ${fn:contains(genre, '무용') ? 'checked':''}> 오페라</label></th>
   
  </tr>
  <tr>
    <th rowspan="2"><h3>지역</h3></th>
    <th noWrap><label><input type="checkbox" name="local" value="서울" ${fn:contains(local, '서울') ? 'checked':''}> 서울</label></th>
    <th noWrap><label><input type="checkbox" name="local" value="경기" ${fn:contains(local, '경기') ? 'checked':''}> 경기</label></th>
    <th noWrap><label><input type="checkbox" name="local" value="인천" ${fn:contains(local, '인천') ? 'checked':''}> 인천</label></th>
    <th><label><input type="checkbox" name="local" value="대전" ${fn:contains(local, '대전') ? 'checked':''}> 대전</label></th>

   	   	
  </tr>
  <tr>
    <th noWrap><label><input type="checkbox" name="local" value="창원" ${fn:contains(local, '창원') ? 'checked':''}> 창원</label></th>
    <th noWrap><label><input type="checkbox" name="local" value="부산" ${fn:contains(local, '부산') ? 'checked':''}> 부산</label></th>
    <th noWrap><label><input type="checkbox" name="local" value="광주" ${fn:contains(local, '광주') ? 'checked':''}> 광주</label></th>
   	<th></th>
    <th></th>
  </tr>
  
  <tr>
  <th><h3>공연일</h3></th>
  <th>공연 시작일</th>
  <th><input type="date" class="calender" name="startday" value="${startday}"
       min="2000-01-01" max="2030-12-31"></th>
    <th></th>
  <th noWrap>      공연 마감일</th>
  <th noWrap><input type="date" class="calender" name="endday"  value="${endday}"
       min="2000-01-01" max="2030-12-31"></th>
       <th></th>
       <th></th>
       
  </tr>
</table>
</form>

	</section>

<div class="home-top5-area container">
		<ul >
		<c:forEach var="item" items="${list}">
			<li>
				<div class="home-top5-list">
					<a href="${path}/submain/genreDetail?cno=${item.show_cno}"> <img
						src=${item.show_thumbnail}
						alt="" class="rounded-top-md card-img-top home-top5-img">

					</a>
				</div>
				<div class="box">
					<table class="table-bottom">
						<tr>
							<td>
								<h4>${item.show_title} <br></h4>
							</td>
						</tr>

						<tr>
							<td><h5>${item.show_place}</h5></td>
						</tr>
						<tr>
							<td><h6>
									${item.show_startdate} <br>
									${item.show_enddate} <br>
								</h6></td>
						</tr>
					</table>
				</div>
			</li>
		</c:forEach>
		</ul>
	</div>
    <!-- Scripts -->
    <!-- Libs JS -->
<script src="${path}/resources/libs/jquery/dist/jquery.min.js"></script>
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/odometer/odometer.min.js"></script>
<script src="${path}/resources/libs/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
<script src="${path}/resources/libs/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="${path}/resources/libs/flatpickr/dist/flatpickr.min.js"></script>
<script src="${path}/resources/libs/inputmask/dist/jquery.inputmask.min.js"></script>
<script src="${path}/resources/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="${path}/resources/libs/quill/dist/quill.min.js"></script>
<script src="${path}/resources/libs/file-upload-with-preview/dist/file-upload-with-preview.iife.js"></script>
<script src="${path}/resources/libs/dragula/dist/dragula.min.js"></script>
<script src="${path}/resources/libs/bs-stepper/dist/js/bs-stepper.min.js"></script>
<script src="${path}/resources/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="${path}/resources/libs/jQuery.print/jQuery.print.js"></script>
<script src="${path}/resources/libs/prismjs/prism.js"></script>
<script src="${path}/resources/libs/prismjs/components/prism-scss.min.js"></script>
<script src="${path}/resources/libs/@yaireo/tagify/dist/tagify.min.js"></script>
<script src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="${path}/resources/libs/@popperjs/core/dist/umd/popper.min.js"></script>
<script src="${path}/resources/libs/tippy.js/dist/tippy-bundle.umd.min.js"></script>
<script src="${path}/resources/libs/typed.js/lib/typed.min.js"></script>
<script src="${path}/resources/libs/jsvectormap/dist/js/jsvectormap.min.js"></script>
<script src="${path}/resources/libs/jsvectormap/dist/maps/world.js"></script>
<script src="${path}/resources/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${path}/resources/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="${path}/resources/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${path}/resources/libs/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
<script src="${path}/resources/libs/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
<script src="${path}/resources/libs/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>
<script src="${path}/resources/libs/fullcalendar/main.min.js"></script>
<script src="${path}/resources/libs/@lottiefiles/lottie-player/dist/lottie-player.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/libs/nouislider/dist/nouislider.min.js"></script>
<script src="${path}/resources/libs/wnumb/wNumb.min.js"></script>
<script src="${path}/resources/libs/glightbox/dist/js/glightbox.min.js"></script>



<!-- CDN File for moment -->
<script src='https://cdn.jsdelivr.net/npm/moment@2.29.1/min/moment.min.js'></script>




<!-- Theme JS -->
<script src="${path}/resources/js/theme.min.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>
</html>