require 'minitest/autorun'
require_relative 'wordplay'


class TestWordPlay < MiniTest::Test

  def test_sentences
    assert_equal(['a', 'b', 'c d', 'e f g'], "a. b. c d. e f g.".sentences)
  end
end
