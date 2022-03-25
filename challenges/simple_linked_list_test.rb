require 'minitest/autorun'

require_relative 'simple_linked_list'

class LinkedListTest < Minitest::Test
  def test_element_datum
    element = Element.new(1)
    assert_equal 1, element.datum # value of Element obj
  end

  def test_element_tail
    # skip
    element = Element.new(1)
    assert element.tail? # true if the Element is the head of the linked list
  end

  def test_element_next_default
    # skip
    element = Element.new(1)
    assert_nil element.next # second obj in the Element obj, nil if none
  end

  def test_element_next_initialization
    # skip
    element1 = Element.new(1)
    element2 = Element.new(2, element1) # create an Element that linked to another Element
    assert_equal element1, element2.next
  end

  def test_empty_list_size
    # skip
    list = SimpleLinkedList.new
    assert_equal 0, list.size # no. of objs in the List
  end

  def test_empty_list_empty
    # skip
    list = SimpleLinkedList.new
    assert list.empty? # return true if empty List
  end

  def test_pushing_element_on_list
    # skip
    list = SimpleLinkedList.new
    list.push(1) # add an Element obj with value 1 to the List
    assert_equal 1, list.size
  end

  def test_empty_list_1_element
    # skip
    list = SimpleLinkedList.new
    list.push(1)
    refute list.empty?
  end

  def test_peeking_at_list
    # skip
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.size
    assert_equal 1, list.peek # return the first(last added) Element obj's value
  end

  def test_peeking_at_empty_list
    # skip
    list = SimpleLinkedList.new
    assert_nil list.peek # if empty List, return nil
  end

  def test_access_head_element
    # skip
    list = SimpleLinkedList.new
    list.push(1)
    assert_instance_of Element, list.head # return the first(last added) Element obj
    assert_equal 1, list.head.datum
    assert list.head.tail?
  end

  def test_items_are_stacked
    # skip
    list = SimpleLinkedList.new
    list.push(1)
    list.push(2)
    assert_equal 2, list.size
    assert_equal 2, list.head.datum
    assert_equal 1, list.head.next.datum
  end

  def test_push_10_items
    # skip
    list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    assert_equal 10, list.size
    assert_equal 10, list.peek
  end

  def test_pop_1_item
    # skip
    list = SimpleLinkedList.new
    list.push(1)
    assert_equal 1, list.pop # remove the first Element obj from the List
    assert_equal 0, list.size
  end

  def test_popping_frenzy
    # skip
    list = SimpleLinkedList.new
    (1..10).each do |datum|
      list.push(datum)
    end
    6.times { list.pop }
    assert_equal 4, list.size
    assert_equal 4, list.peek
  end

  def test_from_a_empty_array
    # skip
    list = SimpleLinkedList.from_a([]) # can create a List from an Array
    assert_equal 0, list.size
    assert_nil list.peek
  end

  def test_from_a_nil
    # skip
    list = SimpleLinkedList.from_a(nil) # can create a empty List from nil
    assert_equal 0, list.size
    assert_nil list.peek
  end

  def test_from_a_2_element_array
    # skip
    list = SimpleLinkedList.from_a([1, 2]) # when create from Array, elements are `push`ed in reversal
    assert_equal 2, list.size
    assert_equal 1, list.peek
    assert_equal 2, list.head.next.datum
  end

  def test_from_a_10_items
    # skip
    list = SimpleLinkedList.from_a((1..10).to_a)
    assert_equal 10, list.size
    assert_equal 1, list.peek
    assert_equal 10, list.head.next.next.next.next.next.next.next.next.next.datum
  end

  def test_to_a_empty_list
    # skip
    list = SimpleLinkedList.new
    assert_equal [], list.to_a # covert empty List to empty Array
  end

  def test_to_a_of_1_element_list
    # skip
    list = SimpleLinkedList.from_a([1])
    assert_equal [1], list.to_a # each element of the Array is the value of the Element obj
    assert_equal 1, list.size
    assert_equal 1, list.peek
  end

  def test_to_a_of_2_element_list
    # skip
    list = SimpleLinkedList.from_a([1, 2])
    assert_equal [1, 2], list.to_a
    assert_equal 2, list.size
    assert_equal 1, list.head.datum
    assert_equal 2, list.head.next.datum
  end

  def test_reverse_2_element_list
    # skip
    list = SimpleLinkedList.from_a([1, 2])
    # list_r and list need not be the same object
    list_r = list.reverse # reverse the Elements in the List, then return a new List

    assert_equal 2, list_r.peek
    assert_equal 1, list_r.head.next.datum
    assert list_r.head.next.tail?
  end

  def test_reverse_10_element_list
    # skip
    data = (1..10).to_a
    list = SimpleLinkedList.from_a(data)
    assert_equal data.reverse, list.reverse.to_a
  end

  def test_roundtrip_10_element_array
    # skip
    data = (1..10).to_a
    assert_equal data, SimpleLinkedList.from_a(data).to_a
  end
end