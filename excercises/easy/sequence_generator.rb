def step(start, ending, increment)
  while start <= ending
    yield(start)
    start += increment
  end
  nil
end

p step(1, 10, 3) { |value| puts "value = #{value}" }