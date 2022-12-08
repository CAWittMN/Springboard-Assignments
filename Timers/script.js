const counter = document.getElementById("counter");
const count = document.getElementById("count");
const startButton = document.getElementById("start-button");

startButton.addEventListener("click", function () {
  startButton.classList.add("no-click");
  countDown(getCountDownSeconds());
});

function getCountDownSeconds() {
  return count.value;
}

function countDown(seconds) {
  counter.innerText = `${seconds}`;
  let timer = setInterval(function () {
    if (seconds > 0) {
      seconds--;
      counter.innerText = `${seconds}`;
    } else {
      clearInterval(timer);
      counter.innerText = "Done!";
      startButton.classList.remove("no-click");
    }
  }, 1000);
}

function randomGame() {
  let randomNumber
  let tries = 0;
  let timer = setInterval(function () {
    randomNumber = Math.random();
    tries++;
    console.log(`Random Number=${rnumber}    Attempt Number ${tries}`);
    if (rnumber > 0.75) {
      clearInterval(timer);
      console.log(
        `Succesful random number larger than .75 on attempt number ${tries}!`
      );
    }
  }, 1000);
}
