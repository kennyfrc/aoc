# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'day01'

# Test for max_calories function
class TestMaxCalories < Minitest::Test
  def test_max_calories
    assert_equal 24_000, get_max_calories('example.txt')
    assert_equal 400, get_max_calories('example2.txt')
    assert_equal 70_698, get_max_calories('input.txt')
  end
end
