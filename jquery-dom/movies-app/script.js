class List {
  constructor() {
    this.movies = [];
    $("#sort-by").on("change", (e) => {
      this.renderBySort();
    });

    $("#movie-form").on("submit", (event) => {
      event.preventDefault();
      this.addToList();
    });

    $("table").on("click", (e) => {
      if (e.target.tagName === "BUTTON") {
        this.removeHTMLMovie(e.target);
        this.removeMovieFromList(e.target);
      }
    });
  }

  checkForDuplicate(movieTitle) {
    if (this.movies.some((e) => e.title === movieTitle)) {
      return true;
    }
    return false;
  }

  announceDuplicate() {
    alert("That movie is already in the list!");
  }

  addToList() {
    if (this.checkForDuplicate($("#title").val())) {
      this.announceDuplicate();
    } else {
      this.movies.push(new Movie());
      this.renderBySort();
    }
  }

  renderBySort() {
    if ($("#sort-by").val() == "Added") {
      this.sortByAdded();
      this.renderList();
    } else if ($("#sort-by").val() == "Title") {
      this.sortByTitle();
      this.renderList();
    } else {
      this.sortByRating();
      this.renderList();
    }
  }

  sortByTitle() {
    const compare = (a, b) => {
      if (a.title < b.title) {
        return -1;
      }
      if (a.title > b.title) {
        return 1;
      }
      return 0;
    };
    this.movies.sort(compare);
  }

  sortByAdded() {
    const compare = (a, b) => {
      if (a.addedOrder < b.addedOrder) {
        return -1;
      }
      if (a.addedOrder > b.addedOrder) {
        return 1;
      }
      return 0;
    };
    this.movies.sort(compare);
  }

  sortByRating() {
    const compare = (a, b) => {
      if (a.rating - 1 > b.rating - 1) {
        return -1;
      }
      if (a.rating - 1 < b.rating - 1) {
        return 1;
      }
      return 0;
    };
    this.movies.sort(compare);
  }

  renderList() {
    this.resetInputs();
    this.clearHTMLList();
    this.movies.forEach((movie) => {
      $("tbody").append(
        $("<tr>")
          .attr("class", "movie")
          .append(
            $("<td>").attr("class", "title").text(movie.title),
            $("<td>").text(movie.rating),
            $("<button>").text("Delete").attr("class", "delete-button")
          )
      );
    });
  }

  removeHTMLMovie(target) {
    $(target).closest("tr").remove();
  }

  removeMovieFromList(selectedMovie) {
    const removingTitle = $(selectedMovie).closest("tr").find(".title").text();
    const newList = $.grep(this.movies, function (movie) {
      return movie.title !== removingTitle;
    });
    this.movies = newList;
  }

  clearHTMLList() {
    $(".movie").remove();
  }

  resetInputs() {
    $("#title").val("");
    $("#rating").val("");
  }
}

class Movie {
  constructor(title, rating) {
    this.addedOrder = this.getOrderNumber();
    this.title = $("#title").val();
    this.rating = $("#rating").val();
  }

  getOrderNumber() {
    if (movieList.movies.length === undefined) {
      return 1;
    } else {
      return movieList.movies.length + 1;
    }
  }
}

const movieList = new List();
