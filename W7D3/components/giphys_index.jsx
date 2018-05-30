import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = (props) => (
  <ul>
    {props.giphys.map((gif) => (<GiphysIndexItem key={gif.id} gif={gif}/>))}
  </ul>
);

export default GiphysIndex;
