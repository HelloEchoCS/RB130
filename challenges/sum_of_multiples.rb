=begin
P
- given a series of nums (default 3 and 5 if not given) and a natural num, return the sum of
- all the multiples of these nums (not including the natural num)
E
- We need `SumOfMultiples` class that contains 3 methods
  - constructor that takes a series of nums
  - instance method `to` that takes an int
  - class method `to` that takes an int
- When we call the class method `to`, we are defaulting 3 and 5 as the series of nums

D
- input: a series of nums
- output: an int

A
- constructor:
  - save the arguments as an array `@nums`
- instance method `to` with an argument `limit`
  - initialize result to 0
  - iterate through the array @nums, for each num
    - starting from multiplier 1, for each iteration
      - see if num * multiplier is equal or greater than `limit`
        - if yes, add num * multiplier to the result
        - if not, break out of the loop
      - increment multiplier by 1
  - return the result
- class method `to`
  - same as invoking instance method `to` with an object created by passing in 3 and 5
=end

class SumOfMultiples
  def initialize(*nums)
    @nums = nums.empty? ? [3, 5] : nums
  end

  def to(limit)
    result = []
    @nums.each do |num|
      multiplier = 1
      loop do
        break if num * multiplier >= limit
        result << num * multiplier
        multiplier += 1
      end
    end
    result.uniq.sum
  end

  def self.to(limit)
    SumOfMultiples.new().to(limit)
  end
end