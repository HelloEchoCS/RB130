require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'
SimpleCov.start
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_add_raise_type_error
    assert_raises(TypeError) { @list << 4 }
    assert_raises(TypeError) { @list.add("hello") }
  end

  def test_shovel
    new_todo = Todo.new("New Todo")
    @list << new_todo
    @todos << new_todo
    assert_equal(new_todo, @list.last)
    assert_equal(4, @list.size)
    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    new_todo = Todo.new("New Todo")
    list = @list.clone
    @list << new_todo
    list.add(new_todo)
    assert_equal(list.to_a, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(3) }
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    @list.mark_done_at(1)
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_done_exclaimation
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |item| result << item }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each2
    assert_equal(@list, @list.each{})
  end

  def test_select
    @todo2.done!
    result = @list.select(&:done?)
    assert_equal([@todo2], result.to_a)
  end
end