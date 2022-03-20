class Tree
  include Enumerable

  def each
    # yield to a block and pass in each element of the collection
  end
end

p Tree.instance_methods