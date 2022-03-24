=begin
P
- generate non-repeat robot names
E
- we need a `Robot` class, which contains three methods:
- initialize:
  - generate random names
- name:
  - retrive @name
- reset:
  - call initialize to generate a new, non-repeatable name

D
- input: n/a
- ouput: string
- a class variable - array of strings - to track all robots' names
A
- constructor:
  - generate first two letters
    - generate one random digit from 0-25 twice
  - generate last four digits
  - compare the name to the tracker, if it exists, generate another one until it's not existed in the tracker
  - add the name to the tracker
- reset
  - call the constructor
=end

class Robot
  ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  attr_reader :name
  @@names = []

  def initialize
    loop do
      letters = ALPHABET[rand(0..25)] + ALPHABET[rand(0..25)]
      numbers = rand(100..999)
      @name = letters + numbers.to_s
      break unless @@names.include?(@name)
    end
    @@names << @name
  end

  def reset
    initialize
  end
end