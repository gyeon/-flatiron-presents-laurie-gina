require 'pry'
class Nox
  attr_accessor :text, :key 
  HASH = (('A'..'Z').map.with_index.to_a).to_h

  def initialize(text, key)
    @text = text.upcase.split("").reject { |e| e.to_s == " " }
    @key = key.upcase.split("").reject { |e| e.to_s == " " }
  end

  # Get plaintext / key and delete all spaces

  def key_cycle(key)
    lengthened_key = []
    key.cycle do |k|
      lengthened_key << k
      break if lengthened_key.length == text.length
    end
    lengthened_key
  end

  # Convert array of text into array of integers
  def convert_to_ints(text)
    # iterate through plain text
    text.map do |letter|
      HASH[letter]
    end
  end

  # Encrypt the combination
  def encrypt
    plain_text = convert_to_ints(text)
    key_text = convert_to_ints(key_cycle(key))
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.reduce :+}
    result = combined.map {|num| num % 26}

    converted = []
    result.each do |num|
      HASH.each do |key, value|
        converted.push(key) if num == value
      end
    end
    puts converted.join("")
  end

  def decrypt
   plain_text = convert_to_ints(text)
    key_text = convert_to_ints(key_cycle(key))
    # Add plaintext and key together
    binding.pry
    combined = [plain_text, key_text].transpose.map {|num| num.reduce :-}
    result = combined.map {|num| num % 26}

    converted = []
    result.each do |num|
      HASH.each do |key, value|
        converted.push(key) if num == value
      end
    end
    puts converted
  end

end

test = Nox.new("my little pony", "marker")
test.encrypt
decrypt_test = Nox.new("YYCSXKXEGYRP", "marker")
decrypt_test.decrypt


