function Slider(target) {
  let index = 1;
  let isMoved = true;
  const speed = 1000; 
  const transform = "transform " + speed / 1000 + "s";
  let translate = (i) => "translateX(-" + 100 * i + "%)";
 
  const slider = document.querySelector(target);
  const sliderRects = slider.getClientRects()[0];
  slider.style["overflow"] = "hidden";

  // 슬라이더 화면 컨테이너
  const container = document.createElement("div");
  container.style["display"] = "flex";
  container.style["flex-direction"] ="row";
  container.style["width"] = "100%";
  container.style["height"] = "auto";
  container.style["transform"] = translate(index);

  let boxes = [].slice.call(slider.children);
  boxes = [].concat(boxes[boxes.length - 1], boxes, boxes[0]);

  // 슬라이더 화면 스타일
  const size = boxes.length;
  for (let i = 0; i < size; i++) {
    const box = boxes[i];
    box.style["flex"] = "none";
    box.style["flex-wrap"] = "wrap";
    box.style["height"] = "auto";
    box.style["width"] = "100%";
    container.appendChild(box.cloneNode(true));
  }
  container.addEventListener("transitionstart", function () {
    isMoved = false;
    setTimeout(() => {
      isMoved = true;
    }, speed);
  });
  container.addEventListener("transitionend", function () {
    if (index === size - 1) {
      index = 1;
      container.style["transition"] = "none";
      container.style["transform"] = translate(index);
    }
    if (index === 0) {
      index = size - 2;
      container.style["transition"] = "none";
      container.style["transform"] = translate(index);
    }
  });
  slider.innerHTML = "";
  slider.appendChild(container);

  return {
    move: function (i) {
      if (isMoved === true) {
        index = i;
        container.style["transition"] = transform;
        container.style["transform"] = translate(index);
      }
    },
    next: function () {
      if (isMoved === true) {
        index = (index + 1) % size;
        container.style["transition"] = transform;
        container.style["transform"] = translate(index);
      }
    },
    prev: function () {
      if (isMoved === true) {
        index = index === 0 ? index + size : index;
        index = (index - 1) % size;
        container.style["transition"] = transform;
        container.style["transform"] = translate(index);
      }
    }
  };
}
const s1 = new Slider("#slider1");
setInterval(() => {
  s1.next();
  s2.next();
}, 5000)
