def a_method(arr)
  ele1, ele2, *raptors = arr
  yield(raptors)
end

a_method(['crow', 'finch', 'hawk', 'eagle']) do |raptors|
  puts raptors
end