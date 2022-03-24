=begin
P
- calculate the hamming distance given two DNA strands
- rules
  - the hamming distance is the number of point mutations between two strands
  - "mutation" means different nucleic acid (GCAT)
  - only calculate two stands in equal length. If different, compare over the shorter length
  - distance is 0 if two stands are the same or empty
E
- Need a `DNA` class that contains two methods:
  - constructor method that takes one argument (strand A)
    - argument can be empty string
  - `hamming_distance` method that takes one argument (strand B)
    - compare strand A vs strand B to calculate the distance
    - argument can be empty string

D
- input: string
- output: int
A
- constructor:
  - store the strand A (can be empty)
- hamming_distance:
  - return 0 if strand A is the same as strand B
  - initiate distance to 0
  - choose the shorter strand and iterate over its chars:
    - compare the char with the char at the same location in another strand
    - if not the same, increment distance by 1
    - if the same, go to the next iteration
  - return the distance
C
=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    return 0 if @strand == other_strand
    distance = 0
    if @strand.length <= other_strand.length
      shorter_strand, longer_strand = @strand.chars, other_strand.chars
    else
      shorter_strand, longer_strand = other_strand.chars, @strand.chars
    end
    shorter_strand.each_with_index do |char, idx|
      distance += 1 unless char == longer_strand[idx]
    end
    distance
  end
end