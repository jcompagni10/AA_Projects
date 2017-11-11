function sum() {
  let values = Array.from(arguments);
  let sumVar = 0;

  values.forEach( function(el) { sumVar += el; });
  return sumVar;
}

// console.log(sum(5,5,5,5,5));


function sumRest(...args) {
  let sumVar = 0;

  args.forEach((el) => {
    sumVar += el;
});
  return sumVar;
}

// console.log(sumRest(5,5,5,5,5));

Function.prototype.myBind = function(context) {
  let args = Array.from(arguments).slice(1);
  let that = this;
  return function() {
    that.apply(context, args);
  };
};

Function.prototype.myBindRest = function(context, ...args) {


  return () => {
    this.call(context, ...args);
  };
};



function curriedSum(lim){
  let nums = [];
  let fxn = function(num){
    nums.push(num);
    if (nums.length === lim){
      return nums.reduce((acc, curr) => acc+curr);
    } else{
      return fxn;
    }
  };
  return fxn;
}




// let curryFxn = curriedSum(2);
// curryFxn(3);
// console.log(curryFxn(5));
//
// console.log(curriedSum(3)(2)(3)(7));


Function.prototype.myCurry = function(numArgs){
  let args = [];
  let baseFxn = this;
  let fxn = function(arg){
    args.push(arg);
    if (args.length === numArgs){
      return baseFxn(...args);
    } else {
      return fxn;
    }
  };
  return fxn;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

// sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.myCurry(3)(3)(2)(1));


















//
