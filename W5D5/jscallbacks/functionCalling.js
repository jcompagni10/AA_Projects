Function.prototype.myBind = function myBind(context){
  return (...arg) => this.apply(context, arg);
};

class Lamp {
  constructor() {
    this.name = "lamp";
  }
}

const turnOn = function(color, num) {
   console.log(`Turning on ${num} ${color} ` + this.name);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn("red", 1); // should say "Turning on a lamp"
myBoundTurnOn("red", 1); // should say "Turning on a lamp"
