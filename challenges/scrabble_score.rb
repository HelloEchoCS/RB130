=begin
P
- calculate the socre for a given word base on different values of words
E
- Need a `Scrabble` class that defines two methods:
  - a constructor method that takes one string as an argument
  - a `score` method that returns an integer representing the score of the given word
  - a `score` class method that takes a string and return its score
  - implicit rules:
  - given word can be empty string or `nil`. Either cases scores are 0
  - given word can be whitespaces. They are all 0 points
  - case insensitive
D
- input: string
- output: int
- an array can be used to break down the word into chars and calculate the score

A
- constructor:
  - store the input string in `@word`
- `score` method:
  - initialize `score` to 0
  - break down @word into letters, and iterate through letters, for each letter:
    - calculate letter(in lowercase)'s score(helper method):
      - deal with edge cases:
        - if the letter is space or start with "\", return 0
      - look up the reference and determine the score
    - increment `score` by the score of current letter
  - return `score`
=end

class Scrabble
  REFERENCE = { 1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
                2 => ['d', 'g'],
                3 => ['b', 'c', 'm', 'p'],
                4 => ['f', 'h', 'v', 'w', 'y'],
                5 => ['k'],
                8 => ['j', 'x'],
                10 => ['q', 'z'] }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?
    result = 0
    @word.chars.each do |char|
      result += value(char)
    end
    result
  end

  def self.score(word)
    self.new(word).score
  end

  private

  def value(char)
    return 0 if char.match?(/\s/)
    REFERENCE.each do |k, v|
      return k if v.include?(char.downcase)
    end
  end
end