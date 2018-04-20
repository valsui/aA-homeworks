require 'byebug'
# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: assign(key, value), lookup(key), remove(key), show. Note that the assign method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

class Map

  def initialize
    @map = []
  end

  def assign(key, val)
    if lookup(key).nil?
      @map.push([key,val])
    else
      byebug
      idx = @map.find_index {|x| x.first == key}
      @map[idx] = [key, val]
    end
    @map
  end

  def lookup(key)
    @map.select {|pair| pair.first == key}.first
  end

  def remove(key)
    @map.delete_if {|pair| pair.first == key}
  end

  def show
    @map
  end

end
