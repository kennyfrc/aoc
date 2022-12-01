require "minitest/autorun"
require_relative "day01"

class TestMaxCalories < Minitest::Test
  def test_get_max_calories
    assert_equal 24000, get_max_calories("example.txt")
    assert_equal 400, get_max_calories("example2.txt")
  end
end
