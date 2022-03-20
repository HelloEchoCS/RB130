require 'minitest/autorun'
# require 'minitest/reporters'
# require 'stringio'
require_relative 'transaction'

# Minitest::Reporters.use!

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    item_cost = 15
    transaction = Transaction.new(item_cost)
    test_input = StringIO.new("15\n")
    output_str = "You owe $#{item_cost}.\nHow much are you paying?\n"
    # transaction.prompt_for_payment(input: test_input)
    assert_output(output_str) { transaction.prompt_for_payment(input: test_input) }
    assert_equal(15, transaction.amount_paid)
  end
end