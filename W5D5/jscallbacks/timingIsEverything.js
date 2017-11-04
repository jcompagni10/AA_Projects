class Clock {
  constructor() {
    // 1. Create a Date object.
    let time = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.h= time.getHours();
    this.m= time.getMinutes();
    this.s= time.getSeconds();
    // 3. Call printTime.
    this.printTime(this.h, this.m, this.s);

    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000, this.h, this.m, this.s);
  }

  printTime(h,m,s) {
    if (m< 10){
      m = '0' + m;
    }
    if (s< 10){
      s = '0' + s;s
    }
    if (h< 10){
      h = '0' + h;
    }
    console.log(`${h}:${m}:${s}`);
  }

  _tick(h, m, s) {
    // 1. Increment the time by one second.
    if (this.s < 59) {
      this.s++;
    } else {
      this.m++;
      this.s = 0;
    }
    if (this.m > 59){
      this.m = 0;
      this.h++;
    }
    if (this.h > 23){
      this.h = 0;
    }
    // 2. Call printTime.
    this.printTime(this.h, this.m, this.s);
  }
}

const clock = new Clock();






























// #
