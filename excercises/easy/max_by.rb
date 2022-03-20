def max_by(arr)
  max_item, max_value = nil
  arr.each do |item|
    if max_value.nil? || max_value < yield(item)
      max_value = yield(item)
      max_item = item
    end
  end
  max_item
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil