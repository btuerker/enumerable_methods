require('./lib/enumerable.rb')
include Enumerable
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
  end
  describe "#my_each_with_index" do
    it "should get element by index" do
      array = [1,2,3,4,5,6,7,8,9,10]
      expect(array.my_each_with_index(0)).to eql(1)
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
end
