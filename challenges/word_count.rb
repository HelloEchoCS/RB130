class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    result = {}
    words = phrase.split(/( |,)/).map do |word|
      word.gsub(/^\W*/, "").gsub(/\W*$/, "").downcase
    end.reject(&:empty?)
    words.each do |word|
      result[word] = result[word].nil? ? 1 : result[word] + 1
    end
    result
  end
end