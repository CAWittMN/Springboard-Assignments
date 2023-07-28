let baseUrl = "http://numbersapi.com";
let favNum = 3;

// 1.
$.getJSON(`${baseUrl}/${favNum}?json`).then((data) => console.log(data));

// 2.
let favNums = [3, 5, 7, 11];
$.getJSON(`${baseUrl}/${favNums}?json`).then((data) => console.log(data));

// 3.
Promise.all(
  Array.from({ length: 4 }, () => {
    return $.getJSON(`${baseUrl}/${favNum}?json`);
  })
).then((facts) => {
  facts.forEach((data) => $("#number-section").append(`<p>${data.text}</p>`));
});
