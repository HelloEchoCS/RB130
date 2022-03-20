factorial = Enumerator.new do |results|
  current_num = 0
  loop do
    if current_num < 2
      results << 1
    else
      results << (2..current_num).reduce(:*)
    end
    current_num += 1
  end
end

7.times { |_| p factorial.next }
3.times { |_| p factorial.next }
factorial.rewind
7.times { |_| p factorial.next }

# p factorial.take(7)
# p factorial.take(3)
# factorial.rewind
# p factorial.take(7)