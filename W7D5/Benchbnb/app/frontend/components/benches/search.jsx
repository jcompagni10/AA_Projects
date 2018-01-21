import React from 'react';
import BenchMap from './BenchMap';
import BenchIndex from './BenchIndex';

export default ({benches, fetchBenches, updateBounds})=>(
  <div>
    <BenchMap benches = {benches} updateBounds ={updateBounds} fetchBenches = {fetchBenches}/>
    <BenchIndex benches = {benches} fetchBenches = {fetchBenches}/>
  </div>
);
