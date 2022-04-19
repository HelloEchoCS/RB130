def make_sandwiches
  puts "I'm making a sandwich!"
  puts "Start with a slice of bread."
  yield if block_given?
  puts "Finish off with another slice of bread!"
  puts "Yum!"
end

make_sandwiches do
  puts "Spread Mustard."
  puts "Add Lettuce."
  puts "Add Sliced Ham."
  puts "Add Cheese."
  puts "Spread Mayo."
end

make_sandwiches do
  puts "Spread Peanut Butter."
  puts "Spread Jelly."
  puts "Add Sliced Banana."
end