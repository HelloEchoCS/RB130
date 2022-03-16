

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo_obj)
    if todo_obj.is_a?(Todo)
      todos << todo_obj
      return self
    else
      raise TypeError.new("Can only add Todo objects")
    end
  end
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    each(&:done!)
  end
  alias_method :mark_all_done, :done!

  def mark_all_undone
    each(&:undone!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    items_str = ""
    todos.each { |item| items_str += "#{item}\n" }
    "---- #{title} ----\n#{items_str}"
  end

  def each
    todos.each { |item| yield(item) }
    self
  end

  def select
    result = TodoList.new("Selected Todos")
    each do |item|
      result << item if yield(item)
    end
    result
  end

  def find_by_title(str)
    select { |item| item.title == str }.first
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def mark_done(str)
    each do |item|
      item.done! if item.title == str
      return item
    end
  end

  private

  attr_accessor :title, :todos
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

p list.find_by_title("AAA")
p list.find_by_title("Clean room")