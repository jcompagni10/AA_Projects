import {values} from 'lodash';

export default class MarkerManager {
  constructor(map){
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches){
    values(benches).forEach(bench=>{
      if (!this.markers[bench.id]){
        this.createMarkerFromBench(bench);
      }
    });
    // values(this.markers).forEach(marker=>{
    //   if (!benches[marker.id]){
    //     marker.setMap(null);
    //   }
    // });
  }


  createMarkerFromBench(bench){
    this.markers[bench.id] =
    new google.maps.Marker({
        position: ({lat:bench.lat, lng:bench.lng}),
        map: this.map,
        title: bench.description
      });
  }
}
