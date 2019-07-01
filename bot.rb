require 'yaml'
require_relative 'wordplay'

class Bot
  attr_reader :name

  def initialize(options)
    @name = options[:name] || "Unnamed Bot"
    begin
      @data = YAML.load(File.read(options[:data_file]))
    rescue
      raise "Can't load bot data"
    end
  end


  def greeting
    random_response(:greeting)
  end


  def farewell
    random_response(:farewell)
  end

  private

  def random_response(key)
    random_index = rand(@data[:responses][key].length)
    @data[:responses][key][random_index].gsub(/\[name\]/, @name)
  end


  def response_to(input)
    prepared_input = preprocess(input.downcase)
    sentence = best_sentence(prepared_input)
  end


  private

  def preprocess(input)
    perform_substitutions(input)
  end


  private

  def perform_substitutions(input)
    @data[:presubs].each { |s| input.gsub!(s[0], s[1])}
    input
  end

  def best_sentence(input)
    hot_words = @data[:responses].keys.select do |k|
      k.class == String && k =~ /^\w+$/
    end

    WordPlay.best_sentence(input.sentences, hot_words)
  end



end
