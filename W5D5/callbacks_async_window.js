// Simple Timeout
// Let's write a simple setTimeout function!
//
// First, set a simple timeout for 5000 ms (use window.setTimeout). Pass in a callback function that calls alert('HAMMERTIME').
//
// Open up Chrome Devtools and copy your code into the console to test it. (Open a chrome window then press cmd + option + i. Press esc to show the console.)
//
// Note: while we're waiting for our timeout, we can still scroll around the website and interact with it normally. Is setTimeout synchronous or asynchronous?

setTimeout(function(){
  alert('HAMMERTIME');
}, 5000);


// Timeout Plus Closure
// Next, we are going to write a function hammerTime that takes in one argument - time. When the function is run, it should set a timeout on the window. Pass a callback to the timeout that creates an alert ${time} is hammertime!.
//
// Notice that the callback function closed over the time variable in the outer scope of hammerTime.
function hammerTime(time){
  setTimeout(function(){
    alert(`${time} HAMMERTIME`);
  }, 5000);
}
