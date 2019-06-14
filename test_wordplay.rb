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


  def test_dividing_sentences_into_words
    assert_equal(%w{This is a test}, 'This is a test'.words)
    assert_equal(%w{These are mostly words}, 'These are, mostly, words'.words)
  end


  def test_sentence_choice
    assert_equal('This is a great test', WordPlay.best_sentence(['This is a test', 'This is another test','This is a great test'], %w{test great this}))

    assert_equal('This is a great test', WordPlay.best_sentence(['This is a great test'], %w{still the best}))
  end

  def test_basic_pronouns
    assert_equal("i am a robot", WordPlay.switch_pronouns("you are a robot"))
    assert_equal("you are a person", WordPlay.switch_pronouns("i am a person"))
    assert_equal("i love you", WordPlay.switch_pronouns("you love me"))
  end



end
