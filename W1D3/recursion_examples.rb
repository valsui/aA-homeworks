#write uopcase to updace a string assuming that you can only upcase one letter at a time
def upcase(str)
  #base case object
  return str.upase if str.length == 1
  #inductive step
  str[0].upcase + upcase(str[1...-1])
end

#write reverse assuming that it only works on part of a string
# logic is that you append the last letter to the reversed substring
def reverse(str)
  #base case
  return str if str.length <= 1
  #inductive step
  string[-1] + reverse(str[0..-2])
end

# ruby.sort uses quick sort
def quick_sort(arr)
  #base case
  return arr if arr.length <= 1
  #inductive case
  pivot = [arr[0]] # add array to array
  left_side = arr[1..-1].select { |el| el <= arr[0]}
  right_side = arr[1..-1].select { |el| el >= arr[0]}
  quick_sort(left_side) + pivot + quick_sort(right_side)
end


def fibonacci(n)
  case n
  when 1
    [1]
  when 2
    [1, 1]
  else
    if n < 0
      return []
    else
    # uh-oh. calls the same method!
    fibonacci(n-1) + [fibonacci(n-1)[n-2] + fibonacci(n-1)[n-3]]
    end
  end
end
