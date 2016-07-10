require 'pry'
class Nox
  attr_accessor :text, :key 
  # Because ascii corresponds with integers
  # HASH = (('A'..'Z').map.with_index.to_a).to_h
  START = "A".ord #65
  FINISH = "Z".ord - START #90

  def initialize(text, key)
    @text = text.split("").reject { |e| e.to_s == " " }.map(&:ord)
    @key = key.split("").reject { |e| e.to_s == " " }.map(&:ord)
# @text.map(&:ord) THIS IS MAGIC

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

  # # Convert array of text into array of integers
  # def convert_to_ints(text)
  #   # iterate through plain text
  #   text.map do |letter|
  #     HASH[letter]
  #   end
  # end

##### we want ascii characters 32 - 126
  # Encrypt the combination
  def encrypt
    plain_text = text
    key_text = key_cycle(key)
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.reduce :+}
    result = combined.map {|num| num % FINISH + START}

    converted = result.map(&:chr).join("")

    puts converted
  end

  def decrypt
    plain_text = text
    key_text = key_cycle(key)
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.reduce :-}
    result = combined.map {|num| (num - START) % FINISH}    
    converted = result.map(&:chr).join("")
    binding.pry
    puts converted
    # converted = []
    # result.each do |num|
    #   HASH.each do |key, value|
    #     converted.push(key) if num == value
    #   end
    # end
    # puts converted
  end



end

test = Nox.new("gina", "wow")
test.encrypt
decrypt_test = Nox.new('WQEQ', 'wow')
decrypt_test.decrypt


