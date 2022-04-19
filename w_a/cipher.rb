class Cipher
  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'

  def self.encode(input)
    chars = format(input)
    result = []
    chars.each_with_index do |char, idx|
      ltr = add_space?(idx) ? "#{encrypt(char)} " : encrypt(char)
      result << ltr
    end
    result.join.gsub(/ \z/, '')
  end

  class << self
    private

    def format(input)
      input.scan(/[a-zA-Z0-9]/).map(&:downcase)
    end

    def encrypt(char)
      return char if char.match?(/\d/)
      ALPHABET[26 - ALPHABET.index(char) - 1]
    end

    def add_space?(idx)
      (idx + 1) % 5 == 0
    end
  end
end
