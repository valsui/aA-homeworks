require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "Sheldon") }
  subject(:brownie) { Dessert.new('brownie',50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients.length).to be (0)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new('pie', '8', chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.add_ingredient("nuts").last).to eq("nuts")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      brownie.add_ingredient("cherry")
      brownie.add_ingredient("berry")
      brownie.add_ingredient("hair")
      brownie.add_ingredient("glue")
      pre_mix_array = brownie.ingredients.dup
      expect(brownie.mix!).not_to eql (pre_mix_array)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      before_eat = brownie.quantity
      expect(brownie.eat(5)).to eq (before_eat-5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ brownie.eat(100)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Sheldon the Great Baker")
      expect(brownie.serve).to include("Chef Sheldon the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      # exepect(brownie.make_more)
      brownie.make_more
    end
  end
end
