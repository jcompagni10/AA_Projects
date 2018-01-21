import React from 'react';
import {isEmpty, values} from 'lodash';
class BenchIndex extends React.Component{

  componentDidMount(){
  }

  allBenches(){
    return values(this.props.benches);
  }


  render(){
    if (isEmpty(this.props.benches)){
      return (<h1>Loading...</h1>);
    }
    return (
      <ul>
        {this.allBenches().map((bench)=>(
          <li key={bench.id}>{bench.description}</li>
        ))}
      </ul>
    );
  }
}

export default BenchIndex;
