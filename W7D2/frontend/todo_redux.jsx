import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  //PHASE 1:
  // const addLoggingToDispatch = (store) => {
  //   const dispatch = store.dispatch;
  //   return (action) => {
  //     console.log(store.getState());
  //     console.log(action);
  //     dispatch(action);
  //     console.log(store.getState());
  //   }
  // }
  //
  // store.dispatch = addLoggingToDispatch(store);

  const addLoggingToDispatch = (store) => {
    return (next) => {
      return (action) => {
        console.log(store.getState());
        console.log(action);
        dispatch(action);
        console.log(store.getState());
      }
    }
  };


  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

//
// Log store.getState() - this is the old state
// Log the action
// Call your local copy of store.dispatch, passing it the action
// Log store.getState() again - this is the new state
