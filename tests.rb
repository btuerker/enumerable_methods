require './enumarable.rb'
include Enumarable


def multiply_els(arr)
  result = 1
  arr.each { |e| result *= e }
  return result
end

puts "my_each test case: "
[1,2,3].my_each { |e| print "#{e} " }
puts

puts "my_each_with_index test case"
puts [1,2,3].my_each_with_index(1)

puts "my_select test case: "
print [1,2,3,4,5,6,7,8,9,10].my_select { |e| e % 2 == 0 }
puts
puts "another my_select test case: "
print [1,2,3,4,5,6,7,8,9,10].my_select { |e| e % 2 != 0 }
puts

print "my_all test case: "
if [1,2,3,4,5,6].my_all? { |e| e <= 5 }
  puts "true"
else
  puts "false"
end

print "my_all test case: "
if [2,4,6,8,10].my_all? { |e| e % 2 == 0 }
  puts "it's all even"
else
  puts "it contains odd number"
end

print "my_all test_case: "
if [2,3,6,8,10].my_all? { |e| e % 2 == 0 }
  puts "it's all even"
else
  puts "it contains odd number"
end

print "Test my_any: "
if [2,3,6,8,10].my_any? { |e| e % 2 == 0 }
  puts "it contains even number"
else
  puts "it doesn't contain even number"
end

print "Test my_any: "
if [5,3,7,9,11].my_any? { |e| e % 2 == 0 }
  puts "it contains even number"
else
  puts "it doesn't contain even number"
end

print "Test my_none : "
if [5,3,7,9,11].my_any? { |e| e == 0 }
  puts "it contains zero number"
else
  puts "it doesn't contain zero number"
end

print "Test my_none: "
if [5,0,7,0,11].my_any? { |e| e == 0 }
  puts "it contains zero number"
else
  puts "it doesn't contain zero number"
end

print "Test my_count: "
puts [5,0,7,0,11].my_count
print "Test my_count: "
puts [5,0,7,0,11,33,54].my_count

print "Test my_map: "
print [5,0,7,0,11,33,54].my_map { |x| x * 3 }
puts

print "Test my_inject summification: "
print "[5,0,7,0,11,33,54] sum each others : "
puts [5,0,7,0,11,33,54].my_inject(0) { |sum, x| sum + x }

puts "Test my_inject multiplication: "
print "[5,0,7,0,11,33,54] multiply each others : "

puts [5,1,7,2,11,33,54].my_inject(1) { |multiply, x| multiply * x }

print "compare my_inject with simple multiply_els function :"
puts multiply_els([5,1,7,2,11,33,54])

print "Test my_inject substraction: "
puts [5,1,7,2,11,33,54].my_inject(1) { |subs, x| subs -= x }

longest =  %w{ cat sheep bear }.inject do |memo, word|
  memo.length > word.length ? memo : word
end

puts longest

multiply_by_3_proc = Proc.new { |x| x * 3 }
multiply_by_10_proc = Proc.new { |x| x * 10 }

print "Test my_map: "
print [5,0,7,0,11,33,54].my_map(multiply_by_3_proc)
puts

print "Test my_map: "
print [5,0,7,0,11,33,54].my_map(multiply_by_10_proc)
puts

print "Test with both block and proc"
print [5,0,7,0,11,33,54].my_map(multiply_by_10_proc) { |x| x * 3 }



