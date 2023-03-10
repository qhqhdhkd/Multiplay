<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Geeks is a fully responsive and yet modern premium bootstrap 5 template & snippets. Geek is feature-rich components and beautifully designed pages that help you create the best possible website and web application projects. Bootstrap Snippet " />
<meta name="keywords"
	content="Geeks UI, bootstrap, bootstrap 5, Course, Sass, landing, Marketing, admin themes, bootstrap admin, bootstrap dashboard, ui kit, web app, dash ui, admin dashboard, HTML5, multipurpose" />

<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="${path}/resources/images/favicon/favicon.ico">

<!-- Libs CSS -->
<link rel="stylesheet" type="text/css"
	href="${path}/resources/fonts/feather/feather.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/bootstrap-icons/font/bootstrap-icons.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/dragula/dist/dragula.min.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/@mdi/font/css/materialdesignicons.min.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/dropzone/dist/dropzone.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/magnific-popup/dist/magnific-popup.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/bootstrap-select/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/@yaireo/tagify/dist/tagify.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/tiny-slider/dist/tiny-slider.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/tippy.js/dist/tippy.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/prismjs/themes/prism-okaidia.min.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/simplebar/dist/simplebar.min.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/nouislider/dist/nouislider.min.css">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/libs/glightbox/dist/css/glightbox.min.css">


<!-- Theme CSS -->
<link rel="stylesheet" href="${path}/resources/css/theme.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

<title>${param.title}</title>
<%-- content??? ?????? jsp???????????? include??? ??? ?????????, home.jsp?????? --%>

<!-- ????????? ????????? style -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/mymain.css">
<script src="https://kit.fontawesome.com/1fa5c8fe86.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<!-- ?????? ?????? -->
	<nav class="navbar navbar-expand-lg navbar-default header">
		<div class="container-fluid px-0">
			<a class="navbar-brand" href="${path}"> <img
				src="${path}/resources/images/ours/logo_header.png" />
			</a>

			<div class="collapse navbar-collapse" id="navbar-default">
				<!-- ?????? ?????? ?????? -->
				<ul class="navbar-nav header-nav">
					<li class="nav-item"><a class="nav-link"
						href="${path}/submain/showMain" id="navbarBrowse"> ?????? </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/submain/displayMain" id="navbarLanding"> ?????? </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/submain/locationMainDetail" id="navbarPages"> ?????? </a></li>

					<li class="nav-item"><a class="nav-link"
						href="${path}/submain/musicalRanking" id="navbarAccount"> ?????? </a>
					</li>
					<li class="nav-item dropdown "><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> ????????? </a> <!-- ????????? ??? ???????????? ?????? -->
						<div class="dropdown-menu dropdown-menu-md"
							aria-labelledby="navbarDropdown">
							<div class="list-group">
								<a class="list-group-item list-group-item-action border-0"
									href="${path}/board/list">
									<div class="d-flex align-items-center">
										<div class="ms-3">
											<h5 class="mb-0">????????????</h5>
										</div>
									</div>
								</a> <a class="list-group-item list-group-item-action border-0"
									href="${path}/board/monlist">
									<div class="d-flex align-items-center">
										<div class="ms-3">
											<h5 class="mb-0">???????????????</h5>
										</div>
									</div>
								</a> <a class="list-group-item list-group-item-action border-0"
									href="${path}/board/freelist">
									<div class="d-flex align-items-center">
										<div class="ms-3">
											<h5 class="mb-0">???????????????</h5>
										</div>
									</div>
								</a>
							</div>
						</div> <!-- ????????? ??? ???????????? ??? --></li>
				</ul>

				<form action="${path}/submain/search" method="get"
					class="mt-3 mt-lg-0 ms-lg-3 d-flex align-items-center header-searchBar">
					<span class="position-absolute ps-3 search-icon"> <i
						class="fe fe-search"></i>
					</span> <input type="search" name="value" class="form-control ps-6 "
						placeholder="????????????" />
				</form>

				<!-- ????????? ?????? -->
				<%-- ???????????? ?????? --%>
				<c:if test="${loginMember == null}">
					<!-- ????????? ?????? ??? ??? == ??? ?????? -->
					<a class="rounded-circle ms-auto d-none d-lg-block"
						href="${path}/member/login">
						<div class="avatar avatar-md">
							<img alt="avatar" src="${path}/resources/images/ours/logout.png"
								class="rounded-circle" />
						</div>
					</a>
				</c:if>

				<%-- ????????? ?????? --%>
				<c:if test="${loginMember != null}">
					<!-- ????????? ?????? ??? ??? != ??? ?????? -->
					<ul class="navbar-nav navbar-right-wrap ms-auto d-none d-lg-block">
						<li class="dropdown ms-2 d-inline-block"><a
							class="rounded-circle" href="#" data-bs-toggle="dropdown"
							data-bs-display="static" aria-expanded="false">
								<div class="avatar avatar-md">
									<img alt="avatar"
										src="${path}/resources/images/ours/profile.png"
										class="rounded-circle" />
								</div>
						</a> <!-- ????????? ???????????? ?????? -->
							<div class="dropdown-menu dropdown-menu-end">
								<div class="dropdown-item">
									<div class="d-flex">
										<div class="avatar avatar-md">
											<img alt="avatar"
												src="${path}/resources/images/ours/profile.png"
												class="rounded-circle" />
										</div>
										<div class="ms-3 lh-1">
											<h5 class="mb-1">${loginMember.userName}</h5>
											<p class="mb-0 text-muted">${loginMember.userEmail}</p>
										</div>
									</div>
								</div>
								<div class="dropdown-divider"></div>
								<ul class="list-unstyled">
									<li><a class="dropdown-item" href="${path}/member/mypage">
											<i class="fa-solid fa-user me-2"></i>????????????
									</a></li>
									<li><a class="dropdown-item" href="${path}/member/mystamp">
											<i class="fa-solid fa-ticket me-2"></i>?????????
									</a></li>
									<li><a class="dropdown-item"
										href="${path}/member/mybooked"> <i
											class="fa-solid fa-list-ul me-2"></i>????????????
									</a></li>
									<li><a class="dropdown-item"
										href="${path}/member/mypwChange"> <i
											class="fa-solid fa-key me-2"></i>???????????? ??????
									</a></li>
								</ul>
								<div class="dropdown-divider"></div>
								<ul class="list-unstyled">
									<li><a class="dropdown-item" href="${path}/logout"> <i
											class="fe fe-power me-2"></i>????????????
									</a></li>
								</ul>
							</div> <!-- ????????? ???????????? ??? --></li>
					</ul>
				</c:if>
				<!-- ????????? ??? -->
			</div>
			<!-- ?????? ??? -->
		</div>
	</nav>