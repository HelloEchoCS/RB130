class CustomSet
  attr_reader :elements

  def initialize(arr=[])
    @elements = arr
  end

  def empty?
    elements.empty?
  end

  def contains?(el)
    elements.include?(el)
  end

  def subset?(set)
    set.elements.count == (elements + set.elements).uniq.count
  end

  def disjoint?(set)
    elements.none? { |el| set.contains?(el) }
  end

  def eql?(set)
    elements.uniq.sort == set.elements.uniq.sort
  end
  alias :== :eql?

  def add(int)
    CustomSet.new(elements << int)
  end

  def intersection(set)
    CustomSet.new(elements.select { |el| set.contains?(el) })
  end

  def difference(set)
    CustomSet.new(elements.select { |el| !set.contains?(el) })
  end

  def union(set)
    CustomSet.new(elements + set.elements)
  end
end