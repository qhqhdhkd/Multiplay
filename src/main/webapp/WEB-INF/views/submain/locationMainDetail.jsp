<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="멀티플레이::지역" name="title" />
</jsp:include>
	
<!DOCTYPE html>
<html>
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Bootstrap based News, Magazine and Blog Theme">

<!-- Favicon -->
<link rel="shortcut icon" href="${path}/resources/images/favicon.ico">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;700&family=Rubik:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="${path}/resources/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/vendor/tiny-slider/tiny-slider.css">

<!-- Theme CSS -->


<link id="style-switch" rel="stylesheet" type="text/css"
	href="${path}/resources/css/style.css">
<link id="style-switch" rel="stylesheet" type="text/css"
	href="${path}/resources/css/location.css">
<link rel="stylesheet" href="${path}/resources/css/theme.min.css">
<link id="style-switch" rel="stylesheet" type="text/css"
	href="${path}/resources/css/mymain.css">
</head>
<body>
<section id="content">

	<!-- Content -->
	<div class="pt-lg-0 pb-lg-0 pt-0 pb-5">
		<div class="container">
			<div class="row mb-4">
				<div class="col"></div>
			</div>
			<div class="position-relative">
				<ul class="controls " id="sliderFirstControls">
					<li class="prev"><i class="fe fe-chevron-left"></i></li>
					<li class="next"><i class="fe fe-chevron-right"></i></li>
				</ul>
				<div class="sliderFirst">
					<div class="item">
						<!-- Card -->
						<div class="card mb-4 card-hover">
							<a href="${path}/submain/genreDetail?cno=141" class="card-img-top"><img
								src="http://tkfile.yes24.com/upload2/perfblog/202209/20220922/20220922-43616.jpg/dims/quality/70/"
								alt="" class="rounded-bottom-md rounded-top-md card-img-top"></a>
						</div>
					</div>

					<div class="item">
						<!-- Card -->
						<div class="card mb-4 card-hover">
							<a href="${path}/submain/genreDetail?cno=132" class="card-img-top"><img
								src="http://tkfile.yes24.com/upload2/perfblog/202211/20221128/20221128-43451.jpg/dims/quality/70/"
								alt="" class=" rounded-bottom-md rounded-top-md card-img-top"></a>
						</div>
					</div>

					<div class="item">
						<!-- Card -->
						<div class="card mb-4 card-hover">
							<a href="${path}/submain/genreDetail?cno=119" class="card-img-top"><img
								src="http://tkfile.yes24.com/upload2/perfblog/202212/20221212/20221212-43518.jpg/dims/quality/70/"
								alt="" class=" rounded-bottom-md rounded-top-md card-img-top"></a>

						</div>
					</div>


					<div class="item">
						<!-- Card -->
						<div class="card mb-4 card-hover">
							<a href="${path}/submain/genreDetail?cno=142" class="card-img-top"><img
								src="http://tkfile.yes24.com/upload2/PerfBlog/202210/20221018/20221018-43839_1.jpg"
								alt="" class="rounded-bottom-md rounded-top-md card-img-top"></a>

						</div>
					</div>


					<div class="item">
						<!-- Card -->
						<div class="card mb-4 card-hover">
							<a href="${path}/submain/genreDetail?cno=136" class="card-img-top"><img
								src="http://tkfile.yes24.com/upload2/perfblog/202211/20221114/20221114-44090.jpg/dims/quality/70/"
								alt="" class="rounded-bottom-md rounded-top-md card-img-top"></a>

						</div>
					</div>


					<div class="item">
						<!-- Card -->
						<div class="card mb-4 card-hover">
							<a href="${path}/submain/genreDetail?cno=136" class="card-img-top"><img
								src="http://tkfile.yes24.com/upload2/perfblog/202211/20221121/20221121-43929.jpg/dims/quality/70/"
								alt="" class="rounded-bottom-md rounded-top-md card-img-top"></a>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<section id="content" class="container">
		<h2 class="exhibition-center pb-8" style="text-align: center">지역별 공연 & 전시</h2>
			<form action="${path}/submain/locationMainDetail" method="get">
				<table class="table" style="border-color: #fff7ed">
					<tr>
						<th noWrap><a
							href="${path}/submain/locationMainDetail?local=서울"> 서울 </a></th>
						<th noWrap><a
							href="${path}/submain/locationMainDetail?local=인천"> 인천 </a></th>
						<th noWrap><a
							href="${path}/submain/locationMainDetail?local=경기"> 경기 </a></th>
						<th noWrap><a
							href="${path}/submain/locationMainDetail?local=대전"> 대전 </a></th>
						<th noWrap><a
							href="${path}/submain/locationMainDetail?local=광주"> 광주 </a></th>
						<th noWrap><a
							href="${path}/submain/locationMainDetail?local=부산"> 부산 </a></th>
						<th noWrap><a
							href="${path}/submain/locationMainDetail?local=창원"> 창원 </a></th>
					</tr>
				</table>
			</form>
	</section>
<h3 style="margin-left:16%">공연</h3>
	
	<div class="home-top5-area container">
		<ul >
	
		<c:forEach var="item" items="${list}">
			<li>
				<c:if test= "${item.show_realmname == '연극'||item.show_realmname == '콘서트'||item.show_realmname == '클래식'||item.show_realmname == '무용'}" >
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
				</c:if>
			</li>
		</c:forEach>
			
		</ul>
	</div>
	<h3 style="margin-left:16%">전시</h3>
	
	<div class="home-top5-area container">
		<ul >
		<c:forEach var="item" items="${list}">
			<li>
				<c:if test= "${item.show_realmname == '전시'||item.show_realmname == '미술'}" >
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
				</c:if>
			</li>
		</c:forEach>
			
		</ul>
	</div>
	
	<%-- 탑5 끝 --%>
	<!-- Scripts -->
	<!-- Libs JS -->
	<script src="${path}/resources/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/odometer/odometer.min.js"></script>
	<script
		src="${path}/resources/libs/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script
		src="${path}/resources/libs/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script src="${path}/resources/libs/flatpickr/dist/flatpickr.min.js"></script>
	<script src="${path}/resources/libs/inputmask/dist/jquery.inputmask.min.js"></script>
	<script src="${path}/resources/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="${path}/resources/libs/quill/dist/quill.min.js"></script>
	<script
		src="${path}/resources/libs/file-upload-with-preview/dist/file-upload-with-preview.iife.js"></script>
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
	<script
		src="${path}/resources/libs/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${path}/resources/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="${path}/resources/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="${path}/resources/libs/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
	<script
		src="${path}/resources/libs/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
	<script
		src="${path}/resources/libs/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>
	<script src="${path}/resources/libs/fullcalendar/main.min.js"></script>
	<script
		src="${path}/resources/libs/@lottiefiles/lottie-player/dist/lottie-player.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/libs/nouislider/dist/nouislider.min.js"></script>
	<script src="${path}/resources/libs/wnumb/wNumb.min.js"></script>
	<script src="${path}/resources/libs/glightbox/dist/js/glightbox.min.js"></script>



	<!-- CDN File for moment -->
	<script
		src='https://cdn.jsdelivr.net/npm/moment@2.29.1/min/moment.min.js'></script>




	<!-- Theme JS -->
	<script src="${path}/resources/js/theme.min.js"></script>

</body>

<!-- Back to top -->
<div class="back-top">
	<i class="bi bi-arrow-up-short"></i>
</div>

<!-- =======================
JS libraries, plugins and custom scripts -->

<!-- Bootstrap JS -->
<script
	src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="${path}/resources/vendor/tiny-slider/tiny-slider.js"></script>
<script src="${path}/resources/vendor/jarallax/jarallax.min.js"></script>
<script src="${path}/resources/vendor/jarallax/jarallax-video.min.js"></script>

<!-- Template Functions -->
<script src="${path}/resources/js/functions.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>