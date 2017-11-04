const readline = require('readline');

reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question(`yes or no? ${el1} > ${el2}`, function (answer) {
    if (answer === 'yes') {
      callback(true);
    } else {
      callback(false);
    }

  });

}
// askIfGreaterThan(5, 1, callback => console.log(callback));



function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    let igt = function isGreaterThan(result){
      if (result){
        let temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        i++;
        innerBubbleSortLoop(arr, i, true, outerBubbleSortLoop);
      } else{
        i++;
        innerBubbleSortLoop(arr, i, false, outerBubbleSortLoop);
      }
    };
    askIfGreaterThan(arr[i], arr[i + 1], igt);
  } else {
    outerBubbleSortLoop(madeAnySwaps);
  }

}

// innerBubbleSortLoop([2,3,1,4], 0, false);

function absurdBubbleSort(arr, sortCompletetionCallback){
  const oBSL = function outerBubbleSortLoop(madeAnySwaps){
    if (madeAnySwaps){
      innerBubbleSortLoop(arr, 0, false, oBSL);
    } else{
      sortCompletetionCallback(arr);
    }
  };
  oBSL(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
