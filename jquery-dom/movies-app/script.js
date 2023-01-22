const removeMovie = (target) => {
  console.log(target);
};

$("#submit").on("click", (event) => {
  event.preventDefault();
  const movieTitle = $("#title").val();
  const rating = $("#rating").val();
  new Movie();
});

$("#movie-list").on("click", "button", (evt) => {
  removeMovie(evt.target);
});

class Movie {
  constructor() {
    this.title = this.getTitle();
    this.rating = this.getRating();
    this.placeInList();
    this.placeDeleteButton();
  }
  getTitle() {
    console.log("getting title");
    return $("#title").val();
  }
  getRating() {
    console.log("getting rating");
    return $("#rating").val();
  }
  deleteMovie(event) {}
  placeInList() {
    const movieTitle = $("<td>").text(`${this.title}`);
    const movieRating = $("<td>").text(`${this.rating}`);
    const 
  }
}
