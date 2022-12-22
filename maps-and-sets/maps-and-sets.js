//1. It returs a set = {1, 2, 3, 4}

//2. it returns a string = "ref"

/*3.
  0: {Array(3) => true}
  1: {Array(3) => false}
*/

const hasDuplicates = (arr) => new Set(arr).size !== arr.length;

const vowelCount = (str) => {
  const vowelMap = new Map();
  for (const letter of str) {
    let lowerCaseLetter = letter.toLowerCase();
    if ("aeiou".includes(lowerCaseLetter)) {
      vowelMap.has(lowerCaseLetter)
        ? vowelMap.set(lowerCaseLetter, vowelMap.get(lowerCaseLetter) + 1)
        : vowelMap.set(lowerCaseLetter, 1);
    }
  }
  return vowelMap;
};
