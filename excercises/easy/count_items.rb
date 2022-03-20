# def count(arr)
#   count = 0
#   arr.each { |item| count += 1 if yield(item) }
#   count
# end

def recursive(arr, total, &block)
  return total if arr.empty?
  total += 1 if yield(arr[0])
  arr.shift
  return recursive(arr, total, &block)
end

def count(arr, &block)
  total = 0
  recursive(arr, total, &block)
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2