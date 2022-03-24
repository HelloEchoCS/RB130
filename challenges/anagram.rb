=begin
P
- find all anagrams for a word given a series of candidates
E
- Need an `Anagram` class with two methods:
  - constructor method that takes one string argument
  - `match` method that takes an array of strings and return all anagrams in an array
- implicit rules:
  - return [] if no anagram was found
  - words within the result array should be sorted
  - case insensitive
  - result array doesn't include the original word
D
- input: string
- output: array of strings

A
- constructor:
  - store the input string as the original word
- `match` method:
  - initialize the result array to []
  - iterate through the input array, for each word:
    - turn both words into lower case
    - next if origianl word and current word are the same
    - break both origianl and current word into chars
    - sort both original and current word
    - compare them and see if they are the same:
      - if yes, add the current word to the result array
  - return the result array sorted
=end

class Anagram
  def initialize(word)
    @origianl_word = word
  end

  def match(arr)
    result = []
    arr.each do |word|
      next if @origianl_word.downcase == word.downcase
      result << word if @origianl_word.downcase.chars.sort == word.downcase.chars.sort
    end
    result.sort
  end
end