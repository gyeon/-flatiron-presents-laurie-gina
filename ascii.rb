require 'pry'
class Nox
  attr_accessor :text, :key
  # Because ascii corresponds with integers
  # HASH = (('A'..'Z').map.with_index.to_a).to_h
  START = "A".ord #65
  FINISH = "Z".ord #90

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

##### we want ascii characters 32 - 126
  # Encrypt the combination
  def encrypt
    plain_text = text
    key_text = key_cycle(key)
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.inject :+}
    result = combined.map {|num| num % (FINISH + START) }
    converted = result.map(&:chr).join("")

    puts converted
  end

  def decrypt
    plain_text = text
    key_text = key_cycle(key)
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.inject :-}
    result = combined.map {|num| (num % START) + FINISH }
    converted = result.map(&:chr).join("")
    puts converted
  end

end

test = Nox.new("i love napping", "booyah")
test.encrypt
decrypt_test = Nox.new('0@CT+;(DDG44', 'booyah')
decrypt_test.decrypt
