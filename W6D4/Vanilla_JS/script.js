document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const submitButton = document.querySelector(".favorite-submit");

  submitButton.addEventListener("click", (e) => {
    e.preventDefault();
    const favInput = document.querySelector(".favorite-input");
    const val = favInput.value;
    favInput.value = "";

    const sfPlaces = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = val;
    sfPlaces.appendChild(li);
  });



  // adding new photos

  // --- your code here!

  const container = document.querySelector(".photo-form-container");

  const toggleForm = (e) => {

    if (container.classList.contains("hidden")){
      container.classList.remove("hidden");
    } else{
      container.classList.add("hidden");
    }
  };

  const formButton = document.querySelector(".photo-show-button");

  formButton.addEventListener("click", toggleForm);

  const photoButton = document.querySelector(".photo-url-submit");

  photoButton.addEventListener("click", (e) => {
    e.preventDefault();
    const photoInput = document.querySelector(".photo-url-input");
    const pval = photoInput.value;
    photoInput.value = "";

    const photos = document.querySelector(".dog-photos");
    const li = document.createElement("li");
    const img = document.createElement("img");
    img.src = pval;
    li.appendChild(img);
    photos.appendChild(li);
  });


});
