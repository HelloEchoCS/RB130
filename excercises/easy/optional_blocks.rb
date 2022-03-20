def compute(arg)
  return yield(arg) if block_given?
  "Does not compute."
end

p compute(3) { |num| 5 + num } == 8
p compute('b') { |str| 'a' + str } == 'ab'
p compute('hello') == 'Does not compute.'