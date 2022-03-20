require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'cash_register'
require_relative 'transaction'

Minitest::Reporters.use!

class CashRegisterTest < MiniTest::Test
  def setup
    @cr = CashRegister.new(100)
    @transaction = Transaction.new(10)
    @transaction.amount_paid = 10
  end

  def test_accept_money
    @cr.accept_money(@transaction)
    assert_equal(110, @cr.total_money)
  end

  def test_change
    assert_equal(0, @cr.change(@transaction))
  end

  def test_give_receipt
    expected_str = "You've paid $10.\n"
    assert_output(expected_str) { @cr.give_receipt(@transaction) }
  end
end