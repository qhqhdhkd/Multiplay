var btns = document.getElementsByClassName("select-number-normal");
var btns2 = document.getElementsByClassName("select-number-teen");
var btns3 = document.getElementsByClassName("select-number-old");

/*좌석유형별선택 0-5사이 숫자중에서 하나만 선택가능*/
function handleClick(event) {
  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < btns.length; i++) {
      btns[i].classList.remove("clicked");
    }
    event.target.classList.add("clicked");
  }
}
function init() {
  for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", handleClick);
  }
}
init();


function handleClick2(event) {
  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < btns2.length; i++) {
      btns2[i].classList.remove("clicked");
    }
    event.target.classList.add("clicked");
  }
}
function init2() {
  for (var i = 0; i < btns2.length; i++) { btns2[i].addEventListener("click", handleClick2);}
}
init2();

function handleClick3(event) {
  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < btns3.length; i++) {
      btns3[i].classList.remove("clicked");
    }
    event.target.classList.add("clicked");
  }
}
function init3() {
  for (var i = 0; i < btns3.length; i++) {
    btns3[i].addEventListener("click", handleClick3);
  }
}
init3();

let counter=0;

/*좌석선택 및 가격/총 예매인원 변동*/
$(function(){
  $('.select-seat-ul').on('click', function(e) {
    let nomValue = $(this).val();
      var sum1 = parseInt($(".select-number-normal.clicked").val() || 0);
      var sum2 = parseInt($(".select-number-teen.clicked").val() || 0);
      var sum3 = parseInt($(".select-number-old.clicked").val() || 0);
      var sum = sum1 + sum2 + sum3;
      $("#display").val(sum);
      let money=(sum1*70000)+(sum2*50000)+(sum3*10000);
      $("#ticket-price").val(money.toLocaleString());
      $("#remain-seats").val(130-sum);

    });

    var info = "";
    $('.row div').click(function(){
      if($(this).hasClass('seat')){
        counter++;
        $(this).attr("class","selectedSeat");
        info += $(this).attr("value")+ ", ";
        $(".selected-seats").val(info);
      }else if($(this).hasClass('selectedSeat')){
        counter--;
        $(this).attr("class","seat");
        info= info.replace(''+$(this).attr("value")+', ', '');
        $(".selected-seats").val(info);
      }
      if(counter> $("#display").val()){
        alert("선택좌석이 구매 매수를 초과하였습니다.")
        $(this).attr("class","seat");
        info= info.replace(''+$(this).attr("value")+', ', '');
        $(".selected-seats").val(info);
      }
    });
    $('.reserve-button').click(function(){
      if($("#display").val()==0){
        alert("구매하고자 하는 좌석 매수를 선택해주세요")
        return;
      }

      if(counter==0){
        alert("좌석을 선택해주세요.")
      }else if(counter< $("#display").val()){
        alert("예매 매수보다 선택한 좌석 수가 적습니다.")
      }else{
        alert("결제가 성공적으로 되었습니다.")
        $('.selectedSeat').css("background-color","silver");
      }
    });
});

  