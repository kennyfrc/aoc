# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'day01'

# Test for max_calories function
class TestMaxCalories < Minitest::Test
  def test_max_calories
    assert_equal 24_000, max_calories('example.txt')
    assert_equal 400, max_calories('example2.txt')
    assert_equal 70_698, max_calories('input.txt')
  end

  def test_total_of_top3
    assert_equal 45_000, total_calories_of_top3('example.txt')
    assert_equal 699, total_calories_of_top3('example2.txt')
  end
end
