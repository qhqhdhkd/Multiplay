/*
  카드 바꾸기
*/
const editNav = document.querySelector('#editNav')
const stampNav = document.querySelector('#stampNav')
const bookNav = document.querySelector('#bookNav')
const pwchangeNav = document.querySelector('#pwchangeNav')

const mypageEdit = document.querySelector('#mypageEdit')
const mypageStamp = document.querySelector('#mypageStamp')
const mypageBook = document.querySelector('#mypageBook')
const mypagePw = document.querySelector('#mypagePw')

const pwbutton = document.querySelector('.pwbutton')

editNav.addEventListener('click', ()=>{
  removeClass();
  editNav.classList.add("selectBox");
  mypageEdit.classList.add("target");
})

stampNav.addEventListener('click', () =>{
  removeClass();
  stampNav.classList.add("selectBox");
  mypageStamp.classList.add("target");
})

bookNav.addEventListener('click', () =>{
  removeClass();
  bookNav.classList.add("selectBox");
  mypageBook.classList.add("target");
})

pwchangeNav.addEventListener('click',pwchange)
pwbutton.addEventListener('click', pwchange)


function pwchange(){
  removeClass();
  pwchangeNav.classList.add("selectBox");
  mypagePw.classList.add("target");
}



/*
  selectBox와 target 제거하기
*/
function removeClass(){
  editNav.classList.remove("selectBox");
  stampNav.classList.remove("selectBox");
  bookNav.classList.remove("selectBox");
  pwchangeNav.classList.remove("selectBox");
  
  mypageEdit.classList.remove("target");
  mypageStamp.classList.remove("target");
  mypageBook.classList.remove("target");
  mypagePw.classList.remove("target");
}


/*
  스탬프
*/
