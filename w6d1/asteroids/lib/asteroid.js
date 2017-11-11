const Util = require('./util.js');
const {MovingObject} = require('./moving_object.js');
console.log(Util);

const Asteroid = function(pos) {
  const params = {color: 'purple',
  radius: 25,
  pos: pos,
  velocity: Util.randomVec(10)};

  // this.super(params);
  MovingObject.call(this, params);

};

Util.inherits(Asteroid, MovingObject);

// Asteroid.prototype.constructor = function(pos) {
//
// };


let a = new Asteroid([1,1]);
console.log(a);

module.exports = {Asteroid};
