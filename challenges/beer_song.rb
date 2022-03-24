=begin
P
- generate lyrics of the beer song
E
- We need a `BeerSong` class with two class methods:
  - `verse` that takes one or two ints as arguments
    - returns specified verses:
    - if only one argument, return the specific line of verse
    - if two arguments, return verses between the numbers (include two numbers)
  - `lyrics` that returns all the lyrics
- each verse has a `\n` at the end.

D
- input: int
- output: string
A
- `verse` method:
  - for each verse: there are 3 nums contained inside:
    - first line: two same numbers indicated by the input num
    - second line: input num - 1
  - for 0 verse, return a specific one
=end

class BeerSong
  def self.verse(num)
    generate_verse(num).gsub(/\n\z/, "")
  end

  def self.verses(start, ending)
    result = ""
    start.downto(ending) do |line_num|
      result += generate_verse(line_num)
    end
    result.gsub(/\n\z/, "")
  end

  def self.lyrics
    self.verses(99, 0)
  end

  class << self
    private

    def generate_verse(num)
      before = "#{num} bottles"
      middle = "one"
      case num
      when 1
        before = "1 bottle"
        middle = "it"
        after = "no more bottles"
      when 2
        after = "1 bottle"
      else
        after = "#{num - 1} bottles"
      end

      return "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n" \
      "\n" if num == 0
      "#{before} of beer on the wall, #{before} of beer.\n" \
      "Take #{middle} down and pass it around, #{after} of beer on the wall.\n" \
      "\n"
    end
  end
end