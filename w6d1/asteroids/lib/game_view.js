const{MovingObject} = require("./moving_object.js");

const canvasEl = document.getElementById("canvas");
canvasEl.height = window.innerHeight;
canvasEl.width = window.innerWidth;
const ctx = canvasEl.getContext("2d");

console.log(MovingObject);

const mo = new MovingObject({pos: [50,50], velocity: 50, radius: 50, color: '#ff0000' });
// mo.draw(ctx);
