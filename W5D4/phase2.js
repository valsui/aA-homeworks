// Phase I: Callbacks
// Write a function titleize that takes an array of names and a function (callback). titleize should use Array.prototype.map to create a new array full of titleized versions of each name - titleize meaning "Roger" should be made to read "Mx. Roger Jingleheimer Schmidt". Then pass this new array of names to the callback, which should use Array.prototype.forEach to print out each titleized name.
//
// > titleize(["Mary", "Brian", "Leo"], printCallback);
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined

function titleize(arr, callback){
  mapped = arr.map(function(name){
    return `Mx. ${name} Jingleheimer Schmidt`
  });
  callback(mapped);
}

function cb(arr){
  arr.forEach( x => console.log(x));
}

//titleize(["Mary", "Brian", "Leo"], cb);

//Phase II: Constructors, Prototypes, and this
// First write a constructor function for an elephant. Each elephant should have a name, height (in inches), and array of tricks in gerund form (e.g. "painting a picture" rather than "paint a picture").
//
// Next write a few prototype functions that will be shared among all elephants:
//
// Elephant.prototype.trumpet: should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
// Elephant.prototype.grow: should increase the elephant's height by 12 inches
// Elephant.prototype.addTrick(trick): add a new trick to their existing repertoire
// Elephant.prototype.play: print out a random trick, e.g. "(name) is (trick)!"
// Hint: look up some JS Math methods!

function Elephant(name, height, tricks){
  this.name = name,
  this.height = height,
  this.tricks = tricks
}

Elephant.prototype.trumpet = function(){
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`)
};

Elephant.prototype.grow = function(){
  return this.height += 12;
};

Elephant.prototype.addTrick = function(trick){
  this.tricks.push(trick);
  return this.tricks;
};

//returns int from 1...max exclusive
function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

Elephant.prototype.play = function(){
  trick = this.tricks[getRandomInt(this.tricks.length)];
  console.log(`${name} is ${trick$}!`)
};

//Phase III: Function Invocation
let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant){
  console.log(`${elephant.name} is trotting by!`)
};

herd.forEach(name => Elephant.paradeHelper(name));


//Phase IV: Closures
// Let's make a function dinerBreakfast. Ultimately, we want it to return an anonymous closure, which we will be able to use to keep adding breakfast foods to our initial order.
//
// > let bfastOrder = dinerBreakfast();
// "I'd like cheesy scrambled eggs please"
// > bfastOrder("chocolate chip pancakes");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
// > bfastOrder("grits");
// "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."

let dinerBreakfast = function(){
  let order = 'I\'d like cheesy scrambled eggs';


  return function orderFood(food){
    if(food){
      order +=' and ' + food;
    }else{
      order;
    }
    console.log(order + ' please.');
  }
}

let test = dinerBreakfast();
test("");
test('pancakes');
test('butter')
