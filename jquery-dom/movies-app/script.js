$("#submit").on("click", (event) => {
  event.preventDefault();
  movieList.checkForDuplicate($("#title").val())
    ? movieList.announceDuplicate()
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
  announceDuplicate() {}
  sortTitleAlpha() {}
  sortByAdded() {}
  sortRating() {}
  renderList() {}
}

class Movie {
  constructor(title, rating) {
    this.addedOrder = this.getOrderNumber();
    this.title = title;
    this.rating = rating;
    this.addToList();
  }
  getOrderNumber() {
    if (movieList.movies.length === undefined) {
      return 1;
    } else {
      return movieList.movies.length + 1;
    }
  }
  addToList() {
    movieList.movies.push(this);
  }
}
const movieList = new List();
