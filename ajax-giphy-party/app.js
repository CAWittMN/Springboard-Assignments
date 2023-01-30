// adds the chosen gif to the HTML
const addToTheParty = (gifUrl) => {
  const $gifContainer = $("#gifs");
  const $newGifBox = $("<div>", { class: "gif-box" });
  const $newGif = $("<img>", { src: gifUrl, class: "gif" });

  $newGifBox.append($newGif);
  $gifContainer.append($newGifBox);
};

// makes an ajax call to return a gif
async function getGif(keyword) {
  let response = await axios.get("http://api.giphy.com/v1/gifs/search", {
    params: {
      q: keyword,
      api_key: "MhAodEJIJxQMxW9XqxKjyXfNYdLoOIym",
    },
  });

  return response.data;
}

// chooses a random gif from the results
const chooseSingleGif = (res) => {
  const numOfGifs = res.data.length;
  const randomIndex = Math.floor(Math.random() * numOfGifs);

  return res.data[randomIndex].images.original.url;
};

// handle for submission which calls for a request, gif placement, and clears form
$("#gif-search").on("submit", async (event) => {
  event.preventDefault();

  const keyword = $("input").val();
  $("input").val("");

  let gifResponse = await getGif(keyword);
  let chosenGif = chooseSingleGif(gifResponse);
  addToTheParty(chosenGif);
});

//clears all gifs
$("#clear-all").on("click", () => $("#gifs").empty());
