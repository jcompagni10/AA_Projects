
const readline = require('readline');

reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft > 0){
    reader.question("Enter a number: ", function(result){
      let newNum = parseInt(result);
      sum += newNum;
      console.log(`subsum: ${sum}`);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  }
  else{
    reader.close();
    completionCallback(sum);
  }
}




addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
