=begin
P
- determine whether a triangle is equilateral, isosceles or scalene
- rules:
  - each length must be >0
  - sum of the lengths of any two sides must > the other side
  - equilateral: all three sides are equal in length
  - isosceles: two sides are equal
  - scalene: all three sides are different in length
  - raise ArgumentError if it's not a triangle when instantiating a triangle object
E
- Need a `Triangle` class that has two methods:
  - a constructor method that takes three arguments
    - raises an error when the triangle is not valid
  - a `kind` method
    - return the type of the triangle

D
- input: ints(lengths of three sides)
- output: string(the type of the triangle(if it's a vaild one))

A
- validate the triangle, raises ArgumentError if not valid
  - raises error if any of the lengths <= 0
  - raises error if the sum of any two sides <= the third
- output the type of the triangle based on lengths of three sides
  - if all three are equal, return equilateral
  - if all three are different, return scalene
  - else return isosceles

C
=end

class Triangle
  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    raise ArgumentError unless valid?
  end

  def kind
    return "equilateral" if [@side1, @side2, @side3].uniq.count == 1
    return "scalene" if [@side1, @side2, @side3].uniq.count == 3
    "isosceles"
  end

  private

  def valid?
    return false if [@side1, @side2, @side3].any? { |side| side <= 0 }
    @side1 + @side2 > @side3 && @side1 + @side3 > @side2 && @side2 + @side3 > @side1
  end
end