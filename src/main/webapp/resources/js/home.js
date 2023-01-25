/* @@@@@@@@@@@@@@@@@@@@@ 배너 @@@@@@@@@@@@@@@@@@@@@ */

/*
  div사이즈 동적으로 구하기
*/
const outer = document.querySelector('.home-banner-outer');
const innerList = document.querySelector('.home-banner-inner-list');
const inners = document.querySelectorAll('.home-banner-inner');
let currentIndex = 0; // 현재 슬라이드 화면 인덱스

inners.forEach((inner) => {
  inner.style.width = `${outer.clientWidth}px`; // inner의 width를 모두 outer의 width로 만들기
})

innerList.style.width = `${outer.clientWidth * inners.length}px`; // innerList의 width를 inner의 width * inner의 개수로 만들기

let banner = setInterval(rightBanner(), 5000);


/*
  자동으로 넘어가는 배너
*/
setInterval(rightBanner, 5000);

/*
  버튼에 이벤트 등록하기
*/
const buttonLeft = document.querySelector('.button-left');
const buttonRight = document.querySelector('.button-right');


buttonLeft.addEventListener('click', () => {
  clearInterval(banner);
  banner = setInterval(()=>{
    rightBanner();
  }, 5000);
  leftBanner();
});

buttonRight.addEventListener('click', () => {
  clearInterval(banner);
  banner = setInterval(()=>{
    rightBanner();
  }, 5000)
  rightBanner();
});

function leftBanner(){
  currentIndex--;
  currentIndex = currentIndex < 0 ? 0 : currentIndex; // index값이 0보다 작아질 경우 0으로 변경
  innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`; // index만큼 margin을 주어 옆으로 밀기
}

function rightBanner(){
  currentIndex++;
  currentIndex = currentIndex >= inners.length ? 0 : currentIndex; // index값이 inner의 총 개수보다 많아질 경우 마지막 인덱스값으로 변경
  innerList.style.marginLeft = `-${outer.clientWidth * currentIndex}px`; // index만큼 margin을 주어 옆으로 밀기
}


/*
  공연후기 카드 변경 버튼에 이벤트 등록하기
*/
const cardBtnL = document.querySelector('.cardBtnL');
const cardBtnR = document.querySelector('.cardBtnR');
const label = '#cardLabel'
const card = '#cardItem';
let index = 1;
let cardLabelId = document.querySelector(label+(index+"")); 
let cardItemId = document.querySelector(card+index); 

cardBtnL.addEventListener('click', () => {
  cardLabelId.classList.remove("active");
  cardItemId.classList.remove("target");
  index--;
  index = index < 1 ? 4 : index;
  cardLabelId = document.querySelector(label+(index+"")); 
  cardItemId = document.querySelector(card+(index+""));
  cardLabelId.classList.add("active");
  cardItemId.classList.add("target");
});
cardBtnR.addEventListener('click', () => {
  cardLabelId.classList.remove("active");
  cardItemId.classList.remove("target");
  index++;
  index = index > 4 ? 1 : index;
  cardLabelId = document.querySelector(label+(index+"")); 
  cardItemId = document.querySelector(card+(index+""));
  cardLabelId.classList.add("active");
  cardItemId.classList.add("target");
});











// 지유님 코드

 $('.slider > .pages > div').click(function() {
	var $this = $(this);
	var $slider = $this.closest('.slider');
	
	$this.addClass('active');
	$this.siblings('.active').removeClass('active');
	
	var index = $this.index();
	
	$slider.find(' > .slides > .active').removeClass('active');
	$slider.find(' > .slides > div').eq(index).addClass('active');
});

$('.slider > .side-btns > div').click(function() {
	var $this = $(this);
	var index = $this.index();
	var $slider = $this.closest('.slider');
	
	var $current = $slider.find('.pages > div.active');
	var $post;
	
	if ( index == 0 ) {$post = $current.prev();}
	else { $post = $current.next();}
	
	if ( $post.length == 0 ) {
			if ( index == 0 ) {
					$post = $slider.find('.pages > div:last-child');
			}
			else {
					$post = $slider.find('.pages > div:first-child');
			}
	}
	
	$post.click();
});

function Slider1__moveNext() {
	var $slider = $('.slider-1');
	var $nextBtn = $slider.find('.side-btns > div:last-child');
	$nextBtn.click();
}

setInterval(Slider1__moveNext, 5000);