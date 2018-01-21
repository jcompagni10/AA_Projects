import React from 'react';
import MarkerManager from '../../util/marker_manager';
class BenchMap extends React.Component{

  constuctor(){
    this.markerManger = null;
  }

  componentDidMount() {
  const mapOptions = {
    center: { lat: 37.7758, lng: -122.435 }, // this is SF
    zoom: 13
  };
  this.map = new google.maps.Map(this.mapNode, mapOptions);
  this.map.addListener("idle", this.updateBounds.bind(this));
  this.props.fetchBenches();
}

  updateBounds(){
    const bounds = {
      n: this.map.getBounds().getNorthEast().lat(),
      e: this.map.getBounds().getNorthEast().lng(),
      s: this.map.getBounds().getSouthWest().lat(),
      w: this.map.getBounds().getSouthWest().lng(),
    };
    this.props.updateBounds(bounds);
    this.props.fetchBenches();


  }

  componentWillReceiveProps({benches}){
    this.markerManger = new MarkerManager(this.map);
    this.updateMarkers(benches);
  }
  updateMarkers(benches){
    this.markerManger.updateMarkers(benches);
  }

  render(){
    return(
      <div id="map-container" ref={ map => this.mapNode = map }>A Map?</div>
    );
  }


}

export default BenchMap;
