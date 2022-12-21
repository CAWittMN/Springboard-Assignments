const filterOutOdds = (...nums) => nums.filter((num) => num % 2 === 0);

const findMin = (...nums) => Math.min(...nums);

const mergeObjects = (objOne, objTwo) => ({ ...objOne, ...objTwo });

const doubleAndReturnArgs = (arr, ...args) => [
  ...arr,
  ...args.map((num) => num * 2),
];

const removeRandom = (items) => {
  let indx = Math.floor(Math.random() * items.length);
  return [...items.slice(0, indx), ...items.slice(indx + 1)];
};

const extend = (arrayOne, arrayTwo) => {
  return [...arrayOne, ...arrayTwo];
};

const addKeyVal = (obj, key, value) => {
  return { ...obj, [key]: value };
};

const removeKey = (obj, key) => {
  ({ [key]: undefined, ...obj } = obj);
  return obj;
};

const combine = (obj1, obj2) => {
  return { ...obj1, ...obj2 };
};

const update = (obj, key, val) => {
  return { ...obj, [key]: val };
};