=begin
P
- draw a diamond with the given letter as its widest point
E
- Need a `Diamond` class that contains a class method `make_diamond`
  - `make_diamond` takes a letter as an argument, which marks the widest point
  - each line ends with "\n"
  - width of each line increments by 2 until the widest line
D
- input: string
- output: diamond formed by strings
A
- decide the width and num of lines (should be the same)
- iterate (num of lines) times, for each time
  - draw the line then add it to the output string
- return the output string

- draw the line
  - first and last line are spaces with a single A
  - appending a "\n" at the end of line
  - each line has 3 sections:
    - space section + middle section + space section
      - space section: letter_distance - currnet line no. if it's <= letter_distance,
        other wise current line no. - letter_distance
      - middle section: letter + space + letter
        - first and last line: only letter A
        - space with: width - space section * 2 - 2
        - letter * 2
=end

# class Diamond
#   def self.make_diamond(letter)
#     letter_distance = ("A"..letter).count
#     if letter > "A"
#       letters = ("A"..letter).to_a + ("A"..letter).to_a.reverse
#       letters.delete_at(letter_distance)
#     else
#       letters = ["A"]
#     end
#     result = ""
#     1.upto(letter_distance * 2 - 1) do |num|
#       result << draw_line(num, letters[num - 1], letter_distance)
#     end
#     result
#   end

#   class << self
#     private

#     def draw_line(num, letter, letter_distance)
#       if num == 1 || num == letter_distance * 2 - 1
#         space_sec = " " * (letter_distance - 1)
#         line = space_sec + "A" + space_sec
#       elsif num > letter_distance
#         space_sec = " " * (num - letter_distance)
#         middle_spaces = " " * (letter_distance * 4 - (2 * num) - 3)
#         middle_sec = letter + middle_spaces + letter
#         line = space_sec + middle_sec + space_sec
#       else
#         space_sec = " " * (letter_distance - num)
#         middle_spaces = " " * (2 * num - 3)
#         middle_sec = letter + middle_spaces + letter
#         line = space_sec + middle_sec + space_sec
#       end
#       line << "\n"
#     end
#   end
# end

class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == "A"
    letters = ("A"..letter).to_a
    letter_count = letters.count
    width = letter_count * 2 - 1
    half = []
    letter_count.times do |num|
      half << middle_part(num, letters[num]).center(width) + "\n"
    end
    (half + half.reverse[1..letter_count - 1]).join
  end

  def self.middle_part(num, letter)
    str = ""
    (num * 2 + 1).times do |idx|
      if idx == 0 || idx == num * 2
        str << letter
      else
        str << " "
      end
    end
    str
  end
end