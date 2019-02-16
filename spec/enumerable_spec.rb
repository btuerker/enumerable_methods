require('./lib/enumerable.rb')
include Enumerable


RSpec.describe Enumerable do
  let(:array){[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
  describe "#my_each" do
    it "should access all element in given array" do
      counter = 0
      array.my_each do |e|
        expect(e).to eql(array[counter])
        counter += 1
      end
      expect(counter).to eql(array.length)
    end
  end

  describe "#my_each_with_index" do
    it "should return a new Hash with keys as indexes" do

      hash_with_index = array.my_each_with_index
      expect(hash_with_index).to be_instance_of(Hash)
      for i in 0...array.length
        expect(hash_with_index[i]).to eql(array[i])
      end
    end
  end

  describe "#my_select" do
    it "should return a new list that contains elements that matches with the given block condition" do
      even_numbers = array.my_select { |e| e.even? }
      expect(even_numbers).to be_an_instance_of(Array)
      expect(even_numbers).to eql([2, 4, 6, 8, 10])
    end
  end

  describe "#my_all?" do
    it "should return a boolean" do
      expect([1, 2, 3].my_all? { }).to be(true).or be(false)
    end

    it "should return true if each element matches with given condition" do
      expect(array.my_all? { |e| e > 0 }).to eql(true)
    end

    it "should return false if each element doesn't match with the given block condition" do
      numbers = [-3, -2, -1, 0, 1, 2, 3]
      expect(numbers.my_all? { |e| e > 0 }).to eql(false)
    end
  end


  describe "#my_any?" do
    it "Should return a boolean" do
      expect(array.my_any? { |e| e.even? }).to be(true).or be(false)
    end

    it "should return true if any element provides the given block condition" do
      numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, -10]
      expect(numbers.my_any? { |e| e < 0 }).to eql(true)
    end

    it "should return false if any element doesn't provide the given block condition" do
      expect(array.my_any? { |e| e < 0 }).to eql(false)
    end
  end

  describe "#my_none?" do
    it "should return a boolean" do
      expect(array.my_none? { |e| e.even? }).to be(true).or be(false)
    end

    it "should return true if any element doesn't provide the given block condition" do
      expect(array.my_none? { |e| e < 0 }).to eql(true)
    end

    it "should return false if any element provides the given block condition" do
      numbers = [-3, -2, -1, 0, 1, 2, 3]
      expect(numbers.my_none? { |e| e < 0 }).to eql(false)
    end
  end

  describe "#my_count" do
    it "should return 0 when array is empty" do
      empty_array = []
      expect(empty_array.my_count).to eql(0)
    end

    it "should return size of array" do
      expect(array.my_count).to eql(array.length)
    end
  end

  describe "#my_map" do
    it "should return a new array processed by the given block" do
      numbers = [1,2,3,4,5]
      numbers_powed = numbers.my_map { |e| e ** 2 }
      expect(numbers_powed).to be_instance_of(Array)
      expect(numbers_powed).to eql([1,4,9,16,25])
    end
  end

  describe "#my_inject" do
    it "should make calculation memoizated value" do
      numbers = [1,2,3,4,5]
      sum = numbers.my_inject(0) { |memo, e| memo + e }
      expect(sum).to eql(15)
      words = %w{ cat sheep bear }
      longest_word = words.my_inject("") { |memo, word| (memo.length > word.length)? memo : word }
      expect(longest_word).to eql('sheep')
    end
  end
end
