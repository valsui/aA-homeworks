
=begin
Exercise 1
Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

  # Test Cases
  sum_to(5)  # => returns 15
  sum_to(1)  # => returns 1
  sum_to(9)  # => returns 45
  sum_to(-8)  # => returns nil

=end

def sum_to(num)
  #base case
  if num == 0
    return 0
  elsif num < 0
    return nil
  end
  #inductive case
  num + sum_to(num - 1)  
end

=begin
Exercise 2 - add_numbers
Write a function add_numbers(nums_array) that takes in an array of Fixnums and returns the sum of those numbers. Write this method recursively.

  # Test Cases
  add_numbers([1,2,3,4]) # => returns 10
  add_numbers([3]) # => returns 3
  add_numbers([-80,34,7]) # => returns -39
  add_numbers([]) # => returns nil

=end

def add_numbers(arr)
  #base case
  if arr.length <= 1
    return arr.first
  elsif arr.empty?
    return nil
  end
  #inductive_case
  arr[0] + add_numbers(arr[1..-1])
end

=begin
Exercise 3 - Gamma Function
Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.

  # Test Cases
  gamma_fnc(0)  # => returns nil
  gamma_fnc(1)  # => returns 1
  gamma_fnc(4)  # => returns 6
  gamma_fnc(8)  # => returns 5040
=end

def gamma_fnc(num)

  #base case
  if num == 1
    return 1
  elsif num < 1
    return nil
  end

  #inductive_case
  (num-1) * gamma_fnc(num-1)
end

=begin
Exercise 4 - Ice Cream Shop
Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.

  # Test Cases
  ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
  ice_cream_shop([], 'honey lavender')  # => returns false
=end
def ice_cream_shop(flavors, flavor)
  #base case
  return false if flavors.empty?
  #inductive_case
  flavors.pop == flavor || ice_cream_shop(flavors, flavor)
end


=begin
Exercise 5 - Reverse
Write a function reverse(string) that takes in a string and returns it reversed.

  # Test Cases
  reverse("house") # => "esuoh"
  reverse("dog") # => "god"
  reverse("atom") # => "mota"
  reverse("q") # => "q"
  reverse("id") # => "di"
  reverse("") # => ""
=end

def reverse(str)
  #base case
  return str if str.length <= 1
  #inductive_case
  str[-1] + reverse(str[0...-1])
end
