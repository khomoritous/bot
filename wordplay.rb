class WordPlay

  def self.best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - desired_words).length
    end
    ranked_sentences.last
  end


  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Your|My)\b/i) do |pronoun|
      case pronoun.downcase
      when "i"
        "you"
      when "you"
        "I"
      when "i am"
        "you are"
      when "your"
        "my"
      when "my"
        "your"
      end
    end.sub(/^me\b/i, 'i')
  end

end

class String
  def sentences
    gsub(/\n|\r/, ' ').split(/\.\s*/)
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

puts WordPlay.best_sentence(['This is a great test'], %w{still the best})


#puts WordPlay.switch_pronouns("Your cat is fighting with my cat")
