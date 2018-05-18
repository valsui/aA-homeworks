// madLib
// Write a function that takes three strings - a verb, an adjective, and a noun - uppercases and interpolates them into the sentence "We shall VERB the ADJECTIVE NOUN". Use ES6 template literals.
//
// For example,
//
// > madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."

function madLib(verb, adj, noun){
  return `We shall ${verb} the ${adj} ${noun}.`;
}

// madLib('get','great','sleep')
// isSubstring
// Input
//
// A String, called searchString.
// A String, called subString.
// Output: A Boolean. true if the subString is a part of the searchString.
//
// > isSubstring("time to program", "time")
// true
//
// > isSubstring("Jump for joy", "joys")

function isSubstring(searchString, subString){
  return searchString.includes(subString);
}
// console.log('---should print true---')
// console.log(isSubstring("time to program", "time"))
// console.log('---should print false---')
// console.log(isSubstring("Jump for joy", "joys"))


// false
// Phase II - JS Looping Constructs
// Carry on! Know your loops!
//
// fizzBuzz
// 3 and 5 are magic numbers.
//
// Define a function fizzBuzz(array) that takes an array and returns a new array of every number in the array that is divisible by either 3 or 5, but not both.

function fizzBuzz(arr){
  var acc = [];
  return arr.reduce(function(acc, num){
    // console.log(acc);
    if (num % 5 === 0 || num % 3 === 0){
      acc.push(num);
    }
    return acc;
  }, acc);
}

// console.log(fizzBuzz([10,5,24,6, 1]))

// isPrime
// Define a function isPrime(number) that returns true if number is prime. Otherwise, false. Assume number is a positive integer.
//
// > isPrime(2)
// true
//
// > isPrime(10)
// false
//
// > isPrime(15485863)
// true
//
// > isPrime(3548563)
// false

function isPrime(num){
  if (num === 1){return false;}
  for(let i = 2; i < num; i++){
    if (num%i === 0){
      return false;
    }
  }
  return true;
}

// console.log(isPrime(2))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))
// sumOfNPrimes
// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the sum of the first n prime numbers. Hint: use isPrime as a helper method.
//
// > sumOfNPrimes(0)
// 0
//
// > sumOfNPrimes(1)
// 2
//
// > sumOfNPrimes(4)
// 17

function sumOfNPrimes(num){
  let sum = 0;
  let counter = 2;
  while (num > 0){
    if(isPrime(counter)){
      sum += counter;
      num --;
    }
    counter ++;
  }
  return sum;
}

console.log(sumOfNPrimes(0));
