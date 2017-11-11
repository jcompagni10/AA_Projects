import React from 'react';

class Clock extends React.Component{
  constructor(){
    super();
    this.state = {time: new Date()};
  }

  componentDidMount(){
    setInterval(this.tick.bind(this), 1000);
  }

  tick(){
    let time = this.state.time;
    time.setSeconds(time.getSeconds() +1);
    this.setState({time});
  }
  render(){
    return(
      <div id="clock">
        <h1> Clock</h1>
        <div className ="clock-content">
          <ul className="clock-labels">
            <li>Time:</li>
            <li>Date:</li>
          </ul>
          <ul className="clock-data">
            <li>{this.state.time.toTimeString().split(' ')[0]} PDT</li>
            <li>{this.state.time.toDateString()}</li>
          </ul>
        </div>
      </div>
    );
  }
}

export default Clock;
