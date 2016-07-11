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

##### we want ascii characters 32 - 126
  # Encrypt the combination
  def encrypt
    plain_text = text
    key_text = key_cycle(key)
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.inject :+}
    # The maximum added number in the line above will be 160.
    # The minimum added number will be 130.
    # Therefore,
    # result = combined.map {|num| num % (FINISH + START) }
    # converted = result.map(&:chr).join("")
    show_encrypted(combined)
  end

  def decrypt
    plain_text = text
    key_text = key_cycle(key)
    # Add plaintext and key together
    combined = [plain_text, key_text].transpose.map {|num| num.inject :-}
    show_encrypted(combined)
  end

  private

  def key_cycle(key)
    lengthened_key = []
    key.cycle do |k|
      lengthened_key << k 
      break if lengthened_key.length == text.length
    end
    lengthened_key
  end

  def show_encrypted(combined)
    combined.map {|num| num % (FINISH + START) }.map(&:chr).join("")
  end
end

test = Nox.new("i love napping three times a day", "booyah")
test.encrypt
decrypt_test = Nox.new("0@CT+;(DDG44;<FC+A0A9Q'1(M", "booyah")
puts decrypt_test.decrypt
