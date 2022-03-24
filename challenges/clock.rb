=begin
P
- create a clock object
E
- we need a `Clock` class, with following methods:
  - class method `at`
  - constructor method
  - instance method `to_s`
  - instance method `+`
  - instance method `-`
  - instance method `==`
D
- class method `at`
  - instantiate a new `Clock` object, takes two arguments (hour, minute)
  - minute is optional, default to 0
  - return the object
- instance method `to_s`
  - convert hour to 2 digits
  - convert minute to 2 digits
  - combine them with ':'
  - output a string
- instance method `+`
  - takes one argument: minutes
  - divide minutes by 60, we get hours, we get remainder as minutes
  - add hours and minutes
  - divide hours by 24 and take the remainder as hour
  - divide minutes by 60 and take the remainder as minutes, then add 1 to hour if minutes >= 60
  - break until hour < 24 and minutes < 60
  - return the calling obj
- instance method `-`
  - takes one argument: minutes
  - divide minutes by 60, we get hours, we get remainder as minutes
  - substract hours and minutes
  - divide hours by 24, if remainder >= 0 take the remainder as hour
    - else take 24 + remainder as hour
  - divide minutes by 60, if minutes >= 0 take the remainder as minutes
    - else take 60 + remainder as minutes, then substract hours by 1
  - break until hour < 24 and minutes < 60
  - return the calling obj
- instance method `==`
  - compare both hours and minutes
=end

class Clock
  attr_accessor :h, :m

  def initialize(h, m)
    @h, @m = h, m
  end

  def self.at(h, m=0)
    new(h, m)
  end

  def +(minutes)
    self.h = (m + minutes % 60) >= 60 ? (h + 1 + minutes / 60) % 24 : (h + minutes / 60) % 24
    self.m = (m + minutes % 60) % 60
    self
  end

  def -(minutes)
    self.h = (m - minutes % 60) < 0 ? (h - 1 - minutes / 60) % 24 : (h - minutes / 60) % 24
    self.m = (m - minutes % 60) % 60
    self
  end

  def ==(other)
    h == other.h && m == other.m
  end

  def to_s
    "#{format(h)}:#{format(m)}"
  end

  def format(digit)
    return "0#{digit}" if digit.to_s.length == 1
    "#{digit}"
  end
end