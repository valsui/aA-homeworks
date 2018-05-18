function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

console.log('----- method style ------');
Noodles.chase(Markov);
console.log('----- with call------');
Noodles.chase.call(Markov, Noodles);
console.log('------with apply-------');
Noodles.chase.apply(Markov, [Noodles]);
