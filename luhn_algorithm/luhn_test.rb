gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'luhn_validator'


class LuhnTest < Minitest::Test
  # This test suite is not meant to be exhaustive,
  # just a start. Write your own tests!

  attr_reader :validator

  def setup
    @validator = LuhnValidator.new
  end

  def test_it_can_parse_account_numbers
    assert_equal [0,5,4,3,2,1,1], validator.account_parser("112345")
  end
  def test_it_doubles_odd_indexes

    assert_equal [0,2,2,6,4], validator.multiply_odd_indexes([0,1,2,3,4])
  end

  def test_it_can_sum_double_digits
    assert_equal [1,4,7,3], validator.sum_double_digits([1,4,16,12])
  end

  def test_it_validates_the_example_account_number
    assert validator.validate('79927398713')
  end

  def test_it_finds_the_check_digit_for_an_identifier
    assert_equal '3', validator.check_digit_for('7992739871')
  end
end
