import React from 'react';

class Weather extends React.Component{
  constructor(){
    super();
    navigator.geolocation.getCurrentPosition(this.setPos);
    this.state = {weather: ''};
  }
  setPos(geo){
    let lat = geo['coords']['latitude'];
    let lon = geo['coords']['longitude'];
    var request = new XMLHttpRequest();
    request.responseType = 'json';
    request.open('GET',`http://samples.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=bf7ce0bec1ca1a917f23885ce3ac6b0e`, true);
    request.onload = function(){
      if (request.status >= 200 && request.status < 400){
        var resp = request.responseText;
        this.setState({weather: resp});
        debugger
      } else{
        var error = request.responseText;
        console.log("Request Failure" + error);
      }
    };
    request.send();
  }

  render(){
    return(
      <div className="weather">
        <h1>weather</h1>
        <h1>{this.state.weather}</h1>
      </div>
    );
  }
}


export default Weather;


//bf7ce0bec1ca1a917f23885ce3ac6b0e

//http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=bf7ce0bec1ca1a917f23885ce3ac6b0e
