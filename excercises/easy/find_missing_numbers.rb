# def missing(arr)
#   result = []
#   arr[0].upto(arr[-1]) do |num|
#     result << num unless arr.include?(num)
#   end
#   result
# end

def missing(arr) # without using a block
  result = []
  current = arr[0]
  while current < arr[-1]
    result << current unless arr.include? current
    current += 1
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []