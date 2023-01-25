/*
	인원선택
*/
const personWrapper = document.querySelector(".pay-persons-wrapper");
let check = "";
let personDiv = "";

for(let i = 0; i < 4; i++){
	personDiv = document.createElement("div");
	personWrapper.append(personDiv);
	for (let j = 0; j < 9; j++) {
		const input = document.createElement('input');
        input.type = "button";
        input.name = "seats"
        input.classList = "seat";
        //3중포문을 사용하지 않기위해 
        mapping(input, i, j);
        div.append(input);
        input.addEventListener('click', function(e) {
            console.log(e.target.value);
            //중복방지 함수
            selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

            //click class가 존재할때(제거해주는 toggle)
            if (input.classList.contains("check")) {
                input.classList.remove("check");
                check = document.querySelectorAll(".check");
                selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                check.forEach((data) => {
                    selectedSeats.push(data.value);
                });
                //click class가 존재하지 않을때 (추가해주는 toggle)
            } else {
                input.classList.add("check");
                check = document.querySelectorAll(".check");
                check.forEach((data) => {
                    selectedSeats.push(data.value);
                })
            }
            console.log(selectedSeats);
        })
	}
}

/*
	좌석선택
*/
let test = [];
let selectedSeats = new Array();
let selectedSeatsMap = [];
const seatWrapper = document.querySelector(".pay-seat-wrapper");
let clicked = "";
let div = "";

for (let i = 0; i < 10; i++) { // 행(A)
    div = document.createElement("div");
    seatWrapper.append(div);
    for (let j = 1; j < 14; j++) { // 열(1)
        const input = document.createElement('input');
        input.type = "button";
        input.name = "persons"
        input.classList = "person";
        //3중포문을 사용하지 않기위해 
        mapping(input, i, j);
        div.append(input);
        input.addEventListener('click', function(e) {
            console.log(e.target.value);
            //중복방지 함수
            selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

            //click class가 존재할때(제거해주는 toggle)
            if (input.classList.contains("check")) {
                input.classList.remove("check");
                check = document.querySelectorAll(".check");
                selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                clicked.forEach((data) => {
                    selectedSeats.push(data.value);
                });
                //click class가 존재하지 않을때 (추가해주는 toggle)
            } else {
                input.classList.add("clicked");
                clicked = document.querySelectorAll(".clicked");
                clicked.forEach((data) => {
                    selectedSeats.push(data.value);
                })
            }
            console.log(selectedSeats);
        })
    }
}

function mapping(input, i, j) {
    if (i === 0) {
        input.value = j;
    } else if (i === 1) {
        input.value = j;
    } else if (i === 2) {
        input.value = j;
    } else if (i === 3) {
        input.value = j;
    } else if (i === 4) {
        input.value = j;
    } else if (i === 5) {
        input.value = j;
    } else if (i === 6) {
        input.value = j;
    } else if (i === 7) {
        input.value = j;
    } else if (i === 8) {
        input.value = j;
    } else if (i === 9) {
        input.value = j;
    } 
}