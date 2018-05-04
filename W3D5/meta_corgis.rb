class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end


class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id

    snack_box.methods.grep(/^get_(.*)_info$/) { MetaCorgiSnacks.define_snack $1 }
  end

  #   Using a method_missing instance method, re-factor CorgiSnacks into the new MetaCorgiSnacks class to DRY things up!
  # Hint: Within #method_missing use #send to call methods on your @snack_box. You can interpolate to get the method name, and then pass the method name to #send
  # Review the metaprogramming reading if you need a reminder on how to use #send.

  # def method_missing(name, *args)
  #   # Your code goes here...
  #   method_info = "get_#{name}_info"
  #   method_tastiness = "get_#{name}_tastiness"
  #   valids = ["treat", "bone", "kibble"]
  #   if valids.include?(name.to_s)
  #     info = @snack_box.send(method_info, @box_id)
  #     tastiness = @snack_box.send(method_tastiness, @box_id)
  #     result = "Treat: #{info}: #{tastiness} "
  #     tastiness > 30 ? "* #{result}" : result
  #   else
  #     super
  #   end
  # end

  #
  # Comment out the MetaCorgiSnacks#method_missing instance method from the previous phase.
  # Write a new class method called ::define_snack that uses ::define_method to dynamically build each of the snack methods (bone, kibble, and treat) on the CorgiSnacks class.
  # Once again, you'll want to use #send to call the right methods on the @snack_box. This will look basically like Phase 1.

  def self.define_snack(name)
    define_method(name) do
      method_info = "get_#{name}_info"
      method_tastiness = "get_#{name}_tastiness"
      valids = ["treat", "bone", "kibble"]
      if valids.include?(name.to_s)
        info = @snack_box.send(method_info, @box_id)
        tastiness = @snack_box.send(method_tastiness, @box_id)
        result = "Treat: #{info}: #{tastiness} "
        tastiness > 30 ? "* #{result}" : result
      else
        "method missing"
      end
    end
  end
end
