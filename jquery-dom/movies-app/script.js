$("#submit").on("click", (event) => {
  event.preventDefault();
  movieList.checkForDuplicate($("#title").val())
    ? console.log("duplicate")
    : new Movie($("#title").val(), $("#rating").val());
});

class List {
  constructor() {
    this.movies = [];
  }
  checkForDuplicate(movieTitle) {
    if (this.movies.some((e) => e.title === movieTitle)) {
      return true;
    }
    return false;
  }
  sortTitleAlpha() {}
  sortByAdded() {}
  sortRating() {}
  renderList() {}
}

class Movie {
  constructor(title, rating) {
    this.addedOrder = this.getOrder();
    this.title = title;
    this.rating = rating;
    this.placeInHTMLList();
    this.addToList();
  }
  getOrder() {
    if (movieList.movies.length === undefined) {
      return 1;
    } else {
      return movieList.movies.length + 1;
    }
  }
  getTitle() {
    console.log("getting title");
    return $("#title").val();
  }
  getRating() {
    console.log("getting rating");
    return $("#rating").val();
  }
  placeInHTMLList() {
    const movieTitle = $("<td>").text(`${this.title}`);
    const movieRating = $("<td>").text(`${this.rating}`);
    const delteButton = $("<button>").addClass("delete-button");
    const row = $("<tr>")
      .append(movieTitle)
      .append(movieRating)
      .append(delteButton);
    $("#movie-list").append(row);
  }
  addToList() {
    movieList.movies.push(this);
  }
}
const movieList = new List();
