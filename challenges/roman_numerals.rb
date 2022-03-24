=begin
P
- convert decimal nums to Roman nums
- 1-I, 5-V, 10-X, 50-L, 100-C, 500-D, 1000-M
- 1-3s, 5-8s are addition
- 4s and 9s are substraction
- expressing each digit separately from left to right and skipping any zero

E
Need `RomanNumerals` class that defines two methods:
- constructor method
  - takes one integer
- `to_roman` method
  - returns the Roman equivalent as string

D
- input: int
- output: string

A
- constructor:
  - store the input integer
- to_roman
  - initialize `result` as empty string
  - divide integer into digits
  - count the number of digits: count
  - iterate over digits, for each digit:
    - if the digit is not zero, decide the Roman letter based on `count` and current digit
    - append the roman letter to `result`
    - decrease `count` by 1
- decide Roman letter
  - aquire from a hash:
  - { 1: [I, II, III, IV, V, VI, VII, VIII, IX]
      2: [X, XX, XXX, XL, L, LX, LXX, LXXX, XC]
      3: [C, CC, CCC, CD, D, DC, DCC, DCCC, CM]
      4: [M, MM, MMM]}

C
=end

class RomanNumeral
  ROMAN_LETTERS = { 1 => ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'],
                    2 => ['X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'],
                    3 => ['C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'],
                    4 => ['M', 'MM', 'MMM'] }

  def initialize(int)
    @number = int
  end

  def to_roman
    result = ""
    digits = @number.digits.reverse
    count = digits.count
    digits.each do |digit|
      result += ROMAN_LETTERS[count][digit - 1] unless digit.zero?
      count -= 1
    end
    result
  end
end