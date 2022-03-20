items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do | *veggies, wheat|
#   puts veggies.join(", ")
#   puts wheat
# end

# gather(items) do | apples, *cc, wheat|
#   puts apples
#   puts cc.join(', ')
#   puts wheat
# end

# gather(items) do | apples, *others|
#   puts apples
#   puts others.join(', ')
# end

gather(items) do | apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end