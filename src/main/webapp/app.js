const body = document.querySelector("body");
const openBtn = document.querySelector(".open-sidebar");
const closeBtn = document.querySelector(".close-sidebar");

openBtn.addEventListener("click", () => {
  body.classList.add("show-sidebar");
});

closeBtn.addEventListener("click", () => {
  body.classList.remove("show-sidebar");
});
