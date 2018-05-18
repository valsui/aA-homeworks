const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// reader.question("What is your name?", function (answer) {
//   console.log(`Hello ${answer}!`);
//
//   // Close the reader, which will allow the program to end because it
//   // is no longer waiting for any events.
//   reader.close();
// });

function teaAndBiscuits(callBack) {
  // Notice how nowhere do I return anything here! You never return in
  // async code. Since the caller will not wait for the result, you
  // can't return anything to them.

  reader.question("Would you like some tea?", function (teaResp) {
    console.log(`${teaResp}`);
    reader.question("Would you like some biscuits?", function (biscuitResp) {
      console.log(`${biscuitResp}`);
      const firstRes = (teaResp === 'yes') ? 'do' : 'don\'t';
      const secondRes = (biscuitResp === 'yes') ? 'do' : 'don\'t';

      // console.log(`So you ${tesResp} want tea and you ${biscuitRep} want biscuits.`);
      // reader.close();
      callBack(firstRes,secondRes);
    });
  });
}

// teaAndBiscuits()

teaAndBiscuits(function (firstRes,secondRes) {
  console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  reader.close();
});
