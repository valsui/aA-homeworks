octopus = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopus(array)
  array.each_with_index do |el,i|
    max_found = true
    array.each_with_index do |x,j|
      next if i == j
      max_found = false if el.length < x.length
    end
    return el if max_found == true
  end
end

puts "sluggish_octopus returns : #{sluggish_octopus(octopus)}"

# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.
def dominant_octopus(array)
  prc = Proc.new {|x,y| x.length <=> y.length}
  sorted = merge_sort(array, &prc)
  sorted.last
end

def merge_sort(array, &prc)
  return array if array.length <= 1

  mid = array.length / 2
  left = merge_sort(array.take(mid), &prc)
  right = merge_sort(array.drop(mid), &prc)
  merge(left,right, &prc)
end

def merge(left, right, &prc)
  sorted = []
  until left.empty? || right.empty?
    check = prc.call(left.first,right.first)
    if check <= 0
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

puts "dominant_octopus returns : #{dominant_octopus(octopus)}"

# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.
def clever_octopus(array)
  longest = array.first
  (1...array.length).each do |i|
    longest = array[i] if longest.length < array[i].length
  end
  longest
end

puts "clever_octopus returns : #{clever_octopus(octopus)}"
####----------DANCING OCTOPUS ------------------

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

#Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(step, array)
  index = 0
  array.each_with_index do |el, i|
    index = i if el == step
  end
  index
end

puts "slow dance returns : #{slow_dance("up", tiles_array)}"
puts "slow dance returns : #{slow_dance("right-down", tiles_array)}"
# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

def fast_dance(step)
  dance_steps = {
      "up" => 0,
      "right-up" => 1,
      "right"=> 2,
      "right-down" => 3,
      "down" => 4,
      "left-down" => 5,
      "left" => 6,
      "left-up" => 7
  }

  dance_steps[step]
end

puts "fast dance returns : #{fast_dance("up")}"
puts "fast dance returns : #{fast_dance("right-down")}"
