=begin
P
- return an octal, return the decimal
E
- Need an `Octal` class that defines two methods:
  - constructor
    - takes one string as an argument
  - `to_decimal`
    - returns the decimal counterpart of the given octal
- implicit rules:
  - if the input string is not an octal, return 0

D
- constructor:
  - store the input string to `@octal`
- to_decimal:
  - return 0 if `@octal` contains non-digit char
  - convert the string to num
  - initialize `power` to 0
  - break the num into digits, add each digit * 8 ** power, power increment by 1 each iteration
  - return the result
A
=end

class Octal
  def initialize(str)
    @octal = str
  end

  def to_decimal
    return 0 if @octal.match(/[^0-7]/)
    digits = @octal.to_i.digits
    (0..digits.count - 1).reduce(0) { |sum, power| sum + digits[power] * (8 ** power) }
  end
end