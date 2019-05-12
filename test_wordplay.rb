require 'minitest/autorun'
require_relative 'wordplay'


class TestWordPlay < MiniTest::Test

  def test_sentences
    assert_equal(['a', 'b', 'c d', 'e f g'], "a. b. c d. e f g.".sentences)
  end

  def test_sentences_choosing
    test_text = %q{Hello.This is a test of sentence separation. This is the end of the test.}

    assert_equal('This is the end of the test', test_text.sentences[2])
  end
end
