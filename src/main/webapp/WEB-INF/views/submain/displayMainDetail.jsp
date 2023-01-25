<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="멀티플레이::전시" name="title" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta Tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Bootstrap based News, Magazine and Blog Theme">

<!-- Favicon -->
<link rel="shortcut icon"
	href="${path}/resources/images/ours/ours/favicon.ico">

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
	href="${path}/resources/css/location.css">
<link id="style-switch" rel="stylesheet" type="text/css"
	href="${path}/resources/css/style.css">
<link id="style-switch" rel="stylesheet" type="text/css"
	href="${path}/resources/css/display.css">
<link rel="stylesheet" href="${path}/resources/css/theme.min.css">
<link id="style-switch" rel="stylesheet" type="text/css"
	href="${path}/resources/css/mymain.css">

<!-- Bootstrap JS -->
<script
	src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="${path}/resources/vendor/tiny-slider/tiny-slider.js"></script>
<script src="${path}/resources/vendor/sticky-js/sticky.min.js"></script>
<script src="${path}/resources/vendor/plyr/plyr.js"></script>

<!-- Template Functions -->
<script src="${path}/resources/js/functions.js"></script>
<link id="style-switch" rel="stylesheet" type="text/css"
	href="${path}/resources/css/main.css">
</head>

<body>
	<div style="background-color: #fff7ed">
		<section class="pt-0 pb-7 card-grid second">
			<div class=" center frist ">
				<h3 style="color: #ffffff">상세 검색</h3>
				<form action="${path}/submain/displayMainDetail" method="get">
					<table class="table">
						<tr>
							<th noWrap><input class="searchSize" type="text"
								name="searchValue" class="center" value="${searchValue}"></th>
							<th noWrap class="text-center"><h4>전시 시작일</h4></th>
							<th noWrap><input type="date" class="calender"
								value="${startday}" name="startday" name="startday" value=""
								min="2000-01-01" max="2030-12-31"></th>
							<th noWrap class="text-center"><h4>전시 마감일</h4></th>
							<th noWrap><input type="date" class="calender" name="endday"
								value="${endday}" min="2000-01-01" max="2030-12-31"></th>
							<th noWrap><input type="submit" class="btn_color" value="검색" /></th>
						</tr>
					</table>

				</form>
			</div>
			<div>
				<div class="row ">
					<div class="col-12">
						<div
							class="tiny-slider arrow-hover arrow-blur arrow-white overflow-hidden">
							<div class="tiny-slider-inner" data-autoplay="true"
								data-hoverpause="true" data-gutter="1" data-arrow="true"
								data-dots="false" data-items="1">

								<!-- Slide 1 -->
								<div class="card bg-dark-overlay-3 h-400 h-sm-500 h-md-600"
									style="background-image: url(${path}/resources/images/ours/display-banner.jpg); background-position: center left; background-size: cover;">
									<!-- Card Image overlay -->
									<div
										class="card-img-overlay d-flex align-items-center p-3 p-sm-5">
										<div class="w-100 my-auto">
											<div class="col-md-10 col-lg-7 mx-auto text-center">
												<!-- Card category -->
												<!-- Card title -->
												<h2 class="text-white display-5">
													<a href="post-single-2.html"
														class="btn-link text-reset fw-normal"></a>
												</h2>


											</div>
										</div>
									</div>
								</div>
								<!-- Slide 2 -->
								<div
									class="card bg-dark-overlay-3 h-400 h-sm-500 h-md-600 rounded-0"
									style="background-image: url(${path}/resources/images/ours/display-banner.jpg); background-position: center left; background-size: cover;">
									<!-- Card Image overlay -->
									<div
										class="card-img-overlay d-flex align-items-center p-3 p-sm-5">
										<div class="w-100 my-auto">
											<div class="col-md-10 col-lg-7 mx-auto text-center"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<c:if test="${empty list}">
		<h3 style="text-align: center">검색하신 결과가 없습니다.</h3>
	</c:if>
	<div class="home-top5-area container">
		<ul>
			<c:forEach var="item" items="${list}">
				<li>
					<div class="home-top5-list">
						<a href="${path}/submain/genreDetail?cno=${item.show_cno}"> <img src=${item.show_thumbnail }
						alt=""
							class="rounded-top-md card-img-top home-top5-img">

						</a>
					</div>
					<div class="box ">
						<table class="table-bottom">
							<tr>
								<td>
									<h4>${item.show_title}
										<br>
									</h4>
								</td>
							</tr>

							<tr>
								<td><h5>${item.show_place}</h5></td>
							</tr>
							<tr>
								<td><h6>
										${item.show_startdate} <br> ~ ${item.show_enddate} <br>
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
	<script
		src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/odometer/odometer.min.js"></script>
	<script
		src="${path}/resources/libs/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script
		src="${path}/resources/libs/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script src="${path}/resources/libs/flatpickr/dist/flatpickr.min.js"></script>
	<script
		src="${path}/resources/libs/inputmask/dist/jquery.inputmask.min.js"></script>
	<script src="${path}/resources/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="${path}/resources/libs/quill/dist/quill.min.js"></script>
	<script
		src="${path}/resources/libs/file-upload-with-preview/dist/file-upload-with-preview.iife.js"></script>
	<script src="${path}/resources/libs/dragula/dist/dragula.min.js"></script>
	<script
		src="${path}/resources/libs/bs-stepper/dist/js/bs-stepper.min.js"></script>
	<script src="${path}/resources/libs/dropzone/dist/min/dropzone.min.js"></script>
	<script src="${path}/resources/libs/jQuery.print/jQuery.print.js"></script>
	<script src="${path}/resources/libs/prismjs/prism.js"></script>
	<script
		src="${path}/resources/libs/prismjs/components/prism-scss.min.js"></script>
	<script src="${path}/resources/libs/@yaireo/tagify/dist/tagify.min.js"></script>
	<script
		src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
	<script
		src="${path}/resources/libs/@popperjs/core/dist/umd/popper.min.js"></script>
	<script
		src="${path}/resources/libs/tippy.js/dist/tippy-bundle.umd.min.js"></script>
	<script src="${path}/resources/libs/typed.js/lib/typed.min.js"></script>
	<script
		src="${path}/resources/libs/jsvectormap/dist/js/jsvectormap.min.js"></script>
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