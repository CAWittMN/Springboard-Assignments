console.log("Let's get this party started!");

const getGif = () => {
  const keyword = $("input").val();
  const response = sendRequest(keyword);
  console.log(response);
};
async function sendRequest(keyword) {
  const response = await axios.get(
    `http://api.giphy.com/v1/gifs/search?q=${keyword}&api_key=MhAodEJIJxQMxW9XqxKjyXfNYdLoOIym`
  );
  return response;
}

$("#search").on("click", (event) => {
  event.preventDefault();
  getGif();
});
