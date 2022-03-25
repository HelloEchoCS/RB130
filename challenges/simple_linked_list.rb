class Element
  attr_reader :datum, :next

  def initialize(obj, pointing_obj=nil)
    @datum, @next = obj, pointing_obj
  end

  def tail?
    self.next.nil? ? true : false
  end
end

class SimpleLinkedList
  attr_reader :elements

  def self.from_a(arr)
    return new if arr.nil? || arr.empty?
    arr.reverse.each_with_object(new) { |el, list| list.push(el) }
  end

  def initialize
    @elements = []
  end

  def size
    elements.size
  end

  def empty?
    elements.empty?
  end

  def push(obj)
    elements << Element.new(obj, head)
  end

  def peek
    empty? ? nil : head.datum
  end

  def head
    elements.last
  end

  def pop
    elements.pop.datum
  end

  def to_a
    elements.map(&:datum).reverse
  end

  def reverse
    self.class.from_a(self.to_a.reverse)
  end
end