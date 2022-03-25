require 'minitest/autorun'
require_relative 'custom_set'

class CustomSetTest < Minitest::Test
  def test_empty
    assert_equal true, CustomSet.new.empty? # new CustomSet can call empty and return true
  end

  def test_not_empty
    # skip
    set = CustomSet.new([1]) # instantiate a new CustomSet takes an Array
    assert_equal false, set.empty?
  end

  def test_empty_does_not_contain
    # skip
    set = CustomSet.new
    assert_equal false, set.contains?(1) # check if CustomSet contains the passing in element, true if Set is empty
  end

  def test_does_contain
    # skip
    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.contains?(1)
  end

  def test_set_does_not_contain
    # skip
    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.contains?(4)
  end

  def test_subset_empty
    # skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.subset?(CustomSet.new) # See if the calling set is a subset of the argument. Any empty Set is another empty Set's subset
  end

  def test_empty_is_subset_of_non_empty
    # skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.subset?(CustomSet.new([1])) # Empty Set is the subset of a non-empty set
  end

  def test_non_empty_not_subset_of_empty
    # skip
    set = CustomSet.new([1])
    assert_equal false, set.subset?(CustomSet.new)
  end

  def test_set_is_subset_of_same_set_of_elements
    # skip
    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.subset?(CustomSet.new([1, 2, 3])) # Sets with identical elements are subset to each other
  end

  def test_set_is_subset_of_larger_set
    # skip
    set = CustomSet.new([1, 2, 3])
    assert_equal true, set.subset?(CustomSet.new([4, 1, 2, 3]))
  end

  def test_not_subset_when_different_elements
    # skip
    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.subset?(CustomSet.new([4, 1, 3]))
  end

  def test_disjoint_empty_set
    # skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.disjoint?(CustomSet.new) # See if two Sets have any elements in common, true if none
  end

  def test_disjoint_empty_and_non_empty
    # skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.disjoint?(CustomSet.new([1]))
  end

  def test_disjoint_non_empty_and_empty
    # skip
    set = CustomSet.new([1])
    assert_equal true, set.disjoint?(CustomSet.new)
  end

  def test_disjoint_shared_element
    # skip
    set = CustomSet.new([1, 2])
    assert_equal false, set.disjoint?(CustomSet.new([2, 3]))
  end

  def test_disjoint_no_shared_elements
    # skip
    set = CustomSet.new([1, 2])
    assert_equal true, set.disjoint?(CustomSet.new([3, 4]))
  end

  def test_eql_empty
    # skip
    empty_set = CustomSet.new
    assert_equal true, empty_set.eql?(CustomSet.new) # compare two Set's elements, regardless of their order or recurrance. True if have same elements, or both empty
  end

  def test_eql_empty_and_non_empty
    # skip
    empty_set = CustomSet.new
    assert_equal false, empty_set.eql?(CustomSet.new([1, 2, 3]))
  end

  def test_eql_non_empty_and_empty
    # skip
    empty_set = CustomSet.new([1, 2, 3])
    assert_equal false, empty_set.eql?(CustomSet.new)
  end

  def test_eql_same_elements
    # skip
    set = CustomSet.new([1, 2])
    assert_equal true, set.eql?(CustomSet.new([2, 1]))
  end

  def test_eql_different_elements
    # skip
    set = CustomSet.new([1, 2, 3])
    assert_equal false, set.eql?(CustomSet.new([1, 2, 4]))
  end

  def test_eql_duplicate_elements_do_not_matter
    # skip
    set = CustomSet.new([1, 2, 2, 1])
    assert_equal true, set.eql?(CustomSet.new([2, 1])) # uniq!
  end

  def test_add_to_empty
    # skip
    set = CustomSet.new
    set.add(3)
    assert_equal CustomSet.new([3]), set # custom == method, true if same elements, alias to eql?
  end

  def test_add_to_non_empty
    # skip
    set = CustomSet.new([1, 2, 4]).add(3)
    expected = CustomSet.new([1, 2, 4, 3])
    assert_equal expected, set
  end

  def test_add_existing_element
    # skip
    set = CustomSet.new([1, 2, 3]).add(3)
    expected = CustomSet.new([1, 2, 3])
    assert_equal expected, set
  end

  def test_intersection_empty
    # skip
    set = CustomSet.new.intersection(CustomSet.new) # return a new set that contains common elements between two Sets. both empty return a empty Set
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_empty_and_non_empty
    # skip
    set = CustomSet.new.intersection(CustomSet.new([3, 2, 5])) # if no common elements, return an empty Set
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_non_empty_and_empty
    # skip
    set = CustomSet.new([3, 2, 5]).intersection(CustomSet.new)
    expected = CustomSet.new
    assert_equal expected, set
  end

  def test_intersection_no_shared_elements
    # skip
    first_set = CustomSet.new([1, 2, 3])
    second_set = CustomSet.new([4, 5, 6])
    actual = first_set.intersection(second_set)
    expected = CustomSet.new

    assert_equal expected, actual
  end

  def test_intersection_shared_elements
    # skip
    first_set = CustomSet.new([1, 2, 3, 4])
    second_set = CustomSet.new([3, 2, 5])
    actual = first_set.intersection(second_set)
    expected = CustomSet.new([2, 3])

    assert_equal expected, actual
  end

  def test_difference_empty
    # skip
    actual = CustomSet.new.difference(CustomSet.new) # returns a new set that contains elements that exist in calling Set but not in the argument. empty Sets return an empty Set
    assert_equal CustomSet.new, actual
  end

  def test_difference_empty_and_non_empty
    # skip
    actual = CustomSet.new.difference(CustomSet.new([3, 2, 5]))
    expected = CustomSet.new
    assert_equal expected, actual
  end

  def test_difference_non_empty_and_empty
    # skip
    actual = CustomSet.new([1, 2, 3, 4]).difference(CustomSet.new)
    expected = CustomSet.new([1, 2, 3, 4])
    assert_equal expected, actual
  end

  def test_difference_non_empty_sets
    # skip
    actual = CustomSet.new([3, 2, 1]).difference(CustomSet.new([2, 4]))
    expected = CustomSet.new([3, 1])
    assert_equal expected, actual
  end

  def test_union_empty
    # skip
    actual = CustomSet.new.union(CustomSet.new) # combine elements from two Sets together then return a new Set
    expected = CustomSet.new
    assert_equal expected, actual
  end

  def test_union_empty_and_non_empty
    # skip
    actual = CustomSet.new.union(CustomSet.new([2]))
    expected = CustomSet.new([2])
    assert_equal expected, actual
  end

  def test_union_non_empty_and_empty
    # skip
    actual = CustomSet.new([1, 3]).union(CustomSet.new)
    expected = CustomSet.new([1, 3])
    assert_equal expected, actual
  end

  def test_union_non_empty_sets
    # skip
    actual = CustomSet.new([1, 3]).union(CustomSet.new([2, 3]))
    expected = CustomSet.new([1, 2, 3])
    assert_equal expected, actual
  end
end