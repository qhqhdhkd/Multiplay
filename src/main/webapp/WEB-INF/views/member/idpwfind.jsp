<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<title>멀티플레이::아이디/비밀번호 찾기</title>

<!-- 우리가 추가한 style -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/mymain.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/tab.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
        type="text/javascript"></script>

<body>
  <div class="container">
    <!-- 탭 메뉴 상단 시작 -->
      <ul class="tabs">
        <li class="tab-link current" data-tab="tab-1">아이디 찾기</li>
        <li class="tab-link" data-tab="tab-2">비밀번호 찾기</li>
      </ul>
      <div id="tab-1" class="tab-content current">
        <li><div class="log3">이름</div></li>
        <div class="box2">
            <label for ="name"></label><input type="text" id="name" placeholder="성함을 입력하세요">
        </div>
        <li><div class="log3">이메일</div></li>
        <div class="box2">
            <label for="email"></label><input type="email" name = "email" id ="email" class = "email" placeholder="이메일을 입력하세요" required>
        </div>
        <button onclick="" class="table-button">아이디 찾기</button>
      </div>
      <div id="tab-2" class="tab-content">
        <li><div class="log3">아이디 혹은 이메일</div></li>
        <div class="box2">
          <label for ="user_id"></label><input type="text" name="user_id" id="user_id" class="input_text"  placeholder="아이디 혹은 이메일을 입력하세요" required>
      </div>
        <li><div class="log3">이름</div></li>
      <div class="box2">
          <label for ="name"></label><input type="text" id="name" placeholder="성함을 입력하세요">
      </div>
      <button onclick="" class="table-button">비밀번호 찾기</button>
    </div>
    <!-- 탭 메뉴 내용 끝 -->
</body>
<script src="${path}/resources/js/tab.js"></script>
</html>