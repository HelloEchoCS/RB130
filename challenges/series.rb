=begin
P
- given a string of digits, return all the consecutive digits given a specific length
E
- We need a `Series` class that contains two methods:
  - constructor method that takes one string of digits as an argument
  - `slices` instance method that takes an int as an argument
    - return an array of possible digit series given the length
    - each digit series are wrapped within an array
    - if given length is greater than the length of the string, raise ArgumentError
D
- input: string
- output: array or ArgumentError
A
- constructor:
  - store the input string as @input

- `slices`
  - raise ArgumentError if length > @input.length
  - initialize result array = []
  - start from the first digit, iterate until start+length is beyond the length of the input string
    - slice the string, break it into the array of ints, then add it into the result array
    - increment start point by 1
  - return the result array
=end

class Series
  def initialize(str)
    @input = str
  end

  def slices(length)
    raise ArgumentError if length > @input.length
    result = []
    start, distance = 0, length - 1
    while start + distance < @input.length
      result << @input[start..start + distance].chars.map(&:to_i)
      start += 1
    end
    result
  end
end