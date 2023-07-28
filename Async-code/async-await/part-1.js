let baseUrl = "http://numbersapi.com";
let favNum = 3;

// 1.
async function getFavNum() {
  let data = await $.getJSON(`${baseUrl}/${favNum}?json`);
  console.log(data);
}
getFavNum();

// 2.
let favNums = [3, 5, 7, 11];
async function getFavNums() {
  let data = await $.getJSON(`${baseUrl}/${favNums}?json`);
  console.log(data);
}
getFavNums();

// 3.
async function postFacts() {
  let facts = await Promise.all(
    Array.from({ length: 4 }, () => {
      return $.getJSON(`${baseUrl}/${favNum}?json`);
    })
  );
  facts.forEach((data) => $("#number-section").append(`<p>${data.text}</p>`));
}
postFacts();
