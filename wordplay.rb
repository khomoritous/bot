class WordPlay
  def best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |s|
      s.words_length = (s.downcase.words - desired_words).length
    end
    ranked_sentences.last
  end
end

class String
  def sentences
    gsub(/\n|\r/, ' ').split(/\.\s+/)
  end


  def words
    scan(/\w[\w\'\-]*/)
  end
end

p %q{
	This is sentence splitting.
  Sentence splitting.
  Over many lines.
  }.sentences[1].words[1]

p "This is a test of words".words
