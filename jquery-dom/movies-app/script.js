const removeMovie = (target) => {
  console.log(target);
};

$("#submit").on("click", (event) => {
  event.preventDefault();
  const movieTitle = $("#title").val();
  const rating = $('#rating').val();
  
});

$("#movie-list").on("click", "button", (evt) => {
  removeMovie(evt.target);
});
