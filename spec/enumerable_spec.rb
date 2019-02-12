require('./lib/enumerable.rb')
include Enumerable

class MockObject
  attr_reader :variable, :other_variable
  def initialize variable = 'hello', other_variable = 'world'
    @variable = variable
    @other_variable = other_variable
  end
end

RSpec.describe Enumerable do
  describe "#my_each" do
    it "should access all element in given array" do
      counter = 0
      array = [1,2,3,4,5,6,7,8,9,10]
      array.my_each do |e|
        expect(e).to eql(array[counter])
        counter += 1
      end
      expect(counter).to eql(array.length)
    end

    it "should work with object data" do
      object_array = [MockObject.new, MockObject.new, MockObject.new]
      object_array.my_each do |e|
        expect(e.variable).to eql('hello')
        expect(e.other_variable).to eql('world')
      end
    end

  end
  describe "#my_each_with_index" do
    it "should get element by index" do
      array = [1,2,3,4,5,6,7,8,9,10]
      expect(array.my_each_with_index(0)).to eql(1)
    end

    it "should work with object data" do
      object_array = [MockObject.new('first','object'),
                      MockObject.new('second', 'object'),
                      MockObject.new('third', 'object')]
      expect(object_array.my_each_with_index(0).variable).to eql('first')
      expect(object_array.my_each_with_index(0).other_variable).to eql('object')
      expect(object_array.my_each_with_index(1).variable).to eql('second')
      expect(object_array.my_each_with_index(1).other_variable).to eql('object')
      expect(object_array.my_each_with_index(2).variable).to eql('third')
      expect(object_array.my_each_with_index(2).other_variable).to eql('object')
    end

    it "should return nil when index is not found" do
      array = [1,2,3,4,5,6,7,8,9,10]
      expect(array.my_each_with_index(999)).to eql(nil)
    end

    it "should return from the end of the array with backward when the index value is negative" do
      array = [1,2,3,4,5,6,7,8,9,10]
      counter = array.length - 1
      backward_counter = -1
      array.length.times do
        expect(array.my_each_with_index(backward_counter)).to eql(array[counter])
        counter -= 1
        backward_counter -= 1
      end
    end
  end

  describe "#my_select" do
    it "should return a new list that contains elements that matches with given block condition" do
      numbers = [1,2,3,4,5,6,7,8,9,10]
      even_numbers = numbers_array.my_select { |e| e.even? }
      expect(even_numbers).to be_an_instance_of(Array)
      expect(even_numbers).to eql([2,4,6,8,10])
    end
  end

  describe "#my_all?" do
    it "Should return a boolean" do
      array = [1,2,3,4,5,6,7,8,9,10]
      expect(array.my_all? {|e| e % 2 == 0 }).to be(true).or be(false)
    end

    it "Should return true if given condition matches with a Array" do
      array = [1,2,3,4,5,6,7,8,9,10]
      expect(array.my_all? {|e| e > 0 }).to eql(true)
    end

    it "Should return false if given condition doesn't match with a Array" do
      array = [1,2,3,4,5,6,7,8,9,10]
      expect(array.my_all? {|e| e < 0 }).to eql(false)
    end
  end


    describe "#my_any?" do
      it "Should return a boolean" do
        array = [1,2,3,4,5,6,7,8,9,10]
        expect(array.my_any? {|e| e % 2 == 0 }).to be(true).or be(false)
      end

      it "Should return true if any element provides given condition" do
        array = [1,2,3,4,5,6,7,8,9,-10]
        expect(array.my_any? {|e| e < 0 }).to eql(true)
      end

      it "Should return false if any element doesn't provide given condition" do
        array = [1,2,3,4,5,6,7,8,9,10]
        expect(array.my_any? {|e| e < 0 }).to eql(false)
      end
    end

    describe "#my_none?" do
      it "Should return a boolean" do
        array = [1,2,3,4,5,6,7,8,9,10]
        expect(array.my_none? {|e| e % 2 == 0 }).to be(true).or be(false)
      end

      it "Should return true if any element doesn't provides any condition" do
        array = [1,2,3,4,5,6,7,8,9,10]
        expect(array.my_none? {|e| e < 0 }).to eql(true)
      end

      it "Should return false if any element provides given condition" do
        array = [1,-2,3,4,5,-6,7,8,9,10]
        expect(array.my_none? {|e| e < 0 }).to eql(false)
      end
    end

end
