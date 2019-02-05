require './enumarable.rb'
include Enumarable



puts "my_each test case"
[1,2,3].my_each { |e| puts "#{e}" }

puts "my_each_with_index test case"
puts [1,2,3].my_each_with_index(1)

puts "my_select test case"
puts [1,2,3,4,5,6,7,8,9,10].my_select { |e| e % 2 == 0 }
puts [1,2,3,4,5,6,7,8,9,10].my_select { |e| e % 2 != 0 }

puts "my_all test case"
if [1,2,3,4,5,6].my_all? { |e| e <= 5 }
  puts "true"
else
  puts "false"
end

if [2,4,6,8,10].my_all? { |e| e % 2 == 0 }
  puts "it's all even"
else
  puts "it contains odd number"
end

if [2,3,6,8,10].my_all? { |e| e % 2 == 0 }
  puts "it's all even"
else
  puts "it contains odd number"
end

puts "Test my_any"
if [2,3,6,8,10].my_any? { |e| e % 2 == 0 }
  puts "it's contains even number"
else
  puts "itn't contains even number"
end

puts "Test my_any"
if [5,3,7,9,11].my_any? { |e| e % 2 == 0 }
  puts "it's contains even number"
else
  puts "itn't contains even number"
end


puts "Test my_none"
if [5,3,7,9,11].my_any? { |e| e == 0 }
  puts "it's contains zero number"
else
  puts "itn't contains zero number"
end

puts "Test my_none"
if [5,0,7,0,11].my_any? { |e| e == 0 }
  puts "it's contains zero number"
else
  puts "itn't contains zero number"
end

puts "Test my_count"
puts [5,0,7,0,11].my_count
puts [5,0,7,0,11,33,54].my_count

puts "Test my_map"
puts [5,0,7,0,11,33,54].my_map {|x| x*3 }

puts "Test my_inject"
puts [5,0,7,0,11,33,54].my_inject {|x| x ** 2 }
