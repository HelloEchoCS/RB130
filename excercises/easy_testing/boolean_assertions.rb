require 'minitest/autorun'

class ValueTest < MiniTest::Test
  def test_value
    list = [1]
    assert_includes list, 'xyz'
  end
end