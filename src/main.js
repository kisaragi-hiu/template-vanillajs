"use strict";

let counter = document.getElementById("counter");

counter.count = 0;
counter.render = () => {
  counter.innerText = `${counter.count}`;
};

counter.render();

counter.addEventListener("click", () => {
  counter.count += 1;
  counter.render();
});

let reset = document.getElementById("reset");

reset.addEventListener("click", () => {
  counter.count = 0;
  counter.render();
});
