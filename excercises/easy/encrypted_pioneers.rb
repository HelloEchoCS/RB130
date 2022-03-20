ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.chars
names = File.read('encrypted_pioneers.txt').split("\n")

def decoder(name)
  arr = name.split(' ')
  arr.map! do |part|
    decoded = part.downcase.chars.map do |char|
      if ALPHABET.include? char
        find_char(char)
      else
        char
      end
    end
    decoded.join('').capitalize
  end
  arr.join(' ')
end

def find_char(char)
  idx = ALPHABET.index(char)
  if idx < 13
    ALPHABET[idx + 13]
  else
    ALPHABET[idx - 13]
  end
end

def decode(names)
  names.each do |name|
    puts decoder(name)
  end
end

decode(names)