import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import * as APIUtil from './util/api_util'
// import { receiveSearchGiphys } from './actions/giphy_actions'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();

  // window.fetchSearchGiphys = APIUtil.fetchSearchGiphys;
  // window.store = store;

  ReactDOM.render(<Root store={store} />, root);

})
