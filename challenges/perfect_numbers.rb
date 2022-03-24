=begin
P
- determine whether the given num is perfect, abundant or deficient
E
- Nee a `PerfectNumber` class that has one class method `classify`:
  - the method takes one int as an argument
  - if the int is equal to or less than 0, raises StandardError
  - otherwise, return the type of the number
- noted that divisor does not include the num itself
D
- input: int (can be negative)
- output: string
- might need an array to store all divisors of the input int
A
- raises StandardError if the input int is equal to or less than 0
- initialize an array to []
- iterate through 1 to the input num - 1
  - if input num can be divided by current num with no remainder, add current num to the array
- compare the sum of all numbers in the array and the input num then output the type (helper method)
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError if num <= 0
    arr = []
    1.upto(num - 1) do |div|
      arr << div if num % div == 0
    end
    determine_type(num, arr.sum)
  end

  class << self
    private

    def determine_type(num, sum)
      return 'perfect' if num == sum
      return 'abundant' if num < sum
      'deficient'
    end
  end
end