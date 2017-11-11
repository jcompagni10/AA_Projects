Function.prototype.inherits = function(parentClass) {
  this.prototype = Object.create(parentClass.prototype);
  // let Surrogate = function() {};
  // Surrogate.prototype = parentClass.prototype;
  // this.prototype = new Surrogate();
  this.prototype.constructor = Array;
  // console.log(this);

}

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);


function Asteroid () {}
Asteroid.inherits(MovingObject);

MovingObject.prototype.move = function() {
  console.log('Im moving!');
};

Ship.prototype.shoot = function() {
  console.log("I'm shooting");
}
let a = new Asteroid();
a.move();

let s = new Ship();
s.shoot();

console.log(s.__proto__);
//should fail
// a.shoot();

function Rock () {}
Rock.inherits(Asteroid);

let r = new Rock();
// console.log(typeof(r));
// console.log(a.__proto__);
// console.log(r.__proto__);
// console.log(Rock.prototype);
// console.log(Asteroid.prototype);
