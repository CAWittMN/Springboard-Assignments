console.log("Let's get this party started!");

const addToTheParty = (res) => {};

async function getGif(keyword) {
  let response = await axios.get(
    `http://api.giphy.com/v1/gifs/search?q=${keyword}&api_key=MhAodEJIJxQMxW9XqxKjyXfNYdLoOIym`
  );
  console.log(response);
  return response.data;
}

$("#search").on("click", (event) => {
  event.preventDefault();
  let keyword = $("input").val();
  let gif = getGif(keyword);
  addToTheParty(gif);
});
